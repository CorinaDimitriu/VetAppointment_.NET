using System.Diagnostics.CodeAnalysis;

namespace VetAppointment.Infrastructure.Queries
{
    [ExcludeFromCodeCoverage]
    public static class DrugQueries
    {
        public static string AllDrugs => "SELECT * FROM [Drug] (NOLOCK)";

        public static string DrugById => "SELECT * FROM [Drug] WHERE [Id]=@Id";

        public static string AddDrug =>
            @"INSERT INTO [Drug] ([Name],[Quantity], [UnitPrice]) 
                        VALUES (@Name, @Quantity, @UnitPrice)";

        public static string UpdateDrug =>
            @"UPDATE [Drug]
              SET [Name] = @Name,
                  [Quantity] = @Quantity,
                  [UnitPrice] = @UnitPrice
             WHERE [Id] = @Id";

        public static string DeleteDrug => "DELETE FROM [Drug] WHERE [Id] = @Id";
    }
}