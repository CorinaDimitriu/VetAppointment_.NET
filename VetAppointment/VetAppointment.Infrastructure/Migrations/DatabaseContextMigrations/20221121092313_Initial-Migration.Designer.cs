﻿// <auto-generated />
using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Migrations;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;
using VetAppointment.Infrastructure.Data;

#nullable disable

namespace VetAppointment.Infrastructure.Migrations.DatabaseContextMigrations
{
    [DbContext(typeof(DatabaseContext))]
    [Migration("20221121092313_Initial-Migration")]
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

                    b.Property<Guid>("PetId")
                        .HasColumnType("TEXT");

                    b.Property<DateTime>("ScheduledDate")
                        .HasColumnType("TEXT");

                    b.Property<Guid>("VetId")
                        .HasColumnType("TEXT");

                    b.HasKey("Id");

                    b.ToTable("Appointments");
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
                            Id = new Guid("093ec5b4-7c2f-4f6f-81b1-67c2b76acc24"),
                            Address = "Str. 1 Decembrie Nr. 25",
                            ContactEmail = "contact@casa_animalelor.com",
                            ContactPhone = "+40712345678",
                            Name = "Casa Animalelor",
                            NumberOfPlaces = 124,
                            RegistrationDate = new DateTime(2022, 11, 21, 11, 23, 12, 865, DateTimeKind.Local).AddTicks(8130)
                        },
                        new
                        {
                            Id = new Guid("de062a3d-6f85-43f7-9c85-90de6ba3fdf4"),
                            Address = "Str. Primaverii Nr. 15",
                            ContactEmail = "contact@zoo_vet.com",
                            ContactPhone = "+40778945612",
                            Name = "Zoo-Vet",
                            NumberOfPlaces = 64,
                            RegistrationDate = new DateTime(2022, 11, 21, 11, 23, 12, 865, DateTimeKind.Local).AddTicks(8291)
                        });
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

            modelBuilder.Entity("VetAppointment.Domain.Vet", b =>
                {
                    b.HasOne("VetAppointment.Domain.VetClinic", null)
                        .WithMany("Vets")
                        .HasForeignKey("VetClinicId");
                });

            modelBuilder.Entity("VetAppointment.Domain.PetOwner", b =>
                {
                    b.Navigation("Pets");
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
