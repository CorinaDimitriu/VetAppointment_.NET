�
�D:\Documents\GitHub\VetAppointment_.NET\VetAppointment - APIs + Tests\VetAppointment - Working\VetAppointment.Shared\Domain\Appointment.cs
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
}
�D:\Documents\GitHub\VetAppointment_.NET\VetAppointment - APIs + Tests\VetAppointment - Working\VetAppointment.Shared\Domain\Person.cs
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
 �
�D:\Documents\GitHub\VetAppointment_.NET\VetAppointment - APIs + Tests\VetAppointment - Working\VetAppointment.Shared\Domain\Pet.cs
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
} �
�D:\Documents\GitHub\VetAppointment_.NET\VetAppointment - APIs + Tests\VetAppointment - Working\VetAppointment.Shared\Domain\PetOwner.cs
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
} �	
�D:\Documents\GitHub\VetAppointment_.NET\VetAppointment - APIs + Tests\VetAppointment - Working\VetAppointment.Shared\Domain\Vet.cs
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
class 
Vet 
: 
Person 
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
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
Phone 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
ClinicId 
{  
get! $
;$ %
set& )
;) *
}+ ,
public

 
string

 
Specialisation

 $
{

% &
get

' *
;

* +
set

, /
;

/ 0
}

1 2
} 
} �
�D:\Documents\GitHub\VetAppointment_.NET\VetAppointment - APIs + Tests\VetAppointment - Working\VetAppointment.Shared\Domain\VetClinic.cs
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