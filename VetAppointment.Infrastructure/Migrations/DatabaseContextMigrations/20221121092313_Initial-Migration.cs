using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

#pragma warning disable CA1814 // Prefer jagged arrays over multidimensional

namespace VetAppointment.Infrastructure.Migrations.DatabaseContextMigrations
{
    /// <inheritdoc />
    public partial class InitialMigration : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Appointments",
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
                    table.PrimaryKey("PK_Appointments", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "PetOwners",
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
                    table.PrimaryKey("PK_PetOwners", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "VetClinics",
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
                    table.PrimaryKey("PK_VetClinics", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Pets",
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
                    table.PrimaryKey("PK_Pets", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Pets_PetOwners_PetOwnerId",
                        column: x => x.PetOwnerId,
                        principalTable: "PetOwners",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK_Pets_VetClinics_VetClinicId",
                        column: x => x.VetClinicId,
                        principalTable: "VetClinics",
                        principalColumn: "Id");
                });

            migrationBuilder.CreateTable(
                name: "Vets",
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
                    table.PrimaryKey("PK_Vets", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Vets_VetClinics_VetClinicId",
                        column: x => x.VetClinicId,
                        principalTable: "VetClinics",
                        principalColumn: "Id");
                });

            migrationBuilder.InsertData(
                table: "VetClinics",
                columns: new[] { "Id", "Address", "ContactEmail", "ContactPhone", "Name", "NumberOfPlaces", "RegistrationDate" },
                values: new object[,]
                {
                    { new Guid("093ec5b4-7c2f-4f6f-81b1-67c2b76acc24"), "Str. 1 Decembrie Nr. 25", "contact@casa_animalelor.com", "+40712345678", "Casa Animalelor", 124, new DateTime(2022, 11, 21, 11, 23, 12, 865, DateTimeKind.Local).AddTicks(8130) },
                    { new Guid("de062a3d-6f85-43f7-9c85-90de6ba3fdf4"), "Str. Primaverii Nr. 15", "contact@zoo_vet.com", "+40778945612", "Zoo-Vet", 64, new DateTime(2022, 11, 21, 11, 23, 12, 865, DateTimeKind.Local).AddTicks(8291) }
                });

            migrationBuilder.CreateIndex(
                name: "IX_Pets_PetOwnerId",
                table: "Pets",
                column: "PetOwnerId");

            migrationBuilder.CreateIndex(
                name: "IX_Pets_VetClinicId",
                table: "Pets",
                column: "VetClinicId");

            migrationBuilder.CreateIndex(
                name: "IX_Vets_VetClinicId",
                table: "Vets",
                column: "VetClinicId");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Appointments");

            migrationBuilder.DropTable(
                name: "Pets");

            migrationBuilder.DropTable(
                name: "Vets");

            migrationBuilder.DropTable(
                name: "PetOwners");

            migrationBuilder.DropTable(
                name: "VetClinics");
        }
    }
}
