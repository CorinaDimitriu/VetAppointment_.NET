using Microsoft.EntityFrameworkCore;
using System.Data;
using System.Data.SqlClient;
using VetAppointment.Domain;
using VetAppointment.Infrastructure.Data;
using VetAppointment.Infrastructure.Queries;
using Dapper;
using Microsoft.Extensions.Configuration;


namespace VetAppointment.Infrastructure.Repositories.GenericRepositories
{
    public class DrugRepositoryDapper : Repository<Drug>
    {
        private DatabaseContext _databaseContext;
        public DrugRepositoryDapper(DatabaseContext context) : base(context)
        {
            _databaseContext = context;
        }

        public override async Task<Drug> Add(Drug entity)
        {
            using (IDbConnection connection = new SqlConnection(_databaseContext.Database.GetConnectionString()))
            {
                connection.Open();
                var result = await connection.ExecuteAsync(DrugQueries.AddDrug, entity);
                return entity;
            }
        }

        public override async Task<Drug> Update(Drug entity)
        {
            _databaseContext.Update(entity);
            await _databaseContext.SaveChangesAsync();
            return entity;
        }

        public override async Task<Drug> Get(Guid id)
        {
            using (IDbConnection connection = new SqlConnection(_databaseContext.Database.GetConnectionString()))
            {
                connection.Open();
                var result = await connection.QuerySingleOrDefaultAsync<Drug>(DrugQueries.DrugById, new { Id = id });
                return result;
            }
        }

        public override async Task Delete(Drug entity)
        {
            using (IDbConnection connection = new SqlConnection(_databaseContext.Database.GetConnectionString()))
            {
                connection.Open();
                var result = await connection.ExecuteAsync(DrugQueries.UpdateDrug, new { Id = entity.Id });
            }
        }

        public override async Task<IEnumerable<Drug>> All()
        {
            using (IDbConnection connection = new SqlConnection(_databaseContext.Database.GetConnectionString()))
            {
                connection.Open();
                var result = await connection.QueryAsync<Drug>(DrugQueries.AllDrugs);
                return result.ToList();
            }
        }
    }
}