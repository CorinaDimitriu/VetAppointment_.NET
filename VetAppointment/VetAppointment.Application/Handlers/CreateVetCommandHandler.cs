using MediatR;
using VetAppointment.Application.Commands.Vets;
using VetAppointment.Application.Response;
using VetAppointment.Domain;
using VetAppointment.Mappers;

#nullable disable
namespace VetAppointment.Application.Handlers
{
    public class CreateVetCommandHandler : IRequestHandler<CreateVetCommand, VetResponse> 
    {
        private readonly IRepository<Vet> repository;

        public CreateVetCommandHandler(IRepository<Vet> repository) => this.repository = repository;
    
        public async Task<VetResponse> Handle(CreateVetCommand command, CancellationToken cancellationToken)
        {
            var vet = VetMapper.Mapper.Map<Vet>(command);
            if (vet == null)
            {
                return null;
            }

            var response = await repository.Add(vet);
            return VetMapper.Mapper.Map<VetResponse>(response);
        }
    }
}
