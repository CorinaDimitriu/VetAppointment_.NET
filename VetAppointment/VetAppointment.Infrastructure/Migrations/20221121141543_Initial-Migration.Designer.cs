﻿// <auto-generated />
using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Migrations;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;
using VetAppointment.Infrastructure.Data;

#nullable disable

namespace VetAppointment.Infrastructure.Migrations
{
    [DbContext(typeof(DatabaseContext))]
    [Migration("20221121141543_Initial-Migration")]
    partial class InitialMigration
    {
        /// <inheritdoc />
        protected override void BuildTargetModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder.HasAnnotation("ProductVersion", "7.0.0");

            modelBuilder.Entity("VetAppointment.Domain.Appointment", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("TEXT");

                    b.Property<int>("EstimatedDurationInMinutes")
                        .HasColumnType("INTEGER");

                    b.Property<Guid?>("MedicalHistoryId1")
                        .HasColumnType("TEXT");

                    b.Property<Guid>("PetId")
                        .HasColumnType("TEXT");

                    b.Property<DateTime>("ScheduledDate")
                        .HasColumnType("TEXT");

                    b.Property<Guid>("VetId")
                        .HasColumnType("TEXT");

                    b.HasKey("Id");

                    b.HasIndex("MedicalHistoryId1");

                    b.ToTable("Appointments");
                });

            modelBuilder.Entity("VetAppointment.Domain.Drug", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("TEXT");

                    b.Property<string>("Name")
                        .HasColumnType("TEXT");

                    b.Property<float>("Quantity")
                        .HasColumnType("REAL");

                    b.Property<float>("UnitPrice")
                        .HasColumnType("REAL");

                    b.HasKey("Id");

                    b.ToTable("Drugs");
                });

            modelBuilder.Entity("VetAppointment.Domain.MedicalHistory", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("TEXT");

                    b.Property<Guid>("ClinicId")
                        .HasColumnType("TEXT");

                    b.HasKey("Id");

                    b.ToTable("MedicalHistories");
                });

            modelBuilder.Entity("VetAppointment.Domain.Pet", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("TEXT");

                    b.Property<DateTime>("Birthdate")
                        .HasColumnType("TEXT");

                    b.Property<Guid>("ClinicId")
                        .HasColumnType("TEXT");

                    b.Property<int>("Gender")
                        .HasColumnType("INTEGER");

                    b.Property<string>("Name")
                        .HasColumnType("TEXT");

                    b.Property<Guid>("OwnerId")
                        .HasColumnType("TEXT");

                    b.Property<Guid?>("PetOwnerId")
                        .HasColumnType("TEXT");

                    b.Property<int>("Race")
                        .HasColumnType("INTEGER");

                    b.Property<Guid?>("VetClinicId")
                        .HasColumnType("TEXT");

                    b.HasKey("Id");

                    b.HasIndex("PetOwnerId");

                    b.HasIndex("VetClinicId");

                    b.ToTable("Pets");
                });

            modelBuilder.Entity("VetAppointment.Domain.PetOwner", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("TEXT");

                    b.Property<string>("Address")
                        .HasColumnType("TEXT");

                    b.Property<DateTime>("Birthdate")
                        .HasColumnType("TEXT");

                    b.Property<string>("Email")
                        .HasColumnType("TEXT");

                    b.Property<int>("Gender")
                        .HasColumnType("INTEGER");

                    b.Property<string>("Name")
                        .HasColumnType("TEXT");

                    b.Property<string>("Phone")
                        .HasColumnType("TEXT");

                    b.Property<string>("Surname")
                        .HasColumnType("TEXT");

                    b.HasKey("Id");

                    b.ToTable("PetOwners");
                });

            modelBuilder.Entity("VetAppointment.Domain.PrescribedDrug", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("TEXT");

                    b.Property<Guid>("DrugId")
                        .HasColumnType("TEXT");

                    b.Property<Guid>("DrugToPrescribeId")
                        .HasColumnType("TEXT");

                    b.Property<float>("Quantity")
                        .HasColumnType("REAL");

                    b.Property<float>("TotalCost")
                        .HasColumnType("REAL");

                    b.Property<Guid?>("TreatmentId")
                        .HasColumnType("TEXT");

                    b.HasKey("Id");

                    b.HasIndex("TreatmentId");

                    b.ToTable("PrescribedDrugs");
                });

            modelBuilder.Entity("VetAppointment.Domain.Treatment", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("TEXT");

                    b.Property<string>("Description")
                        .HasColumnType("TEXT");

                    b.HasKey("Id");

                    b.ToTable("Treatments");
                });

            modelBuilder.Entity("VetAppointment.Domain.Vet", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("TEXT");

                    b.Property<DateTime>("Birthdate")
                        .HasColumnType("TEXT");

                    b.Property<Guid>("ClinicId")
                        .HasColumnType("TEXT");

                    b.Property<string>("Email")
                        .HasColumnType("TEXT");

                    b.Property<int>("Gender")
                        .HasColumnType("INTEGER");

                    b.Property<string>("Name")
                        .HasColumnType("TEXT");

                    b.Property<string>("Phone")
                        .HasColumnType("TEXT");

                    b.Property<int>("Specialisation")
                        .HasColumnType("INTEGER");

                    b.Property<string>("Surname")
                        .HasColumnType("TEXT");

                    b.Property<Guid?>("VetClinicId")
                        .HasColumnType("TEXT");

                    b.HasKey("Id");

                    b.HasIndex("VetClinicId");

                    b.ToTable("Vets");
                });

            modelBuilder.Entity("VetAppointment.Domain.VetClinic", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("TEXT");

                    b.Property<string>("Address")
                        .HasColumnType("TEXT");

                    b.Property<string>("ContactEmail")
                        .HasColumnType("TEXT");

                    b.Property<string>("ContactPhone")
                        .HasColumnType("TEXT");

                    b.Property<Guid>("MedicalHistoryId")
                        .HasColumnType("TEXT");

                    b.Property<string>("Name")
                        .HasColumnType("TEXT");

                    b.Property<int>("NumberOfPlaces")
                        .HasColumnType("INTEGER");

                    b.Property<DateTime>("RegistrationDate")
                        .HasColumnType("TEXT");

                    b.HasKey("Id");

                    b.ToTable("VetClinics");

                    b.HasData(
                        new
                        {
                            Id = new Guid("a3a1ba36-550c-48aa-a6e6-8c50bfb3a1e3"),
                            Address = "Str. 1 Decembrie Nr. 25",
                            ContactEmail = "contact@casa_animalelor.com",
                            ContactPhone = "+40712345678",
                            MedicalHistoryId = new Guid("00000000-0000-0000-0000-000000000000"),
                            Name = "Casa Animalelor",
                            NumberOfPlaces = 124,
                            RegistrationDate = new DateTime(2022, 11, 21, 16, 15, 43, 174, DateTimeKind.Local).AddTicks(4603)
                        },
                        new
                        {
                            Id = new Guid("be94290a-fb6a-4268-8c69-625921fdb7c6"),
                            Address = "Str. Primaverii Nr. 15",
                            ContactEmail = "contact@zoo_vet.com",
                            ContactPhone = "+40778945612",
                            MedicalHistoryId = new Guid("00000000-0000-0000-0000-000000000000"),
                            Name = "Zoo-Vet",
                            NumberOfPlaces = 64,
                            RegistrationDate = new DateTime(2022, 11, 21, 16, 15, 43, 174, DateTimeKind.Local).AddTicks(4807)
                        });
                });

            modelBuilder.Entity("VetAppointment.Domain.Appointment", b =>
                {
                    b.HasOne("VetAppointment.Domain.MedicalHistory", null)
                        .WithMany("Appointments")
                        .HasForeignKey("MedicalHistoryId1");
                });

            modelBuilder.Entity("VetAppointment.Domain.Pet", b =>
                {
                    b.HasOne("VetAppointment.Domain.PetOwner", null)
                        .WithMany("Pets")
                        .HasForeignKey("PetOwnerId");

                    b.HasOne("VetAppointment.Domain.VetClinic", null)
                        .WithMany("Pets")
                        .HasForeignKey("VetClinicId");
                });

            modelBuilder.Entity("VetAppointment.Domain.PrescribedDrug", b =>
                {
                    b.HasOne("VetAppointment.Domain.Treatment", null)
                        .WithMany("PrescribedDrugs")
                        .HasForeignKey("TreatmentId");
                });

            modelBuilder.Entity("VetAppointment.Domain.Vet", b =>
                {
                    b.HasOne("VetAppointment.Domain.VetClinic", null)
                        .WithMany("Vets")
                        .HasForeignKey("VetClinicId");
                });

            modelBuilder.Entity("VetAppointment.Domain.MedicalHistory", b =>
                {
                    b.Navigation("Appointments");
                });

            modelBuilder.Entity("VetAppointment.Domain.PetOwner", b =>
                {
                    b.Navigation("Pets");
                });

            modelBuilder.Entity("VetAppointment.Domain.Treatment", b =>
                {
                    b.Navigation("PrescribedDrugs");
                });

            modelBuilder.Entity("VetAppointment.Domain.VetClinic", b =>
                {
                    b.Navigation("Pets");

                    b.Navigation("Vets");
                });
#pragma warning restore 612, 618
        }
    }
}
