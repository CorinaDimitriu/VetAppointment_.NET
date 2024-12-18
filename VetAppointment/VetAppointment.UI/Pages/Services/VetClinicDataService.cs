﻿using System.Text;
using System.Text.Json;
using VetAppointment.Shared.Domain;
using VetAppointment.UI.Pages.Models;

#nullable disable
namespace VetAppointment.UI.Pages.Services
{
    public class VetClinicDataService : IVetClinicDataService
    {
        private const string version = "v1";
        private const string ApiURL = $"https://localhost:7112/{version}/api/vetclinics";
        private readonly HttpClient httpClient;

        public VetClinicDataService(HttpClient httpClient)
        {
            this.httpClient = httpClient;
        }

        public async Task<IEnumerable<VetClinic>> GetAllClinics()
        {
            return await JsonSerializer.DeserializeAsync<IEnumerable<VetClinic>>(
                await httpClient.GetStreamAsync(ApiURL),
                new JsonSerializerOptions()
                { PropertyNameCaseInsensitive = true });
        }

        public async Task<string> AddClinic(VetClinic clinic, string jwt)
        {
            var options = new JsonSerializerOptions() { PropertyNameCaseInsensitive = true };
            var json = JsonSerializer.Serialize(clinic);
            httpClient.DefaultRequestHeaders.Authorization =
                new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", jwt);
            var response = await httpClient.PostAsync
                    (ApiURL, new StringContent(json, Encoding.UTF8, "application/json"));
            //response.EnsureSuccessStatusCode();
            if (!response.IsSuccessStatusCode)
                return "Unauthorized";
            return response.Content.ToString();
        }

        public async Task<string> AddVetToClinic(Guid clinicId, VetModel vet, string jwt)
        {
            var ApiURLClinic = $"{ApiURL}/{{{clinicId}}}/vet";
            var vetDto = new Vet()
            {
                Name = vet.Name,
                Surname = vet.Surname,
                Birthdate = vet.Birthdate.ToString(),
                Gender = vet.Gender,
                Email = vet.Email,
                Phone = vet.Phone,
                Specialisation = vet.Specialisation[0]
            };
            var json = JsonSerializer.Serialize(vetDto);
            httpClient.DefaultRequestHeaders.Authorization =
                new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", jwt);
            var response = await httpClient.PostAsync
                    (ApiURLClinic, new StringContent(json, Encoding.UTF8, "application/json"));
            //response.EnsureSuccessStatusCode();
            if (!response.IsSuccessStatusCode)
                return "Unauthorized";
            return response.Content.ToString();
        }

        public async Task<VetClinic> GetClinicById(Guid id)
        {
            return await JsonSerializer.DeserializeAsync<VetClinic>(
                await httpClient.GetStreamAsync($"{ApiURL}/{id}"),
                new JsonSerializerOptions()
                { PropertyNameCaseInsensitive = true });
        }

        public async Task<string> UpdateClinic(Guid clinicId, ClinicModel clinic, string jwt)
        {
            var ApiURLClinic = $"{ApiURL}/{{{clinicId}}}";
            var vetClinic = new VetClinic()
            {
                Name = clinic.Name,
                Address = clinic.Address,
                ContactPhone = clinic.ContactPhone,
                ContactEmail = clinic.ContactEmail,
                NumberOfPlaces = clinic.NumberOfPlaces
            };
            var json = JsonSerializer.Serialize(vetClinic);
            httpClient.DefaultRequestHeaders.Authorization =
                new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", jwt);
            var response = await httpClient.PutAsync
                    (ApiURLClinic, new StringContent(json, UnicodeEncoding.UTF8, "application/json"));
            //response.EnsureSuccessStatusCode();
            if (!response.IsSuccessStatusCode)
                return "Unauthorized";
            return response.Content.ToString();
        }

        public async Task<string> DeleteClinicById(Guid clinicId, string jwt)
        {
            var ApiURLClinic = $"{ApiURL}/{{{clinicId}}}";
            httpClient.DefaultRequestHeaders.Authorization =
                new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", jwt);
            var response = await httpClient.DeleteAsync(ApiURLClinic);
            //response.EnsureSuccessStatusCode();
            if (!response.IsSuccessStatusCode)
                return "Unauthorized";
            return response.Content.ToString();
        }

        public async Task<string> AddPetsToClinic(Guid clinicId, Guid ownerId, List<Pet> pets)
        {
            var ApiURLClinic = $"{ApiURL}/{{{clinicId}}}/{{{ownerId}}}/pets";
            var json = JsonSerializer.Serialize(pets);
            var response = await httpClient.PostAsync(ApiURLClinic,
                new StringContent(json, Encoding.UTF8, "application/json"));
            //response.EnsureSuccessStatusCode();
            return response.Content.ReadAsStringAsync().Result;
        }

        public async Task<IEnumerable<Vet>> GetVetsByClinicId(Guid clinicId)
        {
            var ApiURLClinic = $"{ApiURL}/{{{clinicId}}}/vets";
            return await JsonSerializer.DeserializeAsync<IEnumerable<Vet>>(
                await httpClient.GetStreamAsync(ApiURLClinic),
                new JsonSerializerOptions()
                { PropertyNameCaseInsensitive = true });
        }

        public async Task<IEnumerable<Pet>> GetPetsByClinicId(Guid clinicId)
        {
            var ApiURLClinic = $"{ApiURL}/{{{clinicId}}}/pets";
            return await JsonSerializer.DeserializeAsync<IEnumerable<Pet>>(
                await httpClient.GetStreamAsync(ApiURLClinic),
                new JsonSerializerOptions()
                { PropertyNameCaseInsensitive = true });
        }

        public async Task<IEnumerable<Appointment>> GetAppointmentsByClinicId(Guid clinicId)
        {
            var ApiURLClinic = $"{ApiURL}/{{{clinicId}}}/appointments";
            return await JsonSerializer.DeserializeAsync<IEnumerable<Appointment>>(
                await httpClient.GetStreamAsync(ApiURLClinic),
                new JsonSerializerOptions()
                { PropertyNameCaseInsensitive = true });
        }

        public async Task<string> DeleteVetById(VetToDeleteModel vet, string jwt)
        {
            var clinicId = Guid.Parse(vet.IdToDeleteClinic);
            var vetId = Guid.Parse(vet.IdToDeleteVet);
            var ApiURLClinic = $"{ApiURL}/{{{clinicId}}}/vet/{{{vetId}}}";
            httpClient.DefaultRequestHeaders.Authorization =
                new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", jwt);
            var response = await httpClient.DeleteAsync(ApiURLClinic);
            //response.EnsureSuccessStatusCode();
            if (!response.IsSuccessStatusCode)
                return "Unauthorized";
            return response.Content.ToString();
        }

        public async Task<string> DeletePetById(PetToDeleteModel pet)
        {
            var clinicId = Guid.Parse(pet.IdToDeleteClinic);
            var petId = Guid.Parse(pet.IdToDeletePet);
            var ApiURLClinic = $"{ApiURL}/{{{clinicId}}}/pet/{{{petId}}}";
            var response = await httpClient.DeleteAsync(ApiURLClinic);
            response.EnsureSuccessStatusCode();
            return response.Content.ToString();
        }

        public async Task<string> UpdatePetById(Guid clinicId, Guid petId, PetToUpdateModel pet)
        {
            var ApiURLClinic = $"{ApiURL}/{{{clinicId}}}/pet/{{{petId}}}";
            var petRenewed = new Pet()
            {
                Name = pet.Name,
                Birthdate = pet.Birthdate.ToString(),
                Gender = pet.Gender,
                Race = pet.Race[0]
            };
            var json = JsonSerializer.Serialize(petRenewed);
            var response = await httpClient.PutAsync
                    (ApiURLClinic, new StringContent(json, UnicodeEncoding.UTF8, "application/json"));
            response.EnsureSuccessStatusCode();
            return response.Content.ToString();
        }

        public async Task<string> UpdateVetById(Guid clinicId, Guid vetId, VetModel vet, string jwt)
        {
            var ApiURLClinic = $"{ApiURL}/{{{clinicId}}}/vet/{{{vetId}}}";
            var vetRenewed = new Vet()
            {
                Name = vet.Name,
                Surname = vet.Surname,
                Birthdate = vet.Birthdate.ToString(),
                Specialisation = vet.Specialisation[0],
                Gender = vet.Gender,
                Email = vet.Email,
                Phone = vet.Phone
            };
            var json = JsonSerializer.Serialize(vetRenewed);
            httpClient.DefaultRequestHeaders.Authorization =
                new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", jwt);
            var response = await httpClient.PutAsync
                    (ApiURLClinic, new StringContent(json, UnicodeEncoding.UTF8, "application/json"));
            //response.EnsureSuccessStatusCode();
            if (!response.IsSuccessStatusCode)
                return "Unauthorized";
            return response.Content.ToString();
        }

        public async Task<string> AddAppointmentToClinic(Guid clinicId, AppointmentModel appointment)
        {
            var ApiURLClinic = $"{ApiURL}/{{{clinicId}}}/appointment";
            var appointmentDto = new Appointment
            {
                VetId = Guid.Parse(appointment.VetId[0]),
                PetId = Guid.Parse(appointment.PetId[0]),
                TreatmentId = Guid.Parse(appointment.TreatmentId[0]),
                EstimatedDurationInMinutes = appointment.EstimatedDurationInMinutes,
                ScheduledDate = appointment.ScheduledDate.ToString()
            };
            var json = JsonSerializer.Serialize(appointmentDto);
            var response = await httpClient.PostAsync
                    (ApiURLClinic, new StringContent(json, Encoding.UTF8, "application/json"));
            //response.EnsureSuccessStatusCode();
            return response.Content.ReadAsStringAsync().Result;
        }
    }
}
