using VetAppointment.API.Mappers;
using VetAppointment.Application.Mappers;
using VetAppointment.Application.Response;
using VetAppointment.Domain;

namespace VetAppointment.Application.Queries
{
    public class RegisterPetsToOwnerOueryHandler
    {
        private readonly IRepository<PetOwner> repository;
        private readonly IRepository<Pet> repositoryPet;

        public RegisterPetsToOwnerOueryHandler(IRepository<PetOwner> repository, IRepository<Pet> repositoryPet)
        {
            this.repository = repository;
            this.repositoryPet = repositoryPet;
        }

        //todo
        public async Task<PetOwnerResponse> Handle(RegisterPetsToOwnerQuery request, CancellationToken cancellationToken)
        {
            var owner = repository.Get(request.Id).Result;

            var pets = request.CreatePetCommands.Select(PetMapper.Mapper.Map<Pet>).ToList();

            var result1 = owner.RegisterPetsToOwner(pets);

            pets.ForEach(p => repositoryPet.Add(p));

            return null;
        }
    }
}
