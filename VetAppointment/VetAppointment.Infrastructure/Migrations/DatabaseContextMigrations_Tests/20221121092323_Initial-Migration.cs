using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

#pragma warning disable CA1814 // Prefer jagged arrays over multidimensional

namespace VetAppointment.Infrastructure.Migrations.DatabaseContextMigrationsTests
{
    /// <inheritdoc />
    public partial class InitialMigration : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Appointments_Tests",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "TEXT", nullable: false),
                    VetId = table.Column<Guid>(type: "TEXT", nullable: false),
                    PetId = table.Column<Guid>(type: "TEXT", nullable: false),
                    ScheduledDate = table.Column<DateTime>(type: "TEXT", nullable: false),
                    EstimatedDurationInMinutes = table.Column<int>(type: "INTEGER", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Appointments_Tests", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "PetOwners_Tests",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "TEXT", nullable: false),
                    Address = table.Column<string>(type: "TEXT", nullable: true),
                    Email = table.Column<string>(type: "TEXT", nullable: true),
                    Phone = table.Column<string>(type: "TEXT", nullable: true),
                    Name = table.Column<string>(type: "TEXT", nullable: true),
                    Surname = table.Column<string>(type: "TEXT", nullable: true),
                    Birthdate = table.Column<DateTime>(type: "TEXT", nullable: false),
                    Gender = table.Column<int>(type: "INTEGER", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_PetOwners_Tests", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "VetClinics_Tests",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "TEXT", nullable: false),
                    Name = table.Column<string>(type: "TEXT", nullable: true),
                    Address = table.Column<string>(type: "TEXT", nullable: true),
                    NumberOfPlaces = table.Column<int>(type: "INTEGER", nullable: false),
                    ContactEmail = table.Column<string>(type: "TEXT", nullable: true),
                    ContactPhone = table.Column<string>(type: "TEXT", nullable: true),
                    RegistrationDate = table.Column<DateTime>(type: "TEXT", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_VetClinics_Tests", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Pets_Tests",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "TEXT", nullable: false),
                    Name = table.Column<string>(type: "TEXT", nullable: true),
                    Birthdate = table.Column<DateTime>(type: "TEXT", nullable: false),
                    Race = table.Column<int>(type: "INTEGER", nullable: false),
                    Gender = table.Column<int>(type: "INTEGER", nullable: false),
                    OwnerId = table.Column<Guid>(type: "TEXT", nullable: false),
                    ClinicId = table.Column<Guid>(type: "TEXT", nullable: false),
                    PetOwnerId = table.Column<Guid>(type: "TEXT", nullable: true),
                    VetClinicId = table.Column<Guid>(type: "TEXT", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Pets_Tests", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Pets_Tests_PetOwners_Tests_PetOwnerId",
                        column: x => x.PetOwnerId,
                        principalTable: "PetOwners_Tests",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK_Pets_Tests_VetClinics_Tests_VetClinicId",
                        column: x => x.VetClinicId,
                        principalTable: "VetClinics_Tests",
                        principalColumn: "Id");
                });

            migrationBuilder.CreateTable(
                name: "Vets_Tests",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "TEXT", nullable: false),
                    Email = table.Column<string>(type: "TEXT", nullable: true),
                    Phone = table.Column<string>(type: "TEXT", nullable: true),
                    ClinicId = table.Column<Guid>(type: "TEXT", nullable: false),
                    VetClinicId = table.Column<Guid>(type: "TEXT", nullable: true),
                    Name = table.Column<string>(type: "TEXT", nullable: true),
                    Surname = table.Column<string>(type: "TEXT", nullable: true),
                    Birthdate = table.Column<DateTime>(type: "TEXT", nullable: false),
                    Gender = table.Column<int>(type: "INTEGER", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Vets_Tests", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Vets_Tests_VetClinics_Tests_VetClinicId",
                        column: x => x.VetClinicId,
                        principalTable: "VetClinics_Tests",
                        principalColumn: "Id");
                });

            migrationBuilder.InsertData(
                table: "VetClinics_Tests",
                columns: new[] { "Id", "Address", "ContactEmail", "ContactPhone", "Name", "NumberOfPlaces", "RegistrationDate" },
                values: new object[,]
                {
                    { new Guid("51972eae-dabc-4c35-989e-11964a3c55ac"), "Str. 1 Decembrie Nr. 25", "contact@casa_animalelor.com", "+40712345678", "Casa Animalelor", 124, new DateTime(2022, 11, 21, 11, 23, 23, 732, DateTimeKind.Local).AddTicks(2295) },
                    { new Guid("ffd55efd-c629-4404-a181-215eb37f66a5"), "Str. Primaverii Nr. 15", "contact@zoo_vet.com", "+40778945612", "Zoo-Vet", 64, new DateTime(2022, 11, 21, 11, 23, 23, 732, DateTimeKind.Local).AddTicks(2368) }
                });

            migrationBuilder.CreateIndex(
                name: "IX_Pets_Tests_PetOwnerId",
                table: "Pets_Tests",
                column: "PetOwnerId");

            migrationBuilder.CreateIndex(
                name: "IX_Pets_Tests_VetClinicId",
                table: "Pets_Tests",
                column: "VetClinicId");

            migrationBuilder.CreateIndex(
                name: "IX_Vets_Tests_VetClinicId",
                table: "Vets_Tests",
                column: "VetClinicId");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Appointments_Tests");

            migrationBuilder.DropTable(
                name: "Pets_Tests");

            migrationBuilder.DropTable(
                name: "Vets_Tests");

            migrationBuilder.DropTable(
                name: "PetOwners_Tests");

            migrationBuilder.DropTable(
                name: "VetClinics_Tests");
        }
    }
}
