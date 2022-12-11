Õ
éD:\Facultate\Anul_3\.NET\VetAppointment_S12\VetAppointment - APIs + Tests\VetAppointment - Working\VetAppointment.Shared\Domain\Appointment.cs
	namespace 	
VetAppointment
 
. 
Shared 
.  
Domain  &
{ 
public 

class 
Appointment 
{ 
public 
Guid 
Id 
{ 
get 
; 
set !
;! "
}# $
public 
Guid 
VetId 
{ 
get 
;  
set! $
;$ %
}& '
public 
Guid 
PetId 
{ 
get 
;  
set! $
;$ %
}& '
public 
string 
ScheduledDate #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public		 
int		 &
EstimatedDurationInMinutes		 -
{		. /
get		0 3
;		3 4
set		5 8
;		8 9
}		: ;
public

 
Guid

 
TreatmentId

 
{

  !
get

" %
;

% &
set

' *
;

* +
}

, -
public 
Guid 
MedicalHistoryId $
{% &
get' *
;* +
set, /
;/ 0
}1 2
} 
} ˝
ïD:\Facultate\Anul_3\.NET\VetAppointment_S12\VetAppointment - APIs + Tests\VetAppointment - Working\VetAppointment.Shared\Domain\Enums\AnimalGender.cs
	namespace 	
VetAppointment
 
. 
Domain 
.  
Enums  %
{ 
public 

enum 
AnimalGender 
{ 
Male 
= 
$num 
, 
Female 
= 
$num 
} 
} ä
ìD:\Facultate\Anul_3\.NET\VetAppointment_S12\VetAppointment - APIs + Tests\VetAppointment - Working\VetAppointment.Shared\Domain\Enums\AnimalRace.cs
	namespace 	
VetAppointment
 
. 
Domain 
.  
Enums  %
{ 
public 

enum 

AnimalRace 
{ 
Dog 
= 
$num 
, 
Cat 
= 
$num 
, 
Bird 
= 
$num 
, 
Fish 
= 
$num 
, 
Rabbit		 
=		 
$num		 
,		 
Hamster

 
=

 
$num

 
,

 
Reptile 
= 
$num 
, 
Other 
= 
$num 
} 
} ¿
ïD:\Facultate\Anul_3\.NET\VetAppointment_S12\VetAppointment - APIs + Tests\VetAppointment - Working\VetAppointment.Shared\Domain\Enums\PersonGender.cs
	namespace 	
VetAppointment
 
. 
Domain 
.  
Enums  %
{ 
public 

enum 
PersonGender 
{ 
Male 
= 
$num 
, 
Female 
= 
$num 
, 
Other 
= 
$num 
} 
}		 £
öD:\Facultate\Anul_3\.NET\VetAppointment_S12\VetAppointment - APIs + Tests\VetAppointment - Working\VetAppointment.Shared\Domain\Enums\VetSpecialisation.cs
	namespace 	
VetAppointment
 
. 
Domain 
.  
Enums  %
{ 
public 

enum 
VetSpecialisation !
{ 

PawSurgeon 
= 
$num 
, 
DentalCaretaker 
= 
$num 
, 
Nutritionist 
= 
$num 
, 
Other 
= 
$num 
}		 
}

 ˆ
âD:\Facultate\Anul_3\.NET\VetAppointment_S12\VetAppointment - APIs + Tests\VetAppointment - Working\VetAppointment.Shared\Domain\Person.cs
	namespace 	
VetAppointment
 
. 
Shared 
.  
Domain  &
{ 
public 

abstract 
class 
Person  
{ 
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
Surname 
{ 
get  #
;# $
set% (
;( )
}* +
public 
string 
	Birthdate 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string 
Gender 
{ 
get "
;" #
set$ '
;' (
}) *
}		 
}

 Î
ÜD:\Facultate\Anul_3\.NET\VetAppointment_S12\VetAppointment - APIs + Tests\VetAppointment - Working\VetAppointment.Shared\Domain\Pet.cs
	namespace 	
VetAppointment
 
. 
Shared 
.  
Domain  &
{ 
public 

class 
Pet 
{ 
public 
Guid 
Id 
{ 
get 
; 
set !
;! "
}# $
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
	Birthdate 
{  !
get" %
;% &
set' *
;* +
}, -
public		 
string		 
Race		 
{		 
get		  
;		  !
set		" %
;		% &
}		' (
public

 
string

 
Gender

 
{

 
get

 "
;

" #
set

$ '
;

' (
}

) *
} 
} ˛
ãD:\Facultate\Anul_3\.NET\VetAppointment_S12\VetAppointment - APIs + Tests\VetAppointment - Working\VetAppointment.Shared\Domain\PetOwner.cs
	namespace 	
VetAppointment
 
. 
Shared 
.  
Domain  &
{ 
public 

class 
PetOwner 
: 
Person "
{ 
public 
Guid 
Id 
{ 
get 
; 
set !
;! "
}# $
public 
string 
Address 
{ 
get  #
;# $
set% (
;( )
}* +
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
public		 
string		 
Phone		 
{		 
get		 !
;		! "
set		# &
;		& '
}		( )
} 
} ó	
ÜD:\Facultate\Anul_3\.NET\VetAppointment_S12\VetAppointment - APIs + Tests\VetAppointment - Working\VetAppointment.Shared\Domain\Vet.cs
	namespace 	
VetAppointment
 
. 
Shared 
.  
Domain  &
{ 
public 

class 
Vet 
: 
Person 
{ 
public 
Guid 
Id 
{ 
get 
; 
set !
;! "
}# $
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
public		 
string		 
Phone		 
{		 
get		 !
;		! "
set		# &
;		& '
}		( )
public

 
string

 
ClinicId

 
{

  
get

! $
;

$ %
set

& )
;

) *
}

+ ,
public 
string 
Specialisation $
{% &
get' *
;* +
set, /
;/ 0
}1 2
} 
} ù
åD:\Facultate\Anul_3\.NET\VetAppointment_S12\VetAppointment - APIs + Tests\VetAppointment - Working\VetAppointment.Shared\Domain\VetClinic.cs
	namespace 	
VetAppointment
 
. 
Shared 
.  
Domain  &
{ 
public 

class 
	VetClinic 
{ 
public 
Guid 
Id 
{ 
get 
; 
set !
;! "
}# $
[ 	
Required	 
( 
ErrorMessage 
=  
$str! /
)/ 0
]0 1
public		 
string		 
Name		 
{		 
get		  
;		  !
set		" %
;		% &
}		' (
[ 	
Required	 
( 
ErrorMessage 
=  
$str! 3
)3 4
]4 5
public 
string 
Address 
{ 
get  #
;# $
set% (
;( )
}* +
[ 	
Required	 
( 
ErrorMessage 
=  
$str! 9
)9 :
]: ;
[ 	
Range	 
( 
$num 
, 
$num 
, 
ErrorMessage )
=* +
$str, L
)L M
]M N
public 
int 
NumberOfPlaces !
{" #
get$ '
;' (
set) ,
;, -
}. /
[ 	
Required	 
( 
ErrorMessage 
=  
$str! 1
)1 2
]2 3
[ 	
RegularExpression	 
( 
$str E
,E F
ErrorMessageG S
=T U
$strV k
)k l
]l m
public 
string 
ContactEmail "
{# $
get% (
;( )
set* -
;- .
}/ 0
[ 	
Required	 
( 
ErrorMessage 
=  
$str! 7
)7 8
]8 9
[ 	
RegularExpression	 
( 
$str -
,- .
ErrorMessage/ ;
=< =
$str> Z
)Z [
][ \
public 
string 
ContactPhone "
{# $
get% (
;( )
set* -
;- .
}/ 0
} 
} 