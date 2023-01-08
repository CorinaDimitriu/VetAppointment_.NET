using Microsoft.AspNetCore.Mvc;
using VetAppointment.API.Dtos;
using VetAppointment.API.Dtos.Create;
using VetAppointment.API.Mappers;
using VetAppointment.Domain;
using VetAppointment.Application;
using VetAppointment.Infrastructure.Repositories.GenericRepositories;

namespace VetAppointment.API.Controllers
{
    [Route("v{version:apiVersion}/api/[controller]")]
    [ApiController]
    [ApiVersion("1")]
    public class VetClinicsController : ControllerBase
    {
        private readonly IUnitOfWork unitOfWork;

        public VetClinicsController(IUnitOfWork unitOfWork) => this.unitOfWork = unitOfWork;

        [HttpPost]
        public IActionResult Create([FromBody] CreateVetClinicDto vetClinicDto)
        {
            var history = MedicalHistory.Create();

            var vetClinic = VetClinicMapper.Mapper.Map<VetClinic>(vetClinicDto);

            if (vetClinic == null)
            {
                return BadRequest();
            }

            history.Entity.AtachToClinic(vetClinic.Id);
            vetClinic.AttachMedicalHistory(history.Entity.Id);

            unitOfWork.MedicalHistoryRepository.Add(history.Entity);
            unitOfWork.SaveChanges();
            
            unitOfWork.VetClinicRepository.Add(vetClinic);
            unitOfWork.SaveChanges();

            Response.Headers.Add("Access-Control-Allow-Headers", "Content-Type, x-requested-with");
            Response.Headers.Add("Access-Control-Allow-Methods", "GET, POST, OPTIONS, PUT, DELETE");
            Response.Headers.Add("Access-Control-Allow-Origin", "https://localhost:7029");
            return Created(nameof(GetAllVetClinics), VetClinicMapper.Mapper.Map<VetClinicDto>(vetClinic));
        }

        // Gets - Clinic, Vets, Pets, Appointments, MedicalHistory (by vet, pet, clinic), Drug
        [HttpGet]
        public IActionResult GetAllVetClinics()
        {
            var vetClinics = unitOfWork.VetClinicRepository.All().Result.Select(VetClinicMapper.Mapper.Map<VetClinicDto>);

            Response.Headers.Add("Access-Control-Allow-Headers", "Content-Type, x-requested-with");
            Response.Headers.Add("Access-Control-Allow-Methods", "GET, POST, OPTIONS, PUT, DELETE");
            Response.Headers.Add("Access-Control-Allow-Origin", "https://localhost:7029");
            return Ok(vetClinics);
        }

        [HttpGet("{vetClinicId:guid}")]
        public IActionResult GetById(Guid vetClinicId)
        {
            var clinic = unitOfWork.VetClinicRepository.Get(vetClinicId).Result;
            if (clinic == null)
            {
                return NotFound();
            }

            Response.Headers.Add("Access-Control-Allow-Headers", "Content-Type, x-requested-with");
            Response.Headers.Add("Access-Control-Allow-Methods", "GET, POST, OPTIONS, PUT, DELETE");
            Response.Headers.Add("Access-Control-Allow-Origin", "https://localhost:7029");
            return Ok(clinic);
        }

        [HttpGet("{vetClinicId:guid}/vets")]
        public IActionResult GetVetsByClinicId(Guid vetClinicId)
        {
            var clinic = unitOfWork.VetClinicRepository.Get(vetClinicId).Result;
            if (clinic == null)
            {
                return NotFound();
            }

            var vets = clinic.Vets.Select(VetMapper.Mapper.Map<VetDto>);

            Response.Headers.Add("Access-Control-Allow-Headers", "Content-Type, x-requested-with");
            Response.Headers.Add("Access-Control-Allow-Methods", "GET, POST, OPTIONS, PUT, DELETE");
            Response.Headers.Add("Access-Control-Allow-Origin", "https://localhost:7029");
            return Ok(vets);
        }

        [HttpGet("{vetClinicId:guid}/pets")]
        public IActionResult GetPetsByClinicId(Guid vetClinicId)
        {
            var clinic = unitOfWork.VetClinicRepository.Get(vetClinicId).Result;
            if (clinic == null)
            {
                return NotFound();
            }

            var pets = clinic.Pets.Select(PetMapper.Mapper.Map<PetDto>);

            Response.Headers.Add("Access-Control-Allow-Headers", "Content-Type, x-requested-with");
            Response.Headers.Add("Access-Control-Allow-Methods", "GET, POST, OPTIONS, PUT, DELETE");
            Response.Headers.Add("Access-Control-Allow-Origin", "https://localhost:7029");
            return Ok(pets);
        }

        [HttpGet("{vetClinicId:guid}/appointments")]
        public IActionResult GetAppointmentsByClinicId(Guid vetClinicId)
        {
            var clinic = unitOfWork.VetClinicRepository.Get(vetClinicId).Result;
            if (clinic == null)
            {
                return NotFound();
            }

            var medicalHistory = unitOfWork.MedicalHistoryRepository.Get(clinic.MedicalHistoryId).Result;
            var appointments = medicalHistory.Appointments.Select(AppointmentMapper.Mapper.Map<AppointmentDto>);

            Response.Headers.Add("Access-Control-Allow-Headers", "Content-Type, x-requested-with");
            Response.Headers.Add("Access-Control-Allow-Methods", "GET, POST, OPTIONS, PUT, DELETE");
            Response.Headers.Add("Access-Control-Allow-Origin", "https://localhost:7029");
            return Ok(appointments);
        }

        // Post - Vet, Pets, Appointment, Drug

        // Old: "{vetClinicId:guid}/pets"
        [HttpPost("{vetClinicId:guid}/{petOwnerId:guid}/pets")]
        public IActionResult RegisterPetsFamily(Guid vetClinicId, Guid petOwnerId, [FromBody] List<CreatePetDto> petsDtos)
        {
            var clinic = unitOfWork.VetClinicRepository.Get(vetClinicId).Result;
            if (clinic == null)
            {
                return NotFound();
            }

            var owner = unitOfWork.PetOwnerRepository.Get(petOwnerId).Result;
            if (owner == null)
            {
                return NotFound();
            }

            var pets = petsDtos.Select(PetMapper.Mapper.Map<Pet>).ToList();
            if (pets.Any(p => p == null))
            {
                return BadRequest();
            }

            var result = clinic.RegisterPetsFamilyToClinic(pets);
            pets.ForEach(p => p.ConnectToOwner(owner));
            if (result.IsFailure)
            {
                return BadRequest(result.Error);
            }

            pets.ForEach(p => unitOfWork.PetRepository.Add(p));
            unitOfWork.VetClinicRepository.Update(clinic);

            result = owner.RegisterPetsToOwner(pets);
            if (result.IsFailure)
            {
                return BadRequest(result.Error);
            }
            unitOfWork.PetOwnerRepository.Update(owner);

            Response.Headers.Add("Access-Control-Allow-Headers", "Content-Type, x-requested-with");
            Response.Headers.Add("Access-Control-Allow-Methods", "GET, POST, OPTIONS, PUT, DELETE");
            Response.Headers.Add("Access-Control-Allow-Origin", "https://localhost:7029");
            return Created(nameof(GetPetsByClinicId), pets.Select(PetMapper.Mapper.Map<PetDto>));
        }

        [HttpPost("{vetClinicId:guid}/vet")]
        public IActionResult RegisterVet(Guid vetClinicId, [FromBody] CreateVetDto vetDto)
        {
            var clinic = unitOfWork.VetClinicRepository.Get(vetClinicId).Result;
            if (clinic == null)
            {
                return NotFound();
            }

            var doctor = VetMapper.Mapper.Map<Vet>(vetDto);
            if (doctor == null)
            {
                return BadRequest();
            }

            var result = clinic.RegisterVetToClinic(doctor);
            if (result.IsFailure)
            {
                return BadRequest(result.Error);
            }

            unitOfWork.VetClinicRepository.Update(clinic);
            unitOfWork.VetRepository.Add(doctor);

            Response.Headers.Add("Access-Control-Allow-Headers", "Content-Type, x-requested-with");
            Response.Headers.Add("Access-Control-Allow-Methods", "GET, POST, OPTIONS, PUT, DELETE");
            Response.Headers.Add("Access-Control-Allow-Origin", "https://localhost:7029");
            return Created(nameof(RegisterVet), VetMapper.Mapper.Map<VetDto>(doctor));
        }

        [HttpPost("{vetClinicId:guid}/appointment")]
        public IActionResult RegisterAppointment(Guid vetClinicId, [FromBody] CreateAppointmentDto appointmentDto)
        {
            var clinic = unitOfWork.VetClinicRepository.Get(vetClinicId).Result;
            if (clinic == null)
            {
                return NotFound();
            }

            var medicalHistory = unitOfWork.MedicalHistoryRepository.Get(clinic.MedicalHistoryId).Result;

            var pet = unitOfWork.PetRepository.Get(appointmentDto.PetId).Result;
            if (pet == null)
            {
                return NotFound();
            }

            var vet = unitOfWork.VetRepository.Get(appointmentDto.VetId).Result;
            if (vet == null)
            {
                return NotFound();
            }

            var appointment = AppointmentMapper.Mapper.Map<Appointment>(appointmentDto);
            if (appointment == null)
            {
                return BadRequest();
            }

            var vetAppointments = unitOfWork.AppointmentRepository.All().Result.Where(a => a.VetId == vet.Id).ToList();

            var newAppStartDate = appointment.ScheduledDate;
            var newAppEndDate = appointment.ScheduledDate.AddMinutes(appointment.EstimatedDurationInMinutes);
            foreach (Appointment app in vetAppointments)
            {
                var appStartDate = app.ScheduledDate;
                var appEndDate = app.ScheduledDate.AddMinutes(app.EstimatedDurationInMinutes);

                if (newAppStartDate >= appStartDate && newAppStartDate <= appEndDate ||
                    newAppEndDate >= appStartDate && newAppEndDate <= appEndDate ||
                    appStartDate >= newAppStartDate && appStartDate <= newAppEndDate ||
                    appEndDate >= newAppStartDate && appEndDate <= newAppEndDate )
                {
                    return Conflict("Vet is busy at this time");
                }
            }

            var result = medicalHistory.RegisterAppointmentToHistory(appointment);
            if (result.IsFailure)
            {
                return BadRequest(result.Error);
            }

            unitOfWork.MedicalHistoryRepository.Update(medicalHistory);
            unitOfWork.AppointmentRepository.Add(appointment);
            unitOfWork.SaveChanges();

            Response.Headers.Add("Access-Control-Allow-Headers", "Content - Type, x - requested - with");
            Response.Headers.Add("Access-Control-Allow-Methods", "GET, POST, OPTIONS, PUT, DELETE");
            Response.Headers.Add("Access-Control-Allow-Origin", "https://localhost:7029");
            return Created(nameof(RegisterAppointment), AppointmentMapper.Mapper.Map<AppointmentDto>(appointment));
        }

        [HttpPut("{vetClinicId:guid}")]
        public IActionResult Update(Guid vetClinicId, [FromBody] CreateVetClinicDto vetClinicDto)
        {
            var clinic = unitOfWork.VetClinicRepository.Get(vetClinicId).Result;
            if (clinic == null)
            {
                return NotFound();
            }

            var result = clinic.Update(vetClinicDto.Name, vetClinicDto.Address, vetClinicDto.NumberOfPlaces, 
                vetClinicDto.ContactEmail, vetClinicDto.ContactPhone);
            if (result.IsFailure)
            {
                return BadRequest(result.Error);
            }

            unitOfWork.VetClinicRepository.Update(result.Entity);
            unitOfWork.SaveChanges();

            Response.Headers.Add("Access-Control-Allow-Headers", "Content - Type, x - requested - with");
            Response.Headers.Add("Access-Control-Allow-Methods", "GET, POST, OPTIONS, PUT, DELETE");
            Response.Headers.Add("Access-Control-Allow-Origin", "https://localhost:7029");
            return NoContent();
        }

        [HttpPut("{vetClinicId:guid}/vet/{vetId:guid}")]
        public IActionResult UpdateVet(Guid vetClinicId, Guid vetId, [FromBody] CreateVetDto vetDto)
        {
            var clinic = unitOfWork.VetClinicRepository.Get(vetClinicId).Result;
            if (clinic == null)
            {
                return NotFound();
            }

            var vet = unitOfWork.VetRepository.Get(vetId).Result;
            if (vet == null)
            {
                return NotFound();
            }

            var result = vet.Update(vetDto.Name, vetDto.Surname, vetDto.Birthdate, vetDto.Gender, vetDto.Email, 
                vetDto.Phone, vetDto.Specialisation);
            if (result.IsFailure)
            {
                return BadRequest(result.Error);
            }
            
            unitOfWork.VetRepository.Update(vet);
            unitOfWork.SaveChanges();

            Response.Headers.Add("Access-Control-Allow-Headers", "Content - Type, x - requested - with");
            Response.Headers.Add("Access-Control-Allow-Methods", "GET, POST, OPTIONS, PUT, DELETE");
            Response.Headers.Add("Access-Control-Allow-Origin", "https://localhost:7029");
            return NoContent();
        }

        [HttpPut("{vetClinicId:guid}/pet/{petId:guid}")]
        public IActionResult UpdatePet(Guid vetClinicId, Guid petId, [FromBody] CreatePetDto petDto)
        {
            var clinic = unitOfWork.VetClinicRepository.Get(vetClinicId).Result;
            if (clinic == null)
            {
                return NotFound();
            }

            var pet = unitOfWork.PetRepository.Get(petId).Result;
            if (pet == null)
            {
                return NotFound();
            }

            var result = pet.Update(petDto.Name, petDto.Birthdate, petDto.Race, petDto.Gender);
            if (result.IsFailure)
            {
                return BadRequest(result.Error);
            }

            unitOfWork.PetRepository.Update(pet);
            unitOfWork.SaveChanges();

            Response.Headers.Add("Access-Control-Allow-Headers", "Content-Type, x-requested-with");
            Response.Headers.Add("Access-Control-Allow-Methods", "DELETE, GET, POST, OPTIONS, PUT");
            Response.Headers.Add("Access-Control-Allow-Origin", "https://localhost:7029");
            return NoContent();
        }

        [HttpDelete("{vetClinicId:guid}")]
        public IActionResult Delete(Guid vetClinicId)
        {
            var vetClinic = unitOfWork.VetClinicRepository.Get(vetClinicId).Result;
            if (vetClinic == null)
            {
                return NotFound();
            }

            var medicalHistorys = unitOfWork.MedicalHistoryRepository.All().Result.Where(m => m.ClinicId == vetClinicId);
            if (medicalHistorys != null)
            {
                foreach (var item in medicalHistorys)
                {
                    unitOfWork.MedicalHistoryRepository.Delete(item);
                }
            }

            var vets = unitOfWork.VetRepository.All().Result.Where(v => v.ClinicId == vetClinicId);
            if (vets != null)
            {
                foreach (var item in vets)
                {
                    unitOfWork.VetRepository.Delete(item);
                }
            }

            var pets = unitOfWork.PetRepository.All().Result.Where(p => p.ClinicId == vetClinicId);
            if (pets != null)
            {
                foreach (var item in pets)
                {
                    unitOfWork.PetRepository.Delete(item);
                }
            }

            unitOfWork.VetClinicRepository.Delete(vetClinic);
            unitOfWork.SaveChanges();

            Response.Headers.Add("Access-Control-Allow-Headers", "Content-Type, x-requested-with");
            Response.Headers.Add("Access-Control-Allow-Origin", "https://localhost:7029");
            Response.Headers.Add("Access-Control-Allow-Methods", "DELETE, GET, POST, OPTIONS, PUT");  
            return NoContent();
        }

        [HttpDelete("{vetClinicId:guid}/vet/{vetId:guid}")]
        public IActionResult DeleteVet(Guid vetClinicId, Guid vetId)
        {
            var clinic = unitOfWork.VetClinicRepository.Get(vetClinicId).Result;
            if (clinic == null)
            {
                return NotFound();
            }

            var vet = unitOfWork.VetRepository.Get(vetId).Result;
            if (vet == null)
            {
                return NotFound();
            }

            unitOfWork.VetRepository.Delete(vet);
            unitOfWork.SaveChanges();

            Response.Headers.Add("Access-Control-Allow-Headers", "Content-Type, x-requested-with");
            Response.Headers.Add("Access-Control-Allow-Methods", "GET, POST, OPTIONS, PUT, DELETE");
            Response.Headers.Add("Access-Control-Allow-Origin", "https://localhost:7029");
            return NoContent();
        }

        [HttpDelete("{vetClinicId:guid}/pet/{petId:guid}")]
        public IActionResult DeletePet(Guid vetClinicId, Guid petId)
        {
            var clinic = unitOfWork.VetClinicRepository.Get(vetClinicId).Result;
            if (clinic == null)
            {
                return NotFound();
            }

            var pet = unitOfWork.PetRepository.Get(petId).Result;
            if (pet == null)
            {
                return NotFound();
            }

            unitOfWork.PetRepository.Delete(pet);
            unitOfWork.SaveChanges();

            Response.Headers.Add("Access-Control-Allow-Headers", "Content-Type, x-requested-with");
            Response.Headers.Add("Access-Control-Allow-Methods", "GET, POST, OPTIONS, PUT, DELETE");
            Response.Headers.Add("Access-Control-Allow-Origin", "https://localhost:7029");
            return NoContent();
        }

        [HttpGet("{clinicId:guid}/vet/{vetId:guid}/appointments")]
        public IActionResult GetAppointmentsByVetId(Guid clinicId, Guid vetId)
        {
            var clinic = unitOfWork.VetClinicRepository.Get(clinicId).Result;
            if (clinic == null)
            {
                return NotFound();
            }

            //var allAppointments = clinic.Appointments.Select(AppointmentMapper.Mapper.Map<AppointmentDto>);
            var appointments = new List<AppointmentDto>();
            //allAppointments.ToList().ForEach(a => { if (a.VetId == vetId) appointments.Add(a); });

            Response.Headers.Add("Access-Control-Allow-Headers", "Content-Type, x-requested-with");
            Response.Headers.Add("Access-Control-Allow-Methods", "GET, POST, OPTIONS, PUT, DELETE");
            Response.Headers.Add("Access-Control-Allow-Origin", "https://localhost:7029");
            return Ok(appointments);
        }

        [HttpGet("{clinicId:guid}/pet/{petId:guid}/appointments")]
        public IActionResult GetAppointmentsByPetId(Guid clinicId, Guid petId)
        {
            var clinic = unitOfWork.VetClinicRepository.Get(clinicId).Result;
            if (clinic == null)
            {
                return NotFound();
            }

            var allAppointments = clinic.Appointments.Select(AppointmentMapper.Mapper.Map<AppointmentDto>);
            var appointments = new List<AppointmentDto>();
            allAppointments.ToList().ForEach(a => { if (a.PetId == petId) appointments.Add(a); });

            Response.Headers.Add("Access-Control-Allow-Headers", "Content-Type, x-requested-with");
            Response.Headers.Add("Access-Control-Allow-Methods", "GET, POST, OPTIONS, PUT, DELETE");
            Response.Headers.Add("Access-Control-Allow-Origin", "https://localhost:7029");
            return Ok(appointments);
        }
    }
}