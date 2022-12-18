using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using VetAppointment.Application.Response;
using VetAppointment.Domain;

namespace VetAppointment.Application.Queries
{
    public class GetAllPetOwnersQueryHandler : IRequestHandler<GetAllPetOwnersQuery, List<PetOwnerResponse>
    {
        private readonly IRepository<PetOwner> repository;

        public GetAllPetOwnersQueryHandler(IRepository<PetOwner> repository)
        {
            this.repository = repository;
        }
        public async Task<List<PetOwnerResponse>> Handle(GetAllPetOwnersQuery request, CancellationToken cancellationToken)
        {
            var result = PetOwnerMapper.
        }
    }
}
