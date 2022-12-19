Œ
tC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.Application\Commands\Appointments\CreateAppointmentCommand.cs
	namespace 	
VetAppointment
 
. 
Application $
.$ %
Commands% -
.- .
Appointments. :
{ 
public 

class $
CreateAppointmentCommand )
:* +
IRequest, 4
<4 5
AppointmentResponse5 H
>H I
{ 
public 
string 
? 
ScheduledDate $
{% &
get' *
;* +
set, /
;/ 0
}1 2
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
 
VetId

 
{

 
get

 
;

  
set

! $
;

$ %
}

& '
public 
Guid 
PetId 
{ 
get 
;  
set! $
;$ %
}& '
public 
Guid 
TreatmentId 
{  !
get" %
;% &
set' *
;* +
}, -
public 
Guid 
MedicalHistoryId $
{% &
get' *
;* +
set, /
;/ 0
}1 2
} 
} π
}C:\Users\Leonard\Desktop\VetAppointment\VetAppointment.Application\Commands\Appointments\CreateAppointmentCommandValidator.cs
	namespace 	
VetAppointment
 
. 
Application $
.$ %
Commands% -
.- .
Appointments. :
{ 
public 

class -
!CreateAppointmentCommandValidator 2
:3 4
AbstractValidator5 F
<F G$
CreateAppointmentCommandG _
>_ `
{ 
public -
!CreateAppointmentCommandValidator 0
(0 1
)1 2
{ 	
RuleFor		 
(		 
x		 
=>		 
x		 
.		 
ScheduledDate		 (
)		( )
.

 
NotEmpty

 
(

 
)

 
. 
WithMessage 
( 
$str 9
)9 :
;: ;
RuleFor 
( 
x 
=> 
x 
. &
EstimatedDurationInMinutes 5
)5 6
. 
NotEmpty 
( 
) 
. 
GreaterThan 
( 
$num 
) 
. 
WithMessage 
( 
$str X
)X Y
;Y Z
RuleFor 
( 
x 
=> 
x 
. 
VetId  
)  !
. 
NotEmpty 
( 
) 
. 
WithMessage 
( 
$str 1
)1 2
;2 3
RuleFor 
( 
x 
=> 
x 
. 
PetId  
)  !
. 
NotEmpty 
( 
) 
. 
WithMessage 
( 
$str 1
)1 2
;2 3
RuleFor 
( 
x 
=> 
x 
. 
TreatmentId &
)& '
. 
NotEmpty 
( 
) 
. 
WithMessage 
( 
$str 7
)7 8
;8 9
RuleFor 
( 
x 
=> 
x 
. 
MedicalHistoryId +
)+ ,
. 
NotEmpty 
( 
) 
. 
WithMessage 
( 
$str =
)= >
;> ?
} 	
} 
} ¥
fC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.Application\Commands\Drugs\CreateDrugCommand.cs
	namespace 	
VetAppointment
 
. 
Application $
.$ %
Commands% -
.- .
Drugs. 3
{ 
public 

class 
CreateDrugCommand "
:# $
IRequest% -
<- .
DrugResponse. :
>: ;
{ 
public		 
string		 
Name		 
{		 
get		  
;		  !
set		" %
;		% &
}		' (
public

 
double

 
Quantity
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
double 
	UnitPrice 
{  !
get" %
;% &
set' *
;* +
}, -
} 
} ä
oC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.Application\Commands\Drugs\CreateDrugCommandValidator.cs
	namespace 	
VetAppointment
 
. 
Application $
.$ %
Commands% -
.- .
Drugs. 3
{ 
public 

class &
CreateDrugCommandValidator +
:, -
AbstractValidator. ?
<? @
CreateDrugCommand@ Q
>Q R
{ 
public &
CreateDrugCommandValidator )
() *
)* +
{ 	
RuleFor		 
(		 
x		 
=>		 
x		 
.		 
Name		 
)		  
.		  !
NotEmpty		! )
(		) *
)		* +
.		+ ,
MaximumLength		, 9
(		9 :
$num		: <
)		< =
;		= >
RuleFor

 
(

 
x

 
=>

 
x

 
.

 
Quantity

 #
)

# $
.

$ %
NotEmpty

% -
(

- .
)

. /
.

/ 0
GreaterThan

0 ;
(

; <
$num

< =
)

= >
;

> ?
RuleFor 
( 
x 
=> 
x 
. 
	UnitPrice $
)$ %
.% &
NotEmpty& .
(. /
)/ 0
.0 1
GreaterThan1 <
(< =
$num= >
)> ?
;? @
} 	
} 
} Û
fC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.Application\Commands\Drugs\DeleteDrugCommand.cs
	namespace 	
VetAppointment
 
. 
Application $
.$ %
Commands% -
.- .
Drugs. 3
{ 
public 

class 
DeleteDrugCommand "
:# $
IRequest% -
<- .
bool. 2
>2 3
{ 
public 
Guid 
DrugId 
{ 
get  
;  !
set" %
;% &
}' (
} 
}		 ©
oC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.Application\Commands\Drugs\DeleteDrugCommandValidator.cs
	namespace 	
VetAppointment
 
. 
Application $
.$ %
Commands% -
.- .
Drugs. 3
{ 
public 

class &
DeleteDrugCommandValidator +
:, -
AbstractValidator. ?
<? @
DeleteDrugCommand@ Q
>Q R
{ 
public &
DeleteDrugCommandValidator )
() *
)* +
{ 	
RuleFor		 
(		 
x		 
=>		 
x		 
.		 
DrugId		 !
)		! "
.		" #
NotEmpty		# +
(		+ ,
)		, -
.		- .
WithMessage		. 9
(		9 :
$str		: N
)		N O
;		O P
}

 	
} 
} »
fC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.Application\Commands\Drugs\UpdateDrugCommand.cs
	namespace 	
VetAppointment
 
. 
Application $
.$ %
Commands% -
.- .
Drugs. 3
{ 
public 

class 
UpdateDrugCommand "
:# $
IRequest% -
<- .
DrugResponse. :
>: ;
{ 
public		 
Guid		 
Id		 
{		 
get		 
;		 
set		 !
;		! "
}		# $
public

 
string

 
Name

 
{

 
get

  
;

  !
set

" %
;

% &
}

' (
public 
double 
Quantity 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
double 
	UnitPrice 
{  !
get" %
;% &
set' *
;* +
}, -
} 
} ƒ
oC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.Application\Commands\Drugs\UpdateDrugCommandValidator.cs
	namespace 	
VetAppointment
 
. 
Application $
.$ %
Commands% -
.- .
Drugs. 3
{ 
public 

class &
UpdateDrugCommandValidator +
:, -
AbstractValidator. ?
<? @
UpdateDrugCommand@ Q
>Q R
{ 
public &
UpdateDrugCommandValidator )
() *
)* +
{ 	
RuleFor		 
(		 
x		 
=>		 
x		 
.		 
Id		 
)		 
.		 
NotEmpty		 '
(		' (
)		( )
.		) *
WithMessage		* 5
(		5 6
$str		6 F
)		F G
;		G H
RuleFor

 
(

 
x

 
=>

 
x

 
.

 
Name

 
)

  
.

  !
NotEmpty

! )
(

) *
)

* +
.

+ ,
MaximumLength

, 9
(

9 :
$num

: <
)

< =
.

= >
WithMessage

> I
(

I J
$str	

J Ñ
)


Ñ Ö
;


Ö Ü
RuleFor 
( 
x 
=> 
x 
. 
Quantity #
)# $
.$ %
NotEmpty% -
(- .
). /
./ 0
GreaterThan0 ;
(; <
$num< =
)= >
.> ?
WithMessage? J
(J K
$strK |
)| }
;} ~
RuleFor 
( 
x 
=> 
x 
. 
	UnitPrice $
)$ %
.% &
NotEmpty& .
(. /
)/ 0
.0 1
GreaterThan1 <
(< =
$num= >
)> ?
.? @
WithMessage@ K
(K L
$strL 
)	 Ä
;
Ä Å
} 	
} 
} Æ
nC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.Application\Commands\PetOwners\CreatePetOwnerCommand.cs
	namespace 	
VetAppointment
 
. 
Application $
.$ %
Commands% -
.- .
	PetOwners. 7
{ 
public 

class !
CreatePetOwnerCommand &
:' (
IRequest) 1
<1 2
PetOwnerResponse2 B
>B C
{ 
public		 
string		 
Name		 
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
 
Surname

 
{

 
get

  #
;

# $
set

% (
;

( )
}

* +
public 
string 
	Birthdate 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string 
Gender 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 
Address 
{ 
get  #
;# $
set% (
;( )
}* +
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
Phone 
{ 
get !
;! "
set# &
;& '
}( )
} 
} Ñ
wC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.Application\Commands\PetOwners\CreatePetOwnerCommandValidator.cs
	namespace 	
VetAppointment
 
. 
Application $
.$ %
Commands% -
.- .
	PetOwners. 7
{ 
public 

class *
CreatePetOwnerCommandValidator /
:0 1
AbstractValidator2 C
<C D!
CreatePetOwnerCommandD Y
>Y Z
{ 
public *
CreatePetOwnerCommandValidator -
(- .
). /
{ 	
RuleFor		 
(		 
x		 
=>		 
x		 
.		 
Name		 
)		  
.		  !
NotEmpty		! )
(		) *
)		* +
.		+ ,
WithMessage		, 7
(		7 8
$str		8 J
)		J K
;		K L
RuleFor

 
(

 
x

 
=>

 
x

 
.

 
Surname

 "
)

" #
.

# $
NotEmpty

$ ,
(

, -
)

- .
.

. /
WithMessage

/ :
(

: ;
$str

; P
)

P Q
;

Q R
RuleFor 
( 
x 
=> 
x 
. 
	Birthdate $
)$ %
.% &
NotEmpty& .
(. /
)/ 0
.0 1
Must1 5
(5 6
Validations6 A
.A B
BeValidDateB M
)M N
.N O
WithMessageO Z
(Z [
$str	[ Ñ
)
Ñ Ö
;
Ö Ü
RuleFor 
( 
x 
=> 
x 
. 
Email  
)  !
.! "
NotEmpty" *
(* +
)+ ,
., -
EmailAddress- 9
(9 :
): ;
.; <
WithMessage< G
(G H
$strH m
)m n
;n o
RuleFor 
( 
x 
=> 
x 
. 
Phone  
)  !
.! "
NotEmpty" *
(* +
)+ ,
., -
Matches- 4
(4 5
$str5 D
)D E
.E F
WithMessageF Q
(Q R
$strR w
)w x
;x y
RuleFor 
( 
x 
=> 
x 
. 
Address "
)" #
.# $
NotEmpty$ ,
(, -
)- .
.. /
WithMessage/ :
(: ;
$str; P
)P Q
;Q R
RuleFor 
( 
x 
=> 
x 
. 
Gender !
)! "
." #
NotEmpty# +
(+ ,
), -
.- .
Must. 2
(2 3
Validations3 >
.> ? 
BeInPersonGenderEnum? S
)S T
.T U
WithMessageU `
(` a
$str	a á
)
á à
;
à â
} 	
} 
} ≈
dC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.Application\Commands\Pets\CreatePetCommand.cs
	namespace 	
VetAppointment
 
. 
Application $
.$ %
Commands% -
.- .
Pets. 2
{ 
public 

class 
CreatePetCommand !
:" #
IRequest$ ,
<, -
PetResponse- 8
>8 9
{ 
public		 
string		 
Name		 
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
 
	Birthdate

 
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
public 
string 
Race 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
Gender 
{ 
get "
;" #
set$ '
;' (
}) *
} 
} ∏
mC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.Application\Commands\Pets\CreatePetCommandValidator.cs
	namespace 	
VetAppointment
 
. 
Application $
.$ %
Commands% -
.- .
Pets. 2
{ 
public 

class %
CreatePetCommandValidator *
:+ ,
AbstractValidator- >
<> ?
CreatePetCommand? O
>O P
{ 
public %
CreatePetCommandValidator (
(( )
)) *
{ 	
RuleFor		 
(		 
x		 
=>		 
x		 
.		 
Name		 
)		  
.

 
NotNull

 
(

 
)

 
. 
NotEmpty 
( 
) 
. 
Length 
( 
$num 
, 
$num 
) 
. 
WithMessage 
( 
$str L
)L M
;M N
RuleFor 
( 
x 
=> 
x 
. 
	Birthdate $
)$ %
. 
NotNull 
( 
) 
. 
NotEmpty 
( 
) 
. 
Must 
( 
Validations !
.! "
BeValidDate" -
)- .
. 
WithMessage 
( 
$str 1
)1 2
;2 3
RuleFor 
( 
x 
=> 
x 
. 
Race 
)  
. 
NotNull 
( 
) 
. 
NotEmpty 
( 
) 
. 
Must 
( 
Validations !
.! "
BeInAnimalRaceEnum" 4
)4 5
. 
WithMessage 
( 
$str 0
)0 1
;1 2
RuleFor 
( 
x 
=> 
x 
. 
Gender !
)! "
. 
NotNull 
( 
) 
. 
NotEmpty 
( 
) 
. 
Must 
( 
Validations !
.! " 
BeInAnimalGenderEnum" 6
)6 7
. 
WithMessage 
( 
$str 2
)2 3
;3 4
} 	
} 
} “
yC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.Application\Commands\PrescribedDrug\CreatePrescribedDrugCommand.cs
	namespace 	
VetAppointment
 
. 
Application $
.$ %
Commands% -
.- .
PrescribedDrug. <
{ 
public 

class '
CreatePrescribedDrugCommand ,
:- .
IRequest/ 7
<7 8"
PrescribedDrugResponse8 N
>N O
{ 
public 
Guid 
DrugToPrescribeId %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public		 
double		 
Quantity		 
{		  
get		! $
;		$ %
set		& )
;		) *
}		+ ,
}

 
} ˜

ÇC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.Application\Commands\PrescribedDrug\CreatePrescribedDrugCommandValidator.cs
	namespace 	
VetAppointment
 
. 
Application $
.$ %
Commands% -
.- .
PrescribedDrug. <
{ 
public 

class 0
$CreatePrescribedDrugCommandValidator 5
:6 7
AbstractValidator8 I
<I J'
CreatePrescribedDrugCommandJ e
>e f
{ 
public 0
$CreatePrescribedDrugCommandValidator 3
(3 4
)4 5
{ 	
RuleFor		 
(		 
x		 
=>		 
x		 
.		 
DrugToPrescribeId		 ,
)		, -
.		- .
NotEmpty		. 6
(		6 7
)		7 8
.		8 9
WithMessage		9 D
(		D E
$str		E Y
)		Y Z
;		Z [
RuleFor

 
(

 
x

 
=>

 
x

 
.

 
Quantity

 #
)

# $
.

$ %
NotEmpty

% -
(

- .
)

. /
.

/ 0
GreaterThan

0 ;
(

; <
$num

< =
)

= >
.

> ?
WithMessage

? J
(

J K
$str

K l
)

l m
;

m n
} 	
} 
} ï
yC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.Application\Commands\PrescribedDrug\DeletePrescribedDrugCommand.cs
	namespace 	
VetAppointment
 
. 
Application $
.$ %
Commands% -
.- .
PrescribedDrug. <
{ 
public 

class '
DeletePrescribedDrugCommand ,
:- .
IRequest/ 7
<7 8
bool8 <
>< =
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
} 
}		 ‡
ÇC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.Application\Commands\PrescribedDrug\DeletePrescribedDrugCommandValidator.cs
	namespace 	
VetAppointment
 
. 
Application $
.$ %
Commands% -
.- .
PrescribedDrug. <
{ 
public 

class 0
$DeletePrescribedDrugCommandValidator 5
:6 7
AbstractValidator8 I
<I J'
DeletePrescribedDrugCommandJ e
>e f
{ 
public 0
$DeletePrescribedDrugCommandValidator 3
(3 4
)4 5
{ 	
RuleFor		 
(		 
x		 
=>		 
x		 
.		 
Id		 
)		 
.		 
NotEmpty		 '
(		' (
)		( )
.		) *
WithMessage		* 5
(		5 6
$str		6 F
)		F G
;		G H
}

 	
} 
} Ê
yC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.Application\Commands\PrescribedDrug\UpdatePrescribedDrugCommand.cs
	namespace 	
VetAppointment
 
. 
Application $
.$ %
Commands% -
.- .
PrescribedDrug. <
{ 
public 

class '
UpdatePrescribedDrugCommand ,
:- .
IRequest/ 7
<7 8"
PrescribedDrugResponse8 N
>N O
{ 
public 
Guid 
Id 
{ 
get 
; 
set !
;! "
}# $
public		 
Guid		 
DrugToPrescribeId		 %
{		& '
get		( +
;		+ ,
set		- 0
;		0 1
}		2 3
public

 
double

 
Quantity
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
+ ,
} 
} °
ÇC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.Application\Commands\PrescribedDrug\UpdatePrescribedDrugCommandValidator.cs
	namespace 	
VetAppointment
 
. 
Application $
.$ %
Commands% -
.- .
PrescribedDrug. <
{ 
public 

class 0
$UpdatePrescribedDrugCommandValidator 5
:6 7
AbstractValidator8 I
<I J'
UpdatePrescribedDrugCommandJ e
>e f
{ 
public 0
$UpdatePrescribedDrugCommandValidator 3
(3 4
)4 5
{ 	
RuleFor		 
(		 
x		 
=>		 
x		 
.		 
Id		 
)		 
.		 
NotEmpty		 '
(		' (
)		( )
.		) *
WithMessage		* 5
(		5 6
$str		6 F
)		F G
;		G H
RuleFor

 
(

 
x

 
=>

 
x

 
.

 
DrugToPrescribeId

 ,
)

, -
.

- .
NotEmpty

. 6
(

6 7
)

7 8
.

8 9
WithMessage

9 D
(

D E
$str

E Y
)

Y Z
;

Z [
RuleFor 
( 
x 
=> 
x 
. 
Quantity #
)# $
.$ %
NotEmpty% -
(- .
). /
./ 0
GreaterThan0 ;
(; <
$num< =
)= >
.> ?
WithMessage? J
(J K
$strK l
)l m
;m n
} 	
} 
} ﬁ
ZC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.Application\Commands\Validations.cs
	namespace 	
VetAppointment
 
. 
Application $
{ 
public 

static 
class 
Validations #
{ 
public 
static 
bool 
BeValidDate &
(& '
string' -
value. 3
)3 4
=>5 7
DateTime8 @
.@ A
TryParseA I
(I J
valueJ O
,O P
outQ T
varU X
dateY ]
)] ^
&&_ a
dateb f
<g h
DateTimei q
.q r
Nowr u
;u v
public		 
static		 
bool		  
BeInPersonGenderEnum		 /
(		/ 0
string		0 6
value		7 <
)		< =
=>		> @
Enum		A E
.		E F
TryParse		F N
<		N O
PersonGender		O [
>		[ \
(		\ ]
value		] b
,		b c
out		d g
_		h i
)		i j
;		j k
public 
static 
bool "
BeInSpecialisationEnum 1
(1 2
string2 8
value9 >
)> ?
=>@ B
EnumC G
.G H
TryParseH P
<P Q
VetSpecialisationQ b
>b c
(c d
valued i
,i j
outk n
_o p
)p q
;q r
public 
static 
bool 
BeInAnimalRaceEnum -
(- .
string. 4
value5 :
): ;
=>< >
Enum? C
.C D
TryParseD L
<L M

AnimalRaceM W
>W X
(X Y
valueY ^
,^ _
out` c
_d e
)e f
;f g
public 
static 
bool  
BeInAnimalGenderEnum /
(/ 0
string0 6
value7 <
)< =
=>> @
EnumA E
.E F
TryParseF N
<N O
AnimalGenderO [
>[ \
(\ ]
value] b
,b c
outd g
varh k
_l m
)m n
;n o
} 
} é

pC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.Application\Commands\VetClinics\CreateVetClinicCommand.cs
	namespace 	
VetAppointment
 
. 
Application $
.$ %
Commands% -
.- .

VetClinics. 8
{ 
public 

class "
CreateVetClinicCommand '
:( )
IRequest* 2
<2 3
VetClinicResponse3 D
>D E
{ 
public		 
string		 
Name		 
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
 
Address

 
{

 
get

  #
;

# $
set

% (
;

( )
}

* +
public 
int 
NumberOfPlaces !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string 
ContactEmail "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
string 
ContactPhone "
{# $
get% (
;( )
set* -
;- .
}/ 0
} 
} ø
yC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.Application\Commands\VetClinics\CreateVetClinicCommandValidator.cs
	namespace 	
VetAppointment
 
. 
Application $
.$ %
Commands% -
.- .

VetClinics. 8
{ 
public 

class +
CreateVetClinicCommandValidator 0
:1 2
AbstractValidator3 D
<D E"
CreateVetClinicCommandE [
>[ \
{ 
public +
CreateVetClinicCommandValidator .
(. /
)/ 0
{ 	
RuleFor		 
(		 
x		 
=>		 
x		 
.		 
Name		 
)		  
.

 
NotNull

 
(

 
)

 
. 
NotEmpty 
( 
) 
. 
Length 
( 
$num 
, 
$num 
) 
. 
WithMessage 
( 
$str \
)\ ]
;] ^
RuleFor 
( 
x 
=> 
x 
. 
Address "
)" #
. 
NotNull 
( 
) 
. 
NotEmpty 
( 
) 
. 
WithMessage 
( 
$str `
)` a
;a b
RuleFor 
( 
x 
=> 
x 
. 
NumberOfPlaces )
)) *
. 
NotNull 
( 
) 
. 
NotEmpty 
( 
) 
. 
GreaterThan 
( 
$num 
) 
. 
WithMessage 
( 
$str V
)V W
;W X
RuleFor 
( 
x 
=> 
x 
. 
ContactEmail '
)' (
. 
NotEmpty 
( 
) 
. 
EmailAddress 
( 
) 
. 
WithMessage 
( 
$str Z
)Z [
;[ \
RuleFor 
( 
x 
=> 
x 
. 
ContactPhone '
)' (
. 
NotEmpty 
( 
) 
. 
Matches 
( 
$str (
)( )
. 
WithMessage 
( 
$str Y
)Y Z
;Z [
} 	
}   
}!! ú
dC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.Application\Commands\Vets\CreateVetCommand.cs
	namespace 	
VetAppointment
 
. 
Application $
.$ %
Commands% -
.- .
Vets. 2
{ 
public 

class 
CreateVetCommand !
:" #
IRequest$ ,
<, -
VetResponse- 8
>8 9
{ 
public		 
string		 
Name		 
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
 
Surname

 
{

 
get

  #
;

# $
set

% (
;

( )
}

* +
public 
string 
	Birthdate 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string 
Gender 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
Phone 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
Specialisation $
{% &
get' *
;* +
set, /
;/ 0
}1 2
} 
} §
mC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.Application\Commands\Vets\CreateVetCommandValidator.cs
	namespace 	
VetAppointment
 
. 
Application $
.$ %
Commands% -
.- .
Vets. 2
{ 
public 

class %
CreateVetCommandValidator *
:+ ,
AbstractValidator- >
<> ?
CreateVetCommand? O
>O P
{ 
public %
CreateVetCommandValidator (
(( )
)) *
{ 	
RuleFor		 
(		 
x		 
=>		 
x		 
.		 
Name		 
)		  
.

 
NotNull

 
(

 
)

 
. 
NotEmpty 
( 
) 
. 
Length 
( 
$num 
, 
$num 
) 
. 
WithMessage 
( 
$str ^
)^ _
;_ `
RuleFor 
( 
x 
=> 
x 
. 
Surname "
)" #
. 
NotNull 
( 
) 
. 
NotEmpty 
( 
) 
. 
Length 
( 
$num 
, 
$num 
) 
. 
WithMessage 
( 
$str a
)a b
;b c
RuleFor 
( 
x 
=> 
x 
. 
	Birthdate $
)$ %
. 
NotNull 
( 
) 
. 
NotEmpty 
( 
) 
. 
Must 
( 
Validations !
.! "
BeValidDate" -
)- .
. 
WithMessage 
( 
$str M
)M N
;N O
RuleFor 
( 
x 
=> 
x 
. 
Email  
)  !
. 
NotNull 
( 
) 
. 
NotEmpty 
( 
) 
. 
EmailAddress 
( 
) 
.  
WithMessage 
( 
$str Q
)Q R
;R S
RuleFor 
( 
x 
=> 
x 
. 
Phone  
)  !
. 
NotNull 
( 
) 
. 
NotEmpty 
( 
) 
.   
Matches   
(   
$str   (
)  ( )
.!! 
WithMessage!! 
(!! 
$str!! Q
)!!Q R
;!!R S
RuleFor"" 
("" 
x"" 
=>"" 
x"" 
."" 
Specialisation"" )
)"") *
.## 
NotNull## 
(## 
)## 
.$$ 
NotEmpty$$ 
($$ 
)$$ 
.%% 
Must%% 
(%% 
Validations%% !
.%%! ""
BeInSpecialisationEnum%%" 8
)%%8 9
.&& 
WithMessage&& 
(&& 
$str&& \
)&&\ ]
;&&] ^
RuleFor'' 
('' 
x'' 
=>'' 
x'' 
.'' 
Gender'' !
)''! "
.(( 
NotNull(( 
((( 
)(( 
.)) 
NotEmpty)) 
()) 
))) 
.** 
Must** 
(** 
Validations** !
.**! " 
BeInPersonGenderEnum**" 6
)**6 7
.++ 
WithMessage++ 
(++ 
$str++ L
)++L M
;++M N
},, 	
}-- 
}.. Ì

WC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.Application\ConfigureServices.cs
	namespace 	
VetAppointment
 
. 
Application $
{ 
public		 

static		 
class		 
ConfigureServices		 )
{

 
public 
static 
IServiceCollection ("
AddApplicationServices) ?
(@ A
thisA E
IServiceCollectionF X
servicesY a
)a b
{ 	
services 
. 
AddAutoMapper "
(" #
Assembly# +
.+ , 
GetExecutingAssembly, @
(@ A
)A B
)B C
;C D
services 
. 

AddMediatR 
(  
Assembly  (
.( ) 
GetExecutingAssembly) =
(= >
)> ?
)? @
;@ A
services 
. -
!AddFluentValidationAutoValidation 6
(6 7
)7 8
;8 9
services 
. %
AddValidatorsFromAssembly .
(. /
Assembly/ 7
.7 8 
GetExecutingAssembly8 L
(L M
)M N
)N O
;O P
return 
services 
; 
} 	
} 
} Ô
gC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.Application\Handlers\CreateDrugCommandHandler.cs
	namespace 	
VetAppointment
 
. 
Application $
.$ %
Handlers% -
{		 
public

 

class

 $
CreateDrugCommandHandler

 )
:

* +
IRequestHandler

, ;
<

; <
CreateDrugCommand

< M
,

M N
DrugResponse

O [
>

[ \
{ 
private 
readonly 
IRepository $
<$ %
Drug% )
>) *

repository+ 5
;5 6
public $
CreateDrugCommandHandler '
(' (
IRepository( 3
<3 4
Drug4 8
>8 9

repository: D
)D E
=>F H
thisI M
.M N

repositoryN X
=Y Z

repository[ e
;e f
public 
async 
Task 
< 
DrugResponse &
>& '
Handle( .
(. /
CreateDrugCommand/ @
requestA H
,H I
CancellationTokenJ [
cancellationToken\ m
)m n
{ 	
var 
drug 
= 

DrugMapper !
.! "
Mapper" (
.( )
Map) ,
<, -
Drug- 1
>1 2
(2 3
request3 :
): ;
;; <
if 
( 
drug 
== 
null 
) 
{ 
return 
null 
; 
} 
var 
newDrug 
= 
await 

repository  *
.* +
Add+ .
(. /
drug/ 3
)3 4
;4 5
return 

DrugMapper 
. 
Mapper $
.$ %
Map% (
<( )
DrugResponse) 5
>5 6
(6 7
newDrug7 >
)> ?
;? @
} 	
} 
} ‡
gC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.Application\Handlers\CreatePetCoammandHandler.cs
	namespace 	
VetAppointment
 
. 
Application $
.$ %
Handlers% -
{		 
public

 

class

 $
CreatePetCoammandHandler

 )
:

* +
IRequestHandler

, ;
<

; <
CreatePetCommand

< L
,

L M
PetResponse

N Y
>

Y Z
{ 
private 
readonly 
IRepository $
<$ %
Pet% (
>( )

repository* 4
;4 5
public $
CreatePetCoammandHandler '
(' (
IRepository( 3
<3 4
Pet4 7
>7 8

repository9 C
)C D
=>E G
thisH L
.L M

repositoryM W
=X Y

repositoryZ d
;d e
public 
async 
Task 
< 
PetResponse %
>% &
Handle' -
(- .
CreatePetCommand. >
request? F
,F G
CancellationTokenH Y
cancellationTokenZ k
)k l
{ 	
var 
pet 
= 
	PetMapper 
.  
Mapper  &
.& '
Map' *
<* +
Pet+ .
>. /
(/ 0
request0 7
)7 8
;8 9
if 
( 
pet 
== 
null 
) 
{ 
return 
null 
; 
} 
var 
result 
= 
await 

repository (
.( )
Add) ,
(, -
pet- 0
)0 1
;1 2
return 
	PetMapper 
. 
Mapper #
.# $
Map$ '
<' (
PetResponse( 3
>3 4
(4 5
result5 ;
); <
;< =
} 	
} 
} ≠
kC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.Application\Handlers\CreatePetOwnerCommandHandler.cs
	namespace 	
VetAppointment
 
. 
Application $
.$ %
Handlers% -
{		 
public

 

class

 (
CreatePetOwnerCommandHandler

 -
:

. /
IRequestHandler

0 ?
<

? @!
CreatePetOwnerCommand

@ U
,

U V
PetOwnerResponse

W g
>

g h
{ 
private 
readonly 
IRepository $
<$ %
PetOwner% -
>- .

repository/ 9
;9 :
public (
CreatePetOwnerCommandHandler +
(+ ,
IRepository, 7
<7 8
PetOwner8 @
>@ A

repositoryB L
)L M
=>N P
thisQ U
.U V

repositoryV `
=a b

repositoryc m
;m n
public 
async 
Task 
< 
PetOwnerResponse *
>* +
Handle, 2
(2 3!
CreatePetOwnerCommand3 H
requestI P
,P Q
CancellationTokenR c
cancellationTokend u
)u v
{ 	
var 
petOwner 
= 
PetOwnerMapper )
.) *
Mapper* 0
.0 1
Map1 4
<4 5
PetOwner5 =
>= >
(> ?
request? F
)F G
;G H
if 
( 
petOwner 
== 
null  
)  !
{ 
return 
null 
; 
} 
var 
result 
= 
await 

repository )
.) *
Add* -
(- .
petOwner. 6
)6 7
;7 8
return 
PetOwnerMapper !
.! "
Mapper" (
.( )
Map) ,
<, -
PetOwnerResponse- =
>= >
(> ?
result? E
)E F
;F G
} 	
} 
} ª
qC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.Application\Handlers\CreatePrescribedDrugCommandHandler.cs
	namespace 	
VetAppointment
 
. 
Application $
.$ %
Handlers% -
{ 
public		 

class		 .
"CreatePrescribedDrugCommandHandler		 3
:		4 5
IRequestHandler		6 E
<		E F'
CreatePrescribedDrugCommand		F a
,		a b"
PrescribedDrugResponse		c y
>		y z
{

 
private 
readonly 
IUnitOfWork $

unitOfWork% /
;/ 0
public .
"CreatePrescribedDrugCommandHandler 1
(1 2
IUnitOfWork2 =

unitOfWork> H
)H I
=>J L
thisM Q
.Q R

unitOfWorkR \
=] ^

unitOfWork_ i
;i j
public 
async 
Task 
< "
PrescribedDrugResponse 0
>0 1
Handle2 8
(8 9'
CreatePrescribedDrugCommand9 T
requestU \
,\ ]
CancellationToken^ o
cancellationToken	p Å
)
Å Ç
{ 	
var 
drug 
= 
await 

unitOfWork '
.' (
DrugRepository( 6
.6 7
Get7 :
(: ;
request; B
.B C
DrugToPrescribeIdC T
)T U
;U V
var 
prescribedDrug 
=   
PrescribedDrugMapper! 5
.5 6
Mapper6 <
.< =
Map= @
<@ A
PrescribedDrugA O
>O P
(P Q
requestQ X
)X Y
;Y Z
prescribedDrug 
. &
CalculatePresribedDrugCost 5
(5 6
drug6 :
): ;
;; <
prescribedDrug 
= 
await "

unitOfWork# -
.- .$
PrescribedDrugRepository. F
.F G
AddG J
(J K
prescribedDrugK Y
)Y Z
;Z [
return  
PrescribedDrugMapper '
.' (
Mapper( .
.. /
Map/ 2
<2 3"
PrescribedDrugResponse3 I
>I J
(J K
prescribedDrugK Y
)Y Z
;Z [
} 	
} 
} ·
lC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.Application\Handlers\CreatevetClinicCommandHandler.cs
	namespace 	
VetAppointment
 
. 
Application $
.$ %
Handlers% -
{		 
public

 

class

 )
CreatevetClinicCommandHandler

 .
:

/ 0
IRequestHandler

1 @
<

@ A"
CreateVetClinicCommand

A W
,

W X
VetClinicResponse

Y j
>

j k
{ 
private 
readonly 
IRepository $
<$ %
	VetClinic% .
>. /

repository0 :
;: ;
public )
CreatevetClinicCommandHandler ,
(, -
IRepository- 8
<8 9
	VetClinic9 B
>B C

repositoryD N
)N O
=>P R
thisS W
.W X

repositoryX b
=c d

repositorye o
;o p
public 
async 
Task 
< 
VetClinicResponse +
>+ ,
Handle- 3
(3 4"
CreateVetClinicCommand4 J
requestK R
,R S
CancellationTokenT e
cancellationTokenf w
)w x
{ 	
var 
	vetClinic 
= 
VetClinicMapper +
.+ ,
Mapper, 2
.2 3
Map3 6
<6 7
	VetClinic7 @
>@ A
(A B
requestB I
)I J
;J K
if 
( 
	vetClinic 
== 
null !
)! "
{ 
return 
null 
; 
} 
var 
medicalHistory 
=  
MedicalHistory! /
./ 0
Create0 6
(6 7
)7 8
.8 9
Entity9 ?
;? @
medicalHistory 
. 
AtachToClinic (
(( )
	vetClinic) 2
.2 3
Id3 5
)5 6
;6 7
	vetClinic 
.  
AttachMedicalHistory *
(* +
medicalHistory+ 9
.9 :
Id: <
)< =
;= >
	vetClinic 
. 
SetRegistrationDate )
() *
)* +
;+ ,
var 
newVetClinic 
= 
await $

repository% /
./ 0
Add0 3
(3 4
	vetClinic4 =
)= >
;> ?
return 
VetClinicMapper "
." #
Mapper# )
.) *
Map* -
<- .
VetClinicResponse. ?
>? @
(@ A
newVetClinicA M
)M N
;N O
}   	
}!! 
}"" ·
fC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.Application\Handlers\CreateVetCommandHandler.cs
	namespace 	
VetAppointment
 
. 
Application $
.$ %
Handlers% -
{		 
public

 

class

 #
CreateVetCommandHandler

 (
:

) *
IRequestHandler

+ :
<

: ;
CreateVetCommand

; K
,

K L
VetResponse

M X
>

X Y
{ 
private 
readonly 
IRepository $
<$ %
Vet% (
>( )

repository* 4
;4 5
public #
CreateVetCommandHandler &
(& '
IRepository' 2
<2 3
Vet3 6
>6 7

repository8 B
)B C
=>D F
thisG K
.K L

repositoryL V
=W X

repositoryY c
;c d
public 
async 
Task 
< 
VetResponse %
>% &
Handle' -
(- .
CreateVetCommand. >
command? F
,F G
CancellationTokenH Y
cancellationTokenZ k
)k l
{ 	
var 
vet 
= 
	VetMapper 
.  
Mapper  &
.& '
Map' *
<* +
Vet+ .
>. /
(/ 0
command0 7
)7 8
;8 9
if 
( 
vet 
== 
null 
) 
{ 
return 
null 
; 
} 
var 
response 
= 
await  

repository! +
.+ ,
Add, /
(/ 0
vet0 3
)3 4
;4 5
return 
	VetMapper 
. 
Mapper #
.# $
Map$ '
<' (
VetResponse( 3
>3 4
(4 5
response5 =
)= >
;> ?
} 	
} 
} ›
gC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.Application\Handlers\DeleteDrugCommandHandler.cs
	namespace 	
VetAppointment
 
. 
Application $
.$ %
Handlers% -
{ 
public 

class $
DeleteDrugCommandHandler )
:* +
IRequestHandler, ;
<; <
DeleteDrugCommand< M
,M N
boolO S
>S T
{ 
private		 
readonly		 
IRepository		 $
<		$ %
Drug		% )
>		) *

repository		+ 5
;		5 6
public $
DeleteDrugCommandHandler '
(' (
IRepository( 3
<3 4
Drug4 8
>8 9

repository: D
)D E
=>F H
thisI M
.M N

repositoryN X
=Y Z

repository[ e
;e f
public 
async 
Task 
< 
bool 
> 
Handle  &
(& '
DeleteDrugCommand' 8
command9 @
,@ A
CancellationTokenB S
cancellationTokenT e
)e f
{ 	
var 
drug 
= 
await 

repository '
.' (
Get( +
(+ ,
command, 3
.3 4
DrugId4 :
): ;
;; <
if 
( 
drug 
== 
null 
) 
{ 
return 
false 
; 
} 
await 

repository 
. 
Delete #
(# $
drug$ (
)( )
;) *
return 
true 
; 
} 	
} 
} Ω
qC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.Application\Handlers\DeletePrescribedDrugCommandHandler.cs
	namespace 	
VetAppointment
 
. 
Application $
.$ %
Handlers% -
{ 
public 

class .
"DeletePrescribedDrugCommandHandler 3
:4 5
IRequestHandler6 E
<E F'
DeletePrescribedDrugCommandF a
,a b
boolc g
>g h
{ 
private		 
readonly		 
IRepository		 $
<		$ %
PrescribedDrug		% 3
>		3 4

repository		5 ?
;		? @
public .
"DeletePrescribedDrugCommandHandler 1
(1 2
IRepository2 =
<= >
PrescribedDrug> L
>L M

repositoryN X
)X Y
=>Z \
this] a
.a b

repositoryb l
=m n

repositoryo y
;y z
public 
async 
Task 
< 
bool 
> 
Handle  &
(& ''
DeletePrescribedDrugCommand' B
commandC J
,J K
CancellationTokenL ]
cancellationToken^ o
)o p
{ 	
var 
prescribedDrug 
=  
await! &

repository' 1
.1 2
Get2 5
(5 6
command6 =
.= >
Id> @
)@ A
;A B
if 
( 
prescribedDrug 
== !
null" &
)& '
{ 
return 
false 
; 
} 
await 

repository 
. 
Delete #
(# $
prescribedDrug$ 2
)2 3
;3 4
return 
true 
; 
} 	
} 
} ˙
gC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.Application\Handlers\UpdateDrugCommandHandler.cs
	namespace 	
VetAppointment
 
. 
Application $
.$ %
Handlers% -
{		 
public

 

class

 $
UpdateDrugCommandHandler

 )
:

* +
IRequestHandler

, ;
<

; <
UpdateDrugCommand

< M
,

M N
DrugResponse

O [
>

[ \
{ 
private 
readonly 
IRepository $
<$ %
Drug% )
>) *

repository+ 5
;5 6
public $
UpdateDrugCommandHandler '
(' (
IRepository( 3
<3 4
Drug4 8
>8 9

repository: D
)D E
=>F H
thisI M
.M N

repositoryN X
=Y Z

repository[ e
;e f
public 
async 
Task 
< 
DrugResponse &
>& '
Handle( .
(. /
UpdateDrugCommand/ @
commandA H
,H I
CancellationTokenJ [
cancellationToken\ m
)m n
{ 	
var 
drug 
= 
await 

repository '
.' (
Get( +
(+ ,
command, 3
.3 4
Id4 6
)6 7
;7 8
if 
( 
drug 
== 
null 
) 
{ 
return 
null 
; 
} 
drug 
. 
Update 
( 
command 
.  
Name  $
,$ %
command& -
.- .
Quantity. 6
,6 7
command8 ?
.? @
	UnitPrice@ I
)I J
;J K
var 
result 
= 
await 

repository )
.) *
Update* 0
(0 1
drug1 5
)5 6
;6 7
return 

DrugMapper 
. 
Mapper $
.$ %
Map% (
<( )
DrugResponse) 5
>5 6
(6 7
result7 =
)= >
;> ?
} 	
} 
} Î
qC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.Application\Handlers\UpdatePrescribedDrugCommandHandler.cs
	namespace 	
VetAppointment
 
. 
Application $
.$ %
Handlers% -
{ 
public		 

class		 .
"UpdatePrescribedDrugCommandHandler		 3
:		4 5
IRequestHandler		6 E
<		E F'
UpdatePrescribedDrugCommand		F a
,		a b"
PrescribedDrugResponse		c y
>		y z
{

 
private 
readonly 
IUnitOfWork $

unitOfWork% /
;/ 0
public .
"UpdatePrescribedDrugCommandHandler 1
(1 2
IUnitOfWork2 =

unitOfWork> H
)H I
=>J L
thisM Q
.Q R

unitOfWorkR \
=] ^

unitOfWork_ i
;i j
public 
async 
Task 
< "
PrescribedDrugResponse 0
>0 1
Handle2 8
(8 9'
UpdatePrescribedDrugCommand9 T
commandU \
,\ ]
CancellationToken^ o
cancellationToken	p Å
)
Å Ç
{ 	
var 
drug 
= 
await 

unitOfWork '
.' (
DrugRepository( 6
.6 7
Get7 :
(: ;
command; B
.B C
DrugToPrescribeIdC T
)T U
;U V
var 
prescribedDrug 
=  
await! &

unitOfWork' 1
.1 2$
PrescribedDrugRepository2 J
.J K
GetK N
(N O
commandO V
.V W
IdW Y
)Y Z
;Z [
if 
( 
prescribedDrug 
== !
null" &
)& '
{ 
return 
null 
; 
} 
prescribedDrug 
. #
UpdateDrugToPrescribeId 2
(2 3
command3 :
.: ;
DrugToPrescribeId; L
)L M
;M N
prescribedDrug 
. 
UpdateQuantity )
() *
command* 1
.1 2
Quantity2 :
): ;
;; <
prescribedDrug 
. &
CalculatePresribedDrugCost 5
(5 6
drug6 :
): ;
;; <
prescribedDrug 
= 
await "

unitOfWork# -
.- .$
PrescribedDrugRepository. F
.F G
UpdateG M
(M N
prescribedDrugN \
)\ ]
;] ^
return  
PrescribedDrugMapper '
.' (
Mapper( .
.. /
Map/ 2
<2 3"
PrescribedDrugResponse3 I
>I J
(J K
prescribedDrugK Y
)Y Z
;Z [
} 	
}   
}!! ∫
VC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.Application\IDatabaseContext.cs
	namespace 	
VetAppointment
 
. 
Application $
{ 
public 

	interface 
IDatabaseContext %
{ 
public 
DbSet 
< 
Pet 
> 
Pets 
{  
get! $
;$ %
}& '
public		 
DbSet		 
<		 
Vet		 
>		 
Vets		 
{		  
get		! $
;		$ %
}		& '
public

 
DbSet

 
<

 
PetOwner

 
>

 
	PetOwners

 (
{

) *
get

+ .
;

. /
}

0 1
public 
DbSet 
< 
	VetClinic 
> 

VetClinics  *
{+ ,
get- 0
;0 1
}2 3
public 
DbSet 
< 
Appointment  
>  !
Appointments" .
{/ 0
get1 4
;4 5
}6 7
public 
DbSet 
< 
Drug 
> 
Drugs  
{! "
get# &
;& '
}( )
public 
DbSet 
< 
MedicalHistory #
># $
MedicalHistories% 5
{6 7
get8 ;
;; <
}= >
public 
DbSet 
< 
	Treatment 
> 

Treatments  *
{+ ,
get- 0
;0 1
}2 3
public 
DbSet 
< 
PrescribedDrug #
># $
PrescribedDrugs% 4
{5 6
get7 :
;: ;
}< =
void 
Save 
( 
) 
; 
} 
} ‰
QC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.Application\IRepository.cs
	namespace 	
VetAppointment
 
. 
Application $
{ 
public 

	interface 
IRepository  
<  !
T! "
>" #
{ 
Task 
< 
T 
> 
Add 
( 
T 
entity 
) 
; 
Task 
< 
IEnumerable 
< 
T 
> 
> 
All  
(  !
)! "
;" #
Task		 
Delete		 
(		 
T		 
entity		 
)		 
;		 
Task

 
<

 
T

 
>

 
Find

 
(

 

Expression

 
<

  
Func

  $
<

$ %
T

% &
,

& '
bool

( ,
>

, -
>

- .
	predicate

/ 8
)

8 9
;

9 :
Task 
< 
T 
> 
Get 
( 
Guid 
id 
) 
; 
Task 
SaveChanges 
( 
) 
; 
Task 
< 
T 
> 
Update 
( 
T 
entity 
)  
;  !
} 
} â
QC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.Application\IUnitOfWork.cs
	namespace 	
VetAppointment
 
. 
Application $
{ 
public 

	interface 
IUnitOfWork  
{ 
IRepository 
< 
Appointment 
>  !
AppointmentRepository! 6
{7 8
get9 <
;< =
}> ?
IRepository 
< 
Drug 
> 
DrugRepository (
{) *
get+ .
;. /
}0 1
IRepository		 
<		 
MedicalHistory		 "
>		" #$
MedicalHistoryRepository		$ <
{		= >
get		? B
;		B C
}		D E
IRepository

 
<

 
PetOwner

 
>

 
PetOwnerRepository

 0
{

1 2
get

3 6
;

6 7
}

8 9
IRepository 
< 
Pet 
> 
PetRepository &
{' (
get) ,
;, -
}. /
IRepository 
< 
PrescribedDrug "
>" #$
PrescribedDrugRepository$ <
{= >
get? B
;B C
}D E
IRepository 
< 
	Treatment 
> 
TreatmentRepository 2
{3 4
get5 8
;8 9
}: ;
IRepository 
< 
	VetClinic 
> 
VetClinicRepository 2
{3 4
get5 8
;8 9
}: ;
IRepository 
< 
Vet 
> 
VetRepository &
{' (
get) ,
;, -
}. /
Task 
SaveChanges 
( 
) 
; 
} 
} ’
_C:\Users\Leonard\Desktop\VetAppointment\VetAppointment.Application\Mappers\AppointmentMapper.cs
	namespace 	
VetAppointment
 
. 
Application $
.$ %
Mappers% ,
{ 
public 

static 
class 
AppointmentMapper )
{ 
private 
static 
readonly 
Lazy  $
<$ %
IMapper% ,
>, -
Lazy. 2
=3 4
new		 
(		 
(		 
)		 
=>		 
{

 
var 
config 
= 
new  
MapperConfiguration! 4
(4 5
cfg5 8
=>9 ;
{ 
cfg 
. 
ShouldMapProperty )
=* +
p, -
=>. 0
p1 2
.2 3
	GetMethod3 <
.< =
IsPublic= E
||F H
pI J
.J K
	GetMethodK T
.T U

IsAssemblyU _
;_ `
cfg 
. 

AddProfile "
<" #$
AppointmentMapperProfile# ;
>; <
(< =
)= >
;> ?
} 
) 
; 
var 
mapper 
= 
config #
.# $
CreateMapper$ 0
(0 1
)1 2
;2 3
return 
mapper 
; 
} 
) 
; 
public 
static 
IMapper 
Mapper $
=>% '
Lazy( ,
., -
Value- 2
;2 3
} 
} È
fC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.Application\Mappers\AppointmentMapperProfile.cs
	namespace 	
VetAppointment
 
. 
Application $
.$ %
Mappers% ,
{ 
public 

class $
AppointmentMapperProfile )
:* +
Profile, 3
{		 
public

 $
AppointmentMapperProfile

 '
(

' (
)

( )
{ 	
	CreateMap 
< 
Appointment !
,! "
AppointmentResponse# 6
>6 7
(7 8
)8 9
.9 :

ReverseMap: D
(D E
)E F
;F G
	CreateMap 
< 
Appointment !
,! "$
CreateAppointmentCommand# ;
>; <
(< =
)= >
.> ?

ReverseMap? I
(I J
)J K
;K L
} 	
} 
} ¡
XC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.Application\Mappers\DrugMapper.cs
	namespace 	
VetAppointment
 
. 
Application $
.$ %
Mappers% ,
{ 
public 

static 
class 

DrugMapper "
{ 
private 
static 
readonly 
Lazy  $
<$ %
IMapper% ,
>, -
Lazy. 2
=3 4
new		 
(		 
(		 
)		 
=>		 
{

 
var 
config 
= 
new  
MapperConfiguration! 4
(4 5
cfg5 8
=>9 ;
{ 
cfg 
. 
ShouldMapProperty )
=* +
p, -
=>. 0
p1 2
.2 3
	GetMethod3 <
.< =
IsPublic= E
||F H
pI J
.J K
	GetMethodK T
.T U

IsAssemblyU _
;_ `
cfg 
. 

AddProfile "
<" #
DrugMappingProfile# 5
>5 6
(6 7
)7 8
;8 9
} 
) 
; 
var 
mapper 
= 
config #
.# $
CreateMapper$ 0
(0 1
)1 2
;2 3
return 
mapper 
; 
} 
) 
; 
public 
static 
IMapper 
Mapper $
=>% '
Lazy( ,
., -
Value- 2
;2 3
} 
} ¢	
`C:\Users\Leonard\Desktop\VetAppointment\VetAppointment.Application\Mappers\DrugMappingProfile.cs
	namespace 	
VetAppointment
 
. 
Application $
.$ %
Mappers% ,
{ 
public 

class 
DrugMappingProfile #
:$ %
Profile& -
{		 
public

 
DrugMappingProfile

 !
(

! "
)

" #
{ 	
	CreateMap 
< 
Drug 
, 
DrugResponse (
>( )
() *
)* +
.+ ,

ReverseMap, 6
(6 7
)7 8
;8 9
	CreateMap 
< 
Drug 
, 
CreateDrugCommand -
>- .
(. /
)/ 0
.0 1

ReverseMap1 ;
(; <
)< =
;= >
	CreateMap 
< 
Drug 
, 
UpdateDrugCommand -
>- .
(. /
)/ 0
.0 1

ReverseMap1 ;
(; <
)< =
;= >
} 	
} 
} Ω
WC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.Application\Mappers\PetMapper.cs
	namespace 	
VetAppointment
 
. 
Application $
.$ %
Mappers% ,
{ 
public 

static 
class 
	PetMapper !
{ 
private 
static 
readonly 
Lazy  $
<$ %
IMapper% ,
>, -
Lazy. 2
=3 4
new		 
(		 
(		 
)		 
=>		 
{

 
var 
config 
= 
new  
MapperConfiguration! 4
(4 5
cfg5 8
=>9 ;
{ 
cfg 
. 
ShouldMapProperty )
=* +
p, -
=>. 0
p1 2
.2 3
	GetMethod3 <
.< =
IsPublic= E
||F H
pI J
.J K
	GetMethodK T
.T U

IsAssemblyU _
;_ `
cfg 
. 

AddProfile "
<" #
PetMapperProfile# 3
>3 4
(4 5
)5 6
;6 7
} 
) 
; 
var 
mapper 
= 
config #
.# $
CreateMapper$ 0
(0 1
)1 2
;2 3
return 
mapper 
; 
} 
) 
; 
public 
static 
IMapper 
Mapper $
=>% '
Lazy( ,
., -
Value- 2
;2 3
} 
} ±
^C:\Users\Leonard\Desktop\VetAppointment\VetAppointment.Application\Mappers\PetMapperProfile.cs
	namespace 	
VetAppointment
 
. 
Application $
.$ %
Mappers% ,
{ 
public 

class 
PetMapperProfile !
:" #
Profile$ +
{		 
public

 
PetMapperProfile

 
(

  
)

  !
{ 	
	CreateMap 
< 
Pet 
, 
PetResponse &
>& '
(' (
)( )
.) *

ReverseMap* 4
(4 5
)5 6
;6 7
	CreateMap 
< 
Pet 
, 
CreatePetCommand +
>+ ,
(, -
)- .
.. /

ReverseMap/ 9
(9 :
): ;
;; <
} 	
} 
} Ã
\C:\Users\Leonard\Desktop\VetAppointment\VetAppointment.Application\Mappers\PetOwnerMapper.cs
	namespace 	
VetAppointment
 
. 
Application $
.$ %
Mappers% ,
{ 
public 

static 
class 
PetOwnerMapper &
{ 
private 
static 
readonly 
Lazy  $
<$ %
IMapper% ,
>, -
Lazy. 2
=3 4
new		 
(		 
(		 
)		 
=>		 
{

 
var 
config 
= 
new  
MapperConfiguration! 4
(4 5
cfg5 8
=>9 ;
{ 
cfg 
. 
ShouldMapProperty )
=* +
p, -
=>. 0
p1 2
.2 3
	GetMethod3 <
.< =
IsPublic= E
||F H
pI J
.J K
	GetMethodK T
.T U

IsAssemblyU _
;_ `
cfg 
. 

AddProfile "
<" #!
PetOwnerMapperProfile# 8
>8 9
(9 :
): ;
;; <
} 
) 
; 
var 
mapper 
= 
config #
.# $
CreateMapper$ 0
(0 1
)1 2
;2 3
return 
mapper 
; 
} 
) 
; 
public 
static 
IMapper 
Mapper $
=>% '
Lazy( ,
., -
Value- 2
;2 3
} 
} ‘
cC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.Application\Mappers\PetOwnerMapperProfile.cs
	namespace 	
VetAppointment
 
. 
Application $
.$ %
Mappers% ,
{ 
public 

class !
PetOwnerMapperProfile &
:' (
Profile) 0
{		 
public

 !
PetOwnerMapperProfile

 $
(

$ %
)

% &
{ 	
	CreateMap 
< 
PetOwner 
, 
PetOwnerResponse  0
>0 1
(1 2
)2 3
.3 4

ReverseMap4 >
(> ?
)? @
;@ A
	CreateMap 
< 
PetOwner 
, !
CreatePetOwnerCommand  5
>5 6
(6 7
)7 8
.8 9

ReverseMap9 C
(C D
)D E
;E F
} 	
} 
} ›
bC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.Application\Mappers\PrescribedDrugMapper.cs
	namespace 	
VetAppointment
 
. 
Application $
.$ %
Mappers% ,
{ 
public 

static 
class  
PrescribedDrugMapper ,
{ 
private 
static 
readonly 
Lazy  $
<$ %
IMapper% ,
>, -
Lazy. 2
=3 4
new		 
(		 
(		 
)		 
=>		 
{

 
var 
config 
= 
new  
MapperConfiguration! 4
(4 5
cfg5 8
=>9 ;
{ 
cfg 
. 
ShouldMapProperty )
=* +
p, -
=>. 0
p1 2
.2 3
	GetMethod3 <
.< =
IsPublic= E
||F H
pI J
.J K
	GetMethodK T
.T U

IsAssemblyU _
;_ `
cfg 
. 

AddProfile "
<" #&
PresribedDrugMapperProfile# =
>= >
(> ?
)? @
;@ A
} 
) 
; 
var 
mapper 
= 
config #
.# $
CreateMapper$ 0
(0 1
)1 2
;2 3
return 
mapper 
; 
} 
) 
; 
public 
static 
IMapper 
Mapper $
=>% '
Lazy( ,
., -
Value- 2
;2 3
} 
} Ò
hC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.Application\Mappers\PresribedDrugMapperProfile.cs
	namespace 	
VetAppointment
 
. 
Application $
.$ %
Mappers% ,
{ 
public 

class &
PresribedDrugMapperProfile +
:, -
Profile. 5
{		 
public

 &
PresribedDrugMapperProfile

 )
(

) *
)

* +
{ 	
	CreateMap 
< 
PrescribedDrug $
,$ %"
PrescribedDrugResponse& <
>< =
(= >
)> ?
;? @
	CreateMap 
< '
CreatePrescribedDrugCommand 1
,1 2
PrescribedDrug3 A
>A B
(B C
)C D
;D E
} 	
} 
} œ
]C:\Users\Leonard\Desktop\VetAppointment\VetAppointment.Application\Mappers\VetClinicMapper.cs
	namespace 	
VetAppointment
 
. 
Application $
.$ %
Mappers% ,
{ 
public 

static 
class 
VetClinicMapper '
{ 
private 
static 
readonly 
Lazy  $
<$ %
IMapper% ,
>, -
Lazy. 2
=3 4
new		 
(		 
(		 
)		 
=>		 
{

 
var 
config 
= 
new  
MapperConfiguration! 4
(4 5
cfg5 8
=>9 ;
{ 
cfg 
. 
ShouldMapProperty )
=* +
p, -
=>. 0
p1 2
.2 3
	GetMethod3 <
.< =
IsPublic= E
||F H
pI J
.J K
	GetMethodK T
.T U

IsAssemblyU _
;_ `
cfg 
. 

AddProfile "
<" #"
VetClinicMapperProfile# 9
>9 :
(: ;
); <
;< =
} 
) 
; 
var 
mapper 
= 
config #
.# $
CreateMapper$ 0
(0 1
)1 2
;2 3
return 
mapper 
; 
} 
) 
; 
public 
static 
IMapper 
Mapper $
=>% '
Lazy( ,
., -
Value- 2
;2 3
} 
} —
dC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.Application\Mappers\VetClinicMapperProfile.cs
	namespace 	
VetAppointment
 
. 
Application $
.$ %
Mappers% ,
{ 
public 

class "
VetClinicMapperProfile '
:( )
Profile* 1
{		 
public

 "
VetClinicMapperProfile

 %
(

% &
)

& '
{ 	
	CreateMap 
< 
	VetClinic 
,  
VetClinicResponse! 2
>2 3
(3 4
)4 5
;5 6
	CreateMap 
< "
CreateVetClinicCommand ,
,, -
	VetClinic. 7
>7 8
(8 9
)9 :
;: ;
} 	
} 
} ñ
WC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.Application\Mappers\VetMapper.cs
	namespace 	
VetAppointment
 
. 
Mappers  
{ 
public 

static 
class 
	VetMapper !
{ 
private 
static 
readonly 
Lazy  $
<$ %
IMapper% ,
>, -
Lazy. 2
=3 4
new		 
(		 
(		 
)		 
=>		 
{

 
var 
config 
= 
new  
MapperConfiguration! 4
(4 5
cfg5 8
=>9 ;
{ 
cfg 
. 
ShouldMapProperty )
=* +
p, -
=>. 0
p1 2
.2 3
	GetMethod3 <
.< =
IsPublic= E
||F H
pI J
.J K
	GetMethodK T
.T U

IsAssemblyU _
;_ `
cfg 
. 

AddProfile "
<" #
VetMappingProfile# 4
>4 5
(5 6
)6 7
;7 8
} 
) 
; 
var 
mapper 
= 
config #
.# $
CreateMapper$ 0
(0 1
)1 2
;2 3
return 
mapper 
; 
} 
) 
; 
public 
static 
IMapper 
Mapper $
=>% '
Lazy( ,
., -
Value- 2
;2 3
} 
} «
_C:\Users\Leonard\Desktop\VetAppointment\VetAppointment.Application\Mappers\VetMappingProfile.cs
	namespace 	
VetAppointment
 
. 
Mappers  
{ 
public 

class 
VetMappingProfile "
:# $
Profile% ,
{		 
public

 
VetMappingProfile

  
(

  !
)

! "
{ 	
	CreateMap 
< 
Vet 
, 
VetResponse &
>& '
(' (
)( )
.) *

ReverseMap* 4
(4 5
)5 6
;6 7
	CreateMap 
< 
CreateVetCommand &
,& '
Vet( +
>+ ,
(, -
)- .
;. /
} 	
} 
} è
dC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.Application\Queries\Drugs\GetAllDrugsQuery.cs
	namespace 	
VetAppointment
 
. 
Application $
.$ %
Queries% ,
., -
Drugs- 2
{ 
public 

class 
GetAllDrugsQuery !
:" #
IRequest$ ,
<, -
List- 1
<1 2
DrugResponse2 >
>> ?
>? @
{A B
}C D
} ﬂ
kC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.Application\Queries\Drugs\GetAllDrugsQueryHandler.cs
	namespace 	
VetAppointment
 
. 
Application $
.$ %
Queries% ,
., -
Drugs- 2
{ 
public 

class #
GetAllDrugsQueryHandler (
:) *
IRequestHandler+ :
<: ;
GetAllDrugsQuery; K
,K L
ListM Q
<Q R
DrugResponseR ^
>^ _
>_ `
{		 
private

 
readonly

 
IRepository

 $
<

$ %
Drug

% )
>

) *

repository

+ 5
;

5 6
public #
GetAllDrugsQueryHandler &
(& '
IRepository' 2
<2 3
Drug3 7
>7 8

repository9 C
)C D
=>E G
thisH L
.L M

repositoryM W
=X Y

repositoryZ d
;d e
public 
async 
Task 
< 
List 
< 
DrugResponse +
>+ ,
>, -
Handle. 4
(4 5
GetAllDrugsQuery5 E
requestF M
,M N
CancellationTokenO `
cancellationTokena r
)r s
=> 

DrugMapper 
. 
Mapper  
.  !
Map! $
<$ %
List% )
<) *
DrugResponse* 6
>6 7
>7 8
(8 9
await9 >

repository? I
.I J
AllJ M
(M N
)N O
)O P
;P Q
} 
} ∑
`C:\Users\Leonard\Desktop\VetAppointment\VetAppointment.Application\Queries\Drugs\GetDrugQuery.cs
	namespace 	
VetAppointment
 
. 
Application $
.$ %
Queries% ,
., -
Drugs- 2
{ 
public 

class 
GetDrugQuery 
: 
IRequest  (
<( )
DrugResponse) 5
>5 6
{ 
public 
Guid 
DrugId 
{ 
get  
;  !
set" %
;% &
}' (
public

 
GetDrugQuery

 
(

 
Guid

  
drugId

! '
)

' (
=>

) +
DrugId

, 2
=

3 4
drugId

5 ;
;

; <
} 
} Û
gC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.Application\Queries\Drugs\GetDrugQueryHandler.cs
	namespace 	
VetAppointment
 
. 
Application $
.$ %
Queries% ,
., -
Drugs- 2
{ 
public 

class 
GetDrugQueryHandler $
:% &
IRequestHandler' 6
<6 7
GetDrugQuery7 C
,C D
DrugResponseE Q
>Q R
{		 
private

 
readonly

 
IRepository

 $
<

$ %
Drug

% )
>

) *

repository

+ 5
;

5 6
public 
GetDrugQueryHandler "
(" #
IRepository# .
<. /
Drug/ 3
>3 4

repository5 ?
)? @
=>A C
thisD H
.H I

repositoryI S
=T U

repositoryV `
;` a
public 
async 
Task 
< 
DrugResponse &
>& '
Handle( .
(. /
GetDrugQuery/ ;
request< C
,C D
CancellationTokenE V
cancellationTokenW h
)h i
=> 

DrugMapper 
. 
Mapper  
.  !
Map! $
<$ %
DrugResponse% 1
>1 2
(2 3
await3 8

repository9 C
.C D
GetD G
(G H
requestH O
.O P
DrugIdP V
)V W
)W X
;X Y
} 
} £
lC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.Application\Queries\PetOwners\GetAllPetOwnersQuery.cs
	namespace 	
VetAppointment
 
. 
Application $
.$ %
Queries% ,
., -
	PetOwners- 6
{ 
public 

class  
GetAllPetOwnersQuery %
:& '
IRequest( 0
<0 1
List1 5
<5 6
PetOwnerResponse6 F
>F G
>G H
{I J
}K L
} è
sC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.Application\Queries\PetOwners\GetAllPetOwnersQueryHandler.cs
	namespace 	
VetAppointment
 
. 
Application $
.$ %
Queries% ,
{		 
public

 

class

 '
GetAllPetOwnersQueryHandler

 ,
:

- .
IRequestHandler

/ >
<

> ? 
GetAllPetOwnersQuery

? S
,

S T
List

U Y
<

Y Z
PetOwnerResponse

Z j
>

j k
>

k l
{ 
private 
readonly 
IRepository $
<$ %
PetOwner% -
>- .

repository/ 9
;9 :
public '
GetAllPetOwnersQueryHandler *
(* +
IRepository+ 6
<6 7
PetOwner7 ?
>? @

repositoryA K
)K L
=>M O
thisP T
.T U

repositoryU _
=` a

repositoryb l
;l m
public 
async 
Task 
< 
List 
< 
PetOwnerResponse /
>/ 0
>0 1
Handle2 8
(8 9 
GetAllPetOwnersQuery9 M
requestN U
,U V
CancellationTokenW h
cancellationTokeni z
)z {
{ 	
return 
PetOwnerMapper !
.! "
Mapper" (
.( )
Map) ,
<, -
List- 1
<1 2
PetOwnerResponse2 B
>B C
>C D
(D E
awaitE J

repositoryK U
.U V
AllV Y
(Y Z
)Z [
)[ \
;\ ]
} 	
} 
} Ω
jC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.Application\Queries\PetOwners\GetPetOwnerCommand.cs
	namespace 	
VetAppointment
 
. 
Application $
.$ %
Queries% ,
., -
	PetOwners- 6
{ 
public 

class 
GetPetOwnerCommand #
:$ %
IRequest& .
<. /
PetOwnerResponse/ ?
>? @
{ 
public 
Guid 
PetOwner 
{ 
get "
;" #
}$ %
public

 
GetPetOwnerCommand

 !
(

! "
Guid

" &
petOwner

' /
)

/ 0
=>

1 3
PetOwner

4 <
=

= >
petOwner

? G
;

G H
} 
} „
qC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.Application\Queries\PetOwners\GetPetOwnerCommandHandler.cs
	namespace 	
VetAppointment
 
. 
Application $
.$ %
Queries% ,
., -
	PetOwners- 6
{ 
public		 

class		 %
GetPetOwnerCommandHandler		 *
:		+ ,
IRequestHandler		- <
<		< =
GetPetOwnerCommand		= O
,		O P
PetOwnerResponse		Q a
>		a b
{

 
private 
readonly 
IRepository $
<$ %
PetOwner% -
>- .

repository/ 9
;9 :
public %
GetPetOwnerCommandHandler (
(( )
IRepository) 4
<4 5
PetOwner5 =
>= >

repository? I
)I J
=>K M
thisN R
.R S

repositoryS ]
=^ _

repository` j
;j k
public 
async 
Task 
< 
PetOwnerResponse *
>* +
Handle, 2
(2 3
GetPetOwnerCommand3 E
requestF M
,M N
CancellationTokenO `
cancellationTokena r
)r s
{ 	
var 
result 
= 
await 

repository )
.) *
Get* -
(- .
request. 5
.5 6
PetOwner6 >
)> ?
;? @
if 
( 
result 
== 
null 
) 
{ 
return 
null 
; 
} 
return 
PetOwnerMapper !
.! "
Mapper" (
.( )
Map) ,
<, -
PetOwnerResponse- =
>= >
(> ?
result? E
)E F
;F G
} 	
} 
} ˚	
pC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.Application\Queries\PetOwners\RegisterPetsToOwnerQuery.cs
	namespace 	
VetAppointment
 
. 
Application $
.$ %
Queries% ,
., -
	PetOwners- 6
{ 
public 

class $
RegisterPetsToOwnerQuery )
:* +
IRequest, 4
<4 5
List5 9
<9 :
PetResponse: E
>E F
>F G
{ 
public		 
Guid		 
Id		 
{		 
get		 
;		 
}		 
public

 
List

 
<

 
CreatePetCommand

 $
>

$ %
CreatePetCommands

& 7
{

8 9
get

: =
;

= >
}

? @
public $
RegisterPetsToOwnerQuery '
(' (
Guid( ,
id- /
,/ 0
List1 5
<5 6
CreatePetCommand6 F
>F G
petCommandsH S
)S T
{ 	
Id 
= 
id 
; 
CreatePetCommands 
= 
petCommands  +
;+ ,
} 	
} 
} —
wC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.Application\Queries\PetOwners\RegisterPetsToOwnerQueryHandler.cs
	namespace 	
VetAppointment
 
. 
Application $
.$ %
Queries% ,
., -
	PetOwners- 6
{ 
public 

class +
RegisterPetsToOwnerQueryHandler 0
:1 2
IRequestHandler3 B
<B C$
RegisterPetsToOwnerQueryC [
,[ \
List] a
<a b
PetResponseb m
>m n
>n o
{		 
private

 
readonly

 
IUnitOfWork

 $

unitOfWork

% /
;

/ 0
public +
RegisterPetsToOwnerQueryHandler .
(. /
IUnitOfWork/ :

unitOfWork; E
)E F
=>G I
thisJ N
.N O

unitOfWorkO Y
=Z [

unitOfWork\ f
;f g
public 
async 
Task 
< 
List 
< 
PetResponse *
>* +
>+ ,
Handle- 3
(3 4$
RegisterPetsToOwnerQuery4 L
requestM T
,T U
CancellationTokenV g
cancellationTokenh y
)y z
{ 	
var 
owner 
= 
await 

unitOfWork (
.( )
PetOwnerRepository) ;
.; <
Get< ?
(? @
request@ G
.G H
IdH J
)J K
;K L
var 
pets 
= 
request 
. 
CreatePetCommands 0
.0 1
Select1 7
(7 8
	PetMapper8 A
.A B
MapperB H
.H I
MapI L
<L M
PetM P
>P Q
)Q R
.R S
ToListS Y
(Y Z
)Z [
;[ \
owner 
. 
RegisterPetsToOwner %
(% &
pets& *
)* +
;+ ,
await 

unitOfWork 
. 
PetOwnerRepository /
./ 0
Update0 6
(6 7
owner7 <
)< =
;= >
foreach 
( 
var 
pet 
in 
pets  $
)$ %
{ 
await 

unitOfWork  
.  !
PetRepository! .
.. /
Update/ 5
(5 6
pet6 9
)9 :
;: ;
} 
return 
pets 
. 
Select 
( 
	PetMapper (
.( )
Mapper) /
./ 0
Map0 3
<3 4
PetResponse4 ?
>? @
)@ A
.A B
ToListB H
(H I
)I J
;J K
} 	
} 
} ¡
xC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.Application\Queries\PrescribedDrugs\GetAllPrescribedDrugsQuery.cs
	namespace 	
VetAppointment
 
. 
Application $
.$ %
Queries% ,
., -
PrescribedDrugs- <
{ 
public 

class &
GetAllPrescribedDrugsQuery +
:, -
IRequest. 6
<6 7
List7 ;
<; <"
PrescribedDrugResponse< R
>R S
>S T
{U V
}W X
} ‰
C:\Users\Leonard\Desktop\VetAppointment\VetAppointment.Application\Queries\PrescribedDrugs\GetAllPrescribedDrugsQueryHandler.cs
	namespace 	
VetAppointment
 
. 
Application $
.$ %
Queries% ,
., -
PrescribedDrugs- <
{ 
public 

class -
!GetAllPrescribedDrugsQueryHandler 2
:3 4
IRequestHandler5 D
<D E&
GetAllPrescribedDrugsQueryE _
,_ `
Lista e
<e f"
PrescribedDrugResponsef |
>| }
>} ~
{		 
private

 
readonly

 
IRepository

 $
<

$ %
PrescribedDrug

% 3
>

3 4

repository

5 ?
;

? @
public -
!GetAllPrescribedDrugsQueryHandler 0
(0 1
IRepository1 <
<< =
PrescribedDrug= K
>K L

repositoryM W
)W X
=>Y [
this\ `
.` a

repositorya k
=l m

repositoryn x
;x y
public 
async 
Task 
< 
List 
< "
PrescribedDrugResponse 5
>5 6
>6 7
Handle8 >
(> ?&
GetAllPrescribedDrugsQuery? Y
requestZ a
,a b
CancellationTokenc t
cancellationToken	u Ü
)
Ü á
=>  
PrescribedDrugMapper #
.# $
Mapper$ *
.* +
Map+ .
<. /
List/ 3
<3 4"
PrescribedDrugResponse4 J
>J K
>K L
(L M
awaitM R

repositoryS ]
.] ^
All^ a
(a b
)b c
)c d
;d e
} 
} „
tC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.Application\Queries\PrescribedDrugs\GetPrescribedDrugQuery.cs
	namespace 	
VetAppointment
 
. 
Application $
.$ %
Queries% ,
., -
PrescribedDrugs- <
{ 
public 

class "
GetPrescribedDrugQuery '
:( )
IRequest* 2
<2 3"
PrescribedDrugResponse3 I
>I J
{ 
public 
Guid 
Id 
{ 
get 
; 
set !
;! "
}# $
public

 "
GetPrescribedDrugQuery

 %
(

% &
Guid

& *
id

+ -
)

- .
=>

/ 1
Id

2 4
=

5 6
id

7 9
;

9 :
} 
} Ò
{C:\Users\Leonard\Desktop\VetAppointment\VetAppointment.Application\Queries\PrescribedDrugs\GetPrescribedDrugQueryHandler.cs
	namespace 	
VetAppointment
 
. 
Application $
.$ %
Queries% ,
., -
PrescribedDrugs- <
{ 
public 

class )
GetPrescribedDrugQueryHandler .
:/ 0
IRequestHandler1 @
<@ A"
GetPrescribedDrugQueryA W
,W X"
PrescribedDrugResponseY o
>o p
{		 
private

 
readonly

 
IRepository

 $
<

$ %
PrescribedDrug

% 3
>

3 4

repository

5 ?
;

? @
public )
GetPrescribedDrugQueryHandler ,
(, -
IRepository- 8
<8 9
PrescribedDrug9 G
>G H

repositoryI S
)S T
=>U W
thisX \
.\ ]

repository] g
=h i

repositoryj t
;t u
public 
async 
Task 
< "
PrescribedDrugResponse 0
>0 1
Handle2 8
(8 9"
GetPrescribedDrugQuery9 O
requestP W
,W X
CancellationTokenY j
cancellationTokenk |
)| }
=>  
PrescribedDrugMapper #
.# $
Mapper$ *
.* +
Map+ .
<. /"
PrescribedDrugResponse/ E
>E F
(F G
awaitG L

repositoryM W
.W X
GetX [
([ \
request\ c
.c d
Idd f
)f g
)g h
;h i
} 
} ∆
mC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.Application\Queries\VetClinics\DeleteVetClinicQuery.cs
	namespace 	
VetAppointment
 
. 
Application $
.$ %
Queries% ,
., -

VetClinics- 7
{ 
public 

class  
DeleteVetClinicQuery %
:& '
IRequest( 0
<0 1
VetClinicResponse1 B
>B C
{ 
public 
Guid 
ClinicId 
{ 
get "
;" #
}$ %
public

  
DeleteVetClinicQuery

 #
(

# $
Guid

$ (
clinicId

) 1
)

1 2
=>

3 5
ClinicId

6 >
=

? @
clinicId

A I
;

I J
} 
} î"
tC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.Application\Queries\VetClinics\DeleteVetClinicQueryHandler.cs
	namespace 	
VetAppointment
 
. 
Application $
.$ %
Queries% ,
., -

VetClinics- 7
{ 
public 

class '
DeleteVetClinicQueryHandler ,
:- .
IRequestHandler/ >
<> ? 
DeleteVetClinicQuery? S
,S T
VetClinicResponseU f
>f g
{		 
private

 
readonly

 
IUnitOfWork

 $

unitOfWork

% /
;

/ 0
public '
DeleteVetClinicQueryHandler *
(* +
IUnitOfWork+ 6

unitOfWork7 A
)A B
=>C E
thisF J
.J K

unitOfWorkK U
=V W

unitOfWorkX b
;b c
public 
async 
Task 
< 
VetClinicResponse +
>+ ,
Handle- 3
(3 4 
DeleteVetClinicQuery4 H
requestI P
,P Q
CancellationTokenR c
cancellationTokend u
)u v
{ 	
var 
clinic 
= 
await 

unitOfWork )
.) *
VetClinicRepository* =
.= >
Get> A
(A B
requestB I
.I J
ClinicIdJ R
)R S
;S T
if 
( 
clinic 
== 
null 
) 
{ 
return 
null 
; 
} 
var 
medicalHistory 
=  

unitOfWork! +
.+ ,$
MedicalHistoryRepository, D
.D E
GetE H
(H I
clinicI O
.O P
MedicalHistoryIdP `
)` a
.a b
Resultb h
;h i
if 
( 
medicalHistory 
!= !
null" &
)& '
{ 
await 

unitOfWork  
.  !$
MedicalHistoryRepository! 9
.9 :
Delete: @
(@ A
medicalHistoryA O
)O P
;P Q
} 
var 
vets 
= 

unitOfWork !
.! "
VetRepository" /
./ 0
All0 3
(3 4
)4 5
.5 6
Result6 <
.< =
Where= B
(B C
vC D
=>E G
vH I
.I J
ClinicIdJ R
==S U
clinicV \
.\ ]
Id] _
)_ `
;` a
foreach 
( 
var 
vet 
in 
vets  $
)$ %
{ 
await 

unitOfWork  
.  !
VetRepository! .
.. /
Delete/ 5
(5 6
vet6 9
)9 :
;: ;
}   
var"" 
pets"" 
="" 

unitOfWork"" !
.""! "
PetRepository""" /
.""/ 0
All""0 3
(""3 4
)""4 5
.""5 6
Result""6 <
.""< =
Where""= B
(""B C
p""C D
=>""E G
p""H I
.""I J
ClinicId""J R
==""S U
clinic""V \
.""\ ]
Id""] _
)""_ `
;""` a
foreach## 
(## 
var## 
pet## 
in## 
pets##  $
)##$ %
{$$ 
await%% 

unitOfWork%%  
.%%  !
PetRepository%%! .
.%%. /
Delete%%/ 5
(%%5 6
pet%%6 9
)%%9 :
;%%: ;
}&& 
await(( 

unitOfWork(( 
.(( 
VetClinicRepository(( 0
.((0 1
Delete((1 7
(((7 8
clinic((8 >
)((> ?
;((? @
return** 
VetClinicMapper** "
.**" #
Mapper**# )
.**) *
Map*** -
<**- .
VetClinicResponse**. ?
>**? @
(**@ A
clinic**A G
)**G H
;**H I
}++ 	
},, 
}-- ®
nC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.Application\Queries\VetClinics\GetAllVetClinicsQuery.cs
	namespace 	
VetAppointment
 
. 
Application $
.$ %
Queries% ,
., -

VetClinics- 7
{ 
public 

class !
GetAllVetClinicsQuery &
:' (
IRequest) 1
<1 2
List2 6
<6 7
VetClinicResponse7 H
>H I
>I J
{K L
}M N
} °
uC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.Application\Queries\VetClinics\GetAllVetClinicsQueryHandler.cs
	namespace 	
VetAppointment
 
. 
Application $
.$ %
Queries% ,
., -

VetClinics- 7
{ 
public 

class (
GetAllVetClinicsQueryHandler -
:. /
IRequestHandler0 ?
<? @!
GetAllVetClinicsQuery@ U
,U V
ListW [
<[ \
VetClinicResponse\ m
>m n
>n o
{		 
private

 
readonly

 
IRepository

 $
<

$ %
	VetClinic

% .
>

. /

repository

0 :
;

: ;
public (
GetAllVetClinicsQueryHandler +
(+ ,
IRepository, 7
<7 8
	VetClinic8 A
>A B

repositoryC M
)M N
=>O Q
thisR V
.V W

repositoryW a
=b c

repositoryd n
;n o
public 
async 
Task 
< 
List 
< 
VetClinicResponse 0
>0 1
>1 2
Handle3 9
(9 :!
GetAllVetClinicsQuery: O
requestP W
,W X
CancellationToken 
cancellationToken /
)/ 0
{ 	
var 

vetClinics 
= 
await "

repository# -
.- .
All. 1
(1 2
)2 3
;3 4
return 
VetClinicMapper "
." #
Mapper# )
.) *
Map* -
<- .
List. 2
<2 3
VetClinicResponse3 D
>D E
>E F
(F G

vetClinicsG Q
)Q R
;R S
} 	
} 
} ›
jC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.Application\Queries\VetClinics\GetVetClinicQuery.cs
	namespace 	
VetAppointment
 
. 
Application $
.$ %
Queries% ,
., -

VetClinics- 7
{ 
public 

class 
GetVetClinicQuery "
:# $
IRequest% -
<- .
VetClinicResponse. ?
>? @
{ 
public 
Guid 
ClinicId 
{ 
get "
;" #
set$ '
;' (
}) *
public

 
GetVetClinicQuery

  
(

  !
Guid

! %
clinicId

& .
)

. /
=>

0 2
ClinicId

3 ;
=

< =
clinicId

> F
;

F G
} 
} Ô
qC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.Application\Queries\VetClinics\GetVetClinicQueryHandler.cs
	namespace 	
VetAppointment
 
. 
Application $
.$ %
Queries% ,
., -

VetClinics- 7
{ 
public		 

class		 $
GetVetClinicQueryHandler		 )
:		* +
IRequestHandler		, ;
<		; <
GetVetClinicQuery		< M
,		M N
VetClinicResponse		O `
>		` a
{

 
private 
readonly 
IRepository $
<$ %
	VetClinic% .
>. /

repository0 :
;: ;
public $
GetVetClinicQueryHandler '
(' (
IRepository( 3
<3 4
	VetClinic4 =
>= >

repository? I
)I J
=>K M
thisN R
.R S

repositoryS ]
=^ _

repository` j
;j k
public 
async 
Task 
< 
VetClinicResponse +
>+ ,
Handle- 3
(3 4
GetVetClinicQuery4 E
requestF M
,M N
CancellationToken 
cancellationToken /
)/ 0
{ 	
var 
	vetClinic 
= 
await !

repository" ,
., -
Get- 0
(0 1
request1 8
.8 9
ClinicId9 A
)A B
;B C
if 
( 
	vetClinic 
== 
null !
)! "
{ 
return 
null 
; 
} 
return 
VetClinicMapper "
." #
Mapper# )
.) *
Map* -
<- .
VetClinicResponse. ?
>? @
(@ A
	vetClinicA J
)J K
;K L
} 	
} 
} ¬	
C:\Users\Leonard\Desktop\VetAppointment\VetAppointment.Application\Queries\VetClinics\Pets\GetAllPetsFromClinicAndOwnerQuery.cs
	namespace 	
VetAppointment
 
. 
Application $
.$ %
Queries% ,
., -

VetClinics- 7
.7 8
Pets8 <
{ 
public 

class -
!GetAllPetsFromClinicAndOwnerQuery 2
:3 4
IRequest5 =
<= >
List> B
<B C
PetResponseC N
>N O
>O P
{ 
public 
Guid 
ClinicId 
{ 
get "
;" #
}$ %
public		 
Guid		 
OwnerId		 
{		 
get		 !
;		! "
}		# $
public -
!GetAllPetsFromClinicAndOwnerQuery 0
(0 1
Guid1 5
clinicId6 >
,> ?
Guid@ D
ownerIdE L
)L M
{ 	
ClinicId 
= 
clinicId 
;  
OwnerId 
= 
ownerId 
; 
} 	
} 
} ≠
ÜC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.Application\Queries\VetClinics\Pets\GetAllPetsFromClinicAndOwnerQueryHandler.cs
	namespace 	
VetAppointment
 
. 
Application $
.$ %
Queries% ,
., -

VetClinics- 7
.7 8
Pets8 <
{ 
public 

class 4
(GetAllPetsFromClinicAndOwnerQueryHandler 9
:: ;
IRequestHandler< K
<K L-
!GetAllPetsFromClinicAndOwnerQueryL m
,m n
Listo s
<s t
PetResponset 
>	 Ä
>
Ä Å
{		 
private

 
readonly

 
IUnitOfWork

 $

unitOfWork

% /
;

/ 0
public 4
(GetAllPetsFromClinicAndOwnerQueryHandler 7
(7 8
IUnitOfWork8 C

unitOfWorkD N
)N O
=>P R
thisS W
.W X

unitOfWorkX b
=c d

unitOfWorke o
;o p
public 
async 
Task 
< 
List 
< 
PetResponse *
>* +
>+ ,
Handle- 3
(3 4-
!GetAllPetsFromClinicAndOwnerQuery4 U
requestV ]
,] ^
CancellationToken_ p
cancellationToken	q Ç
)
Ç É
{ 	
var 
pets 
= 
( 
await 

unitOfWork (
.( )
PetRepository) 6
.6 7
All7 :
(: ;
); <
)< =
. 
Where 
( 
p 
=> 
p 
. 
ClinicId &
==' )
request* 1
.1 2
ClinicId2 :
&&; =
p> ?
.? @
OwnerId@ G
==H J
requestK R
.R S
OwnerIdS Z
)Z [
;[ \
return 
	PetMapper 
. 
Mapper #
.# $
Map$ '
<' (
List( ,
<, -
PetResponse- 8
>8 9
>9 :
(: ;
pets; ?
)? @
;@ A
} 	
} 
} ò
vC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.Application\Queries\VetClinics\Pets\PostPetsInVetClinicQuery.cs
	namespace 	
VetAppointment
 
. 
Application $
.$ %
Queries% ,
., -

VetClinics- 7
.7 8
Pets8 <
{ 
public 

class $
PostPetsInVetClinicQuery )
:* +
IRequest, 4
<4 5
List5 9
<9 :
PetResponse: E
>E F
>F G
{ 
public		 
	VetClinic		 
	VetClinic		 "
{		# $
get		% (
;		( )
}		* +
public

 
PetOwner

 
PetOwner

  
{

! "
get

# &
;

& '
}

( )
public 
List 
< 
Guid 
> 
PetsIds !
{" #
get$ '
;' (
}) *
public $
PostPetsInVetClinicQuery '
(' (
	VetClinic( 1
	vetClinic2 ;
,; <
PetOwner= E
petOwnerF N
,N O
ListP T
<T U
GuidU Y
>Y Z
petsIds[ b
)b c
{ 	
	VetClinic 
= 
	vetClinic !
;! "
PetOwner 
= 
petOwner 
;  
PetsIds 
= 
petsIds 
; 
} 	
} 
} ¢
}C:\Users\Leonard\Desktop\VetAppointment\VetAppointment.Application\Queries\VetClinics\Pets\PostPetsInVetClinicQueryHandler.cs
	namespace 	
VetAppointment
 
. 
Application $
.$ %
Queries% ,
., -

VetClinics- 7
.7 8
Pets8 <
{ 
public 

class +
PostPetsInVetClinicQueryHandler 0
:1 2
IRequestHandler3 B
<B C$
PostPetsInVetClinicQueryC [
,[ \
List] a
<a b
PetResponseb m
>m n
>n o
{ 
private		 
readonly		 
IUnitOfWork		 $

unitOfWork		% /
;		/ 0
public +
PostPetsInVetClinicQueryHandler .
(. /
IUnitOfWork/ :

unitOfWork; E
)E F
=>G I
thisJ N
.N O

unitOfWorkO Y
=Z [

unitOfWork\ f
;f g
public 
async 
Task 
< 
List 
< 
PetResponse *
>* +
>+ ,
Handle- 3
(3 4$
PostPetsInVetClinicQuery4 L
requestM T
,T U
CancellationTokenV g
cancellationTokenh y
)y z
{ 	
var 
pets 
= 

unitOfWork !
.! "
PetRepository" /
./ 0
All0 3
(3 4
)4 5
.5 6
Result6 <
.< =
Where= B
(B C
pC D
=>E G
requestH O
.O P
PetsIdsP W
.W X
ContainsX `
(` a
pa b
.b c
Idc e
)e f
)f g
;g h
foreach 
( 
var 
pet 
in 
pets  $
)$ %
{ 
pet 
. 
ConnectToOwner "
(" #
request# *
.* +
PetOwner+ 3
)3 4
;4 5
pet 
. 
RegisterPetToClinic '
(' (
request( /
./ 0
	VetClinic0 9
)9 :
;: ;
await 

unitOfWork  
.  !
PetRepository! .
.. /
Update/ 5
(5 6
pet6 9
)9 :
;: ;
} 
return 
	PetMapper 
. 
Mapper #
.# $
Map$ '
<' (
List( ,
<, -
PetResponse- 8
>8 9
>9 :
(: ;
pets; ?
)? @
;@ A
} 	
} 
} Ò
mC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.Application\Queries\VetClinics\UpdateVetClinicQuery.cs
	namespace 	
VetAppointment
 
. 
Application $
.$ %
Queries% ,
., -

VetClinics- 7
{ 
public 

class  
UpdateVetClinicQuery %
:& '
IRequest( 0
<0 1
ResponseStatusCodes1 D
>D E
{ 
public		 
Guid		 
ClinicId		 
{		 
get		 "
;		" #
}		$ %
public

 "
CreateVetClinicCommand

 %
Command

& -
{

. /
get

0 3
;

3 4
}

5 6
public  
UpdateVetClinicQuery #
(# $
Guid$ (
clinicId) 1
,1 2"
CreateVetClinicCommand3 I
commandJ Q
)Q R
{ 	
ClinicId 
= 
clinicId 
;  
Command 
= 
command 
; 
} 	
} 
} —
tC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.Application\Queries\VetClinics\UpdateVetClinicQueryHandler.cs
	namespace 	
VetAppointment
 
. 
Application $
.$ %
Queries% ,
., -

VetClinics- 7
{ 
public 

class '
UpdateVetClinicQueryHandler ,
:- .
IRequestHandler/ >
<> ? 
UpdateVetClinicQuery? S
,S T
ResponseStatusCodesU h
>h i
{		 
private

 
readonly

 
IRepository

 $
<

$ %
	VetClinic

% .
>

. /

repository

0 :
;

: ;
public '
UpdateVetClinicQueryHandler *
(* +
IRepository+ 6
<6 7
	VetClinic7 @
>@ A

repositoryB L
)L M
=>N P
thisQ U
.U V

repositoryV `
=a b

repositoryc m
;m n
public 
async 
Task 
< 
ResponseStatusCodes -
>- .
Handle/ 5
(5 6 
UpdateVetClinicQuery6 J
requestK R
,R S
CancellationTokenT e
cancellationTokenf w
)w x
{ 	
var 
clinic 
= 
await 

repository )
.) *
Get* -
(- .
request. 5
.5 6
ClinicId6 >
)> ?
;? @
if 
( 
clinic 
== 
null 
) 
{ 
return 
ResponseStatusCodes *
.* +
NotFound+ 3
;3 4
} 
var 
result 
= 
clinic 
.  
Update  &
(& '
request' .
.. /
Command/ 6
.6 7
Name7 ;
,; <
request= D
.D E
CommandE L
.L M
AddressM T
,T U
requestV ]
.] ^
Command^ e
.e f
NumberOfPlacesf t
,t u
request 
. 
Command 
.  
ContactEmail  ,
,, -
request. 5
.5 6
Command6 =
.= >
ContactPhone> J
)J K
;K L
if 
( 
result 
. 
	IsFailure  
)  !
{ 
return 
ResponseStatusCodes *
.* +

BadRequest+ 5
;5 6
} 
await 

repository 
. 
Update #
(# $
clinic$ *
)* +
;+ ,
return 
ResponseStatusCodes &
.& '
Ok' )
;) *
}   	
}!! 
}"" ¯
yC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.Application\Queries\VetClinics\Vets\DeleteVetFromVetClinicQuery.cs
	namespace 	
VetAppointment
 
. 
Application $
.$ %
Queries% ,
., -

VetClinics- 7
.7 8
Vets8 <
{ 
public 

class '
DeleteVetFromVetClinicQuery ,
:- .
IRequest/ 7
<7 8
VetResponse8 C
>C D
{ 
public 
Guid 
ClinicId 
{ 
get "
;" #
}$ %
public		 
Guid		 
VetId		 
{		 
get		 
;		  
}		! "
public '
DeleteVetFromVetClinicQuery *
(* +
Guid+ /
clinicId0 8
,8 9
Guid: >
vetId? D
)D E
{ 	
ClinicId 
= 
clinicId 
;  
VetId 
= 
vetId 
; 
} 	
} 
} Ø
ÄC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.Application\Queries\VetClinics\Vets\DeleteVetFromVetClinicQueryHandler.cs
	namespace 	
VetAppointment
 
. 
Application $
.$ %
Queries% ,
., -

VetClinics- 7
.7 8
Vets8 <
{ 
public 

class .
"DeleteVetFromVetClinicQueryHandler 3
:4 5
IRequestHandler6 E
<E F'
DeleteVetFromVetClinicQueryF a
,a b
VetResponsec n
>n o
{		 
private

 
readonly

 
IUnitOfWork

 $

unitOfWork

% /
;

/ 0
public .
"DeleteVetFromVetClinicQueryHandler 1
(1 2
IUnitOfWork2 =

unitOfWork> H
)H I
=>J L
thisM Q
.Q R

unitOfWorkR \
=] ^

unitOfWork_ i
;i j
public 
async 
Task 
< 
VetResponse %
>% &
Handle' -
(- .'
DeleteVetFromVetClinicQuery. I
requestJ Q
,Q R
CancellationTokenS d
cancellationTokene v
)v w
{ 	
var 
	vetClinic 
= 
await !

unitOfWork" ,
., -
VetClinicRepository- @
.@ A
GetA D
(D E
requestE L
.L M
ClinicIdM U
)U V
;V W
if 
( 
	vetClinic 
== 
null !
)! "
{ 
return 
null 
; 
} 
var 
vet 
= 
	vetClinic 
.  
Vets  $
.$ %
FirstOrDefault% 3
(3 4
v4 5
=>6 8
v9 :
.: ;
Id; =
==> @
requestA H
.H I
VetIdI N
)N O
;O P
if 
( 
vet 
== 
null 
) 
{ 
return 
null 
; 
} 
await 

unitOfWork 
. 
VetRepository *
.* +
Delete+ 1
(1 2
vet2 5
)5 6
;6 7
return 
	VetMapper 
. 
Mapper #
.# $
Map$ '
<' (
VetResponse( 3
>3 4
(4 5
vet5 8
)8 9
;9 :
} 	
}   
}!! ⁄
zC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.Application\Queries\VetClinics\Vets\GetAllVetsFromVetClinicQuery.cs
	namespace 	
VetAppointment
 
. 
Application $
.$ %
Queries% ,
., -

VetClinics- 7
.7 8
Vets8 <
{ 
public 

class (
GetAllVetsFromVetClinicQuery -
:. /
IRequest0 8
<8 9
List9 =
<= >
VetResponse> I
>I J
>J K
{ 
public 
Guid 
VetClinicId 
{  !
get" %
;% &
set' *
;* +
}, -
public

 (
GetAllVetsFromVetClinicQuery

 +
(

+ ,
Guid

, 0
vetClinicId

1 <
)

< =
=>

> @
VetClinicId

A L
=

M N
vetClinicId

O Z
;

Z [
} 
} È
ÅC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.Application\Queries\VetClinics\Vets\GetAllVetsFromVetClinicQueryHandler.cs
	namespace 	
VetAppointment
 
. 
Application $
.$ %
Queries% ,
., -

VetClinics- 7
.7 8
Vets8 <
{ 
public		 

class		 /
#GetAllVetsFromVetClinicQueryHandler		 4
:		5 6
IRequestHandler		7 F
<		F G(
GetAllVetsFromVetClinicQuery		G c
,		c d
List		e i
<		i j
VetResponse		j u
>		u v
>		v w
{

 
private 
readonly 
IRepository $
<$ %
	VetClinic% .
>. /

repository0 :
;: ;
public /
#GetAllVetsFromVetClinicQueryHandler 2
(2 3
IRepository3 >
<> ?
	VetClinic? H
>H I

repositoryJ T
)T U
=>V X
thisY ]
.] ^

repository^ h
=i j

repositoryk u
;u v
public 
async 
Task 
< 
List 
< 
VetResponse *
>* +
>+ ,
Handle- 3
(3 4(
GetAllVetsFromVetClinicQuery4 P
requestQ X
,X Y
CancellationTokenZ k
cancellationTokenl }
)} ~
{ 	
var 
	vetClinic 
= 
await !

repository" ,
., -
Get- 0
(0 1
request1 8
.8 9
VetClinicId9 D
)D E
;E F
if 
( 
	vetClinic 
== 
null !
)! "
{ 
return 
null 
; 
} 
return 
	VetMapper 
. 
Mapper #
.# $
Map$ '
<' (
List( ,
<, -
VetResponse- 8
>8 9
>9 :
(: ;
	vetClinic; D
.D E
VetsE I
)I J
;J K
} 	
} 
} ª	
vC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.Application\Queries\VetClinics\Vets\GetVetFromVetClinicQuery.cs
	namespace 	
VetAppointment
 
. 
Application $
.$ %
Queries% ,
., -

VetClinics- 7
.7 8
Vets8 <
{ 
public 

class $
GetVetFromVetClinicQuery )
:* +
IRequest, 4
<4 5
VetResponse5 @
>@ A
{ 
public 
Guid 
VetClinicId 
{  !
get" %
;% &
set' *
;* +
}, -
public		 
Guid		 
VetId		 
{		 
get		 
;		  
set		! $
;		$ %
}		& '
public $
GetVetFromVetClinicQuery '
(' (
Guid( ,
vetClinicId- 8
,8 9
Guid: >
vetId? D
)D E
{ 	
VetClinicId 
= 
vetClinicId %
;% &
VetId 
= 
vetId 
; 
} 	
} 
} ¶
}C:\Users\Leonard\Desktop\VetAppointment\VetAppointment.Application\Queries\VetClinics\Vets\GetVetFromVetClinicQueryHandler.cs
	namespace 	
VetAppointment
 
. 
Application $
.$ %
Queries% ,
., -

VetClinics- 7
.7 8
Vets8 <
{ 
public		 

class		 +
GetVetFromVetClinicQueryHandler		 0
:		1 2
IRequestHandler		3 B
<		B C$
GetVetFromVetClinicQuery		C [
,		[ \
VetResponse		] h
>		h i
{

 
private 
readonly 
IRepository $
<$ %
	VetClinic% .
>. /

repository0 :
;: ;
public +
GetVetFromVetClinicQueryHandler .
(. /
IRepository/ :
<: ;
	VetClinic; D
>D E

repositoryF P
)P Q
=>R T
thisU Y
.Y Z

repositoryZ d
=e f

repositoryg q
;q r
public 
async 
Task 
< 
VetResponse %
>% &
Handle' -
(- .$
GetVetFromVetClinicQuery. F
requestG N
,N O
CancellationTokenP a
cancellationTokenb s
)s t
{ 	
var 
	vetClinic 
= 
await !

repository" ,
., -
Get- 0
(0 1
request1 8
.8 9
VetClinicId9 D
)D E
;E F
if 
( 
	vetClinic 
== 
null !
)! "
{ 
return 
null 
; 
} 
var 
vet 
= 
	vetClinic 
.  
Vets  $
.$ %
FirstOrDefault% 3
(3 4
v4 5
=>6 8
v9 :
.: ;
Id; =
==> @
requestA H
.H I
VetIdI N
)N O
;O P
if 
( 
vet 
== 
null 
) 
{ 
return 
null 
; 
} 
return 
	VetMapper 
. 
Mapper #
.# $
Map$ '
<' (
VetResponse( 3
>3 4
(4 5
vet5 8
)8 9
;9 :
} 	
} 
}   ∏	
uC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.Application\Queries\VetClinics\Vets\PostVetInVetClinicQuery.cs
	namespace 	
VetAppointment
 
. 
Application $
.$ %
Queries% ,
., -

VetClinics- 7
.7 8
Vets8 <
{ 
public 

class #
PostVetInVetClinicQuery (
:) *
IRequest+ 3
<3 4
VetResponse4 ?
>? @
{ 
public 
Guid 
VetClinicId 
{  !
get" %
;% &
set' *
;* +
}, -
public		 
Guid		 
VetId		 
{		 
get		 
;		 
set		  #
;		# $
}		% &
public #
PostVetInVetClinicQuery &
(& '
Guid' +
vetClinicId, 7
,7 8
Guid9 =
vetId> C
)C D
{ 	
VetClinicId 
= 
vetClinicId %
;% &
VetId 
= 
vetId 
; 
} 	
} 
} »
|C:\Users\Leonard\Desktop\VetAppointment\VetAppointment.Application\Queries\VetClinics\Vets\PostVetInVetClinicQueryHandler.cs
	namespace 	
VetAppointment
 
. 
Application $
.$ %
Queries% ,
., -

VetClinics- 7
.7 8
Vets8 <
{ 
public 

class *
PostVetInVetClinicQueryHandler /
:0 1
IRequestHandler2 A
<A B#
PostVetInVetClinicQueryB Y
,Y Z
VetResponse[ f
>f g
{		 
private

 
readonly

 
IUnitOfWork

 $

unitOfWork

% /
;

/ 0
public *
PostVetInVetClinicQueryHandler -
(- .
IUnitOfWork. 9

unitOfWork: D
)D E
=>F H
thisI M
.M N

unitOfWorkN X
=Y Z

unitOfWork[ e
;e f
public 
async 
Task 
< 
VetResponse %
>% &
Handle' -
(- .#
PostVetInVetClinicQuery. E
requestF M
,M N
CancellationTokenO `
cancellationTokena r
)r s
{ 	
var 
	vetClinic 
= 
await !

unitOfWork" ,
., -
VetClinicRepository- @
.@ A
GetA D
(D E
requestE L
.L M
VetClinicIdM X
)X Y
;Y Z
var 
vet 
= 
await 

unitOfWork &
.& '
VetRepository' 4
.4 5
Get5 8
(8 9
request9 @
.@ A
VetIdA F
)F G
;G H
if 
( 
vet 
== 
null 
|| 
	vetClinic (
==) +
null, 0
)0 1
{ 
return 
null 
; 
} 
	vetClinic 
. 
RegisterVetToClinic )
() *
vet* -
)- .
;. /
vet 
= 
await 

unitOfWork "
." #
VetRepository# 0
.0 1
Update1 7
(7 8
vet8 ;
); <
;< =
await 

unitOfWork 
. 
VetClinicRepository 0
.0 1
Update1 7
(7 8
	vetClinic8 A
)A B
;B C
return 
	VetMapper 
. 
Mapper #
.# $
Map$ '
<' (
VetResponse( 3
>3 4
(4 5
vet5 8
)8 9
;9 :
} 	
} 
}   è
yC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.Application\Queries\VetClinics\Vets\UpdateVetFromVetClinicQuery.cs
	namespace 	
VetAppointment
 
. 
Application $
.$ %
Queries% ,
., -

VetClinics- 7
.7 8
Vets8 <
{ 
public 

class '
UpdateVetFromVetClinicQuery ,
:- .
IRequest/ 7
<7 8
ResponseStatusCodes8 K
>K L
{ 
public		 
Guid		 
ClinicId		 
{		 
get		 "
;		" #
}		$ %
public

 
Guid

 
VetId

 
{

 
get

 
;

  
}

! "
public 
CreateVetCommand 
Command  '
{( )
get* -
;- .
}/ 0
public '
UpdateVetFromVetClinicQuery *
(* +
Guid+ /
clinicId0 8
,8 9
Guid: >
vetId? D
,D E
CreateVetCommandF V
commandW ^
)^ _
{ 	
ClinicId 
= 
clinicId 
;  
VetId 
= 
vetId 
; 
Command 
= 
command 
; 
} 	
} 
} ö
ÄC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.Application\Queries\VetClinics\Vets\UpdateVetFromVetClinicQueryHandler.cs
	namespace 	
VetAppointment
 
. 
Application $
.$ %
Queries% ,
., -

VetClinics- 7
.7 8
Vets8 <
{ 
public 

class .
"UpdateVetFromVetClinicQueryHandler 3
:4 5
IRequestHandler6 E
<E F'
UpdateVetFromVetClinicQueryF a
,a b
ResponseStatusCodesc v
>v w
{ 
private		 
readonly		 
IUnitOfWork		 $

unitOfWork		% /
;		/ 0
public .
"UpdateVetFromVetClinicQueryHandler 1
(1 2
IUnitOfWork2 =

unitOfWork> H
)H I
=>J L
thisM Q
.Q R

unitOfWorkR \
=] ^

unitOfWork_ i
;i j
public 
async 
Task 
< 
ResponseStatusCodes -
>- .
Handle/ 5
(5 6'
UpdateVetFromVetClinicQuery6 Q
requestR Y
,Y Z
CancellationToken[ l
cancellationTokenm ~
)~ 
{ 	
var 
	vetClinic 
= 
await !

unitOfWork" ,
., -
VetClinicRepository- @
.@ A
GetA D
(D E
requestE L
.L M
ClinicIdM U
)U V
;V W
if 
( 
	vetClinic 
== 
null !
)! "
{ 
return 
ResponseStatusCodes *
.* +
NotFound+ 3
;3 4
} 
var 
vet 
= 
	vetClinic 
.  
Vets  $
.$ %
FirstOrDefault% 3
(3 4
v4 5
=>6 8
v9 :
.: ;
Id; =
==> @
requestA H
.H I
VetIdI N
)N O
;O P
if 
( 
vet 
== 
null 
) 
{ 
return 
ResponseStatusCodes *
.* +
NotFound+ 3
;3 4
} 
var 
result 
= 
vet 
. 
Update #
(# $
request$ +
.+ ,
Command, 3
.3 4
Name4 8
,8 9
request: A
.A B
CommandB I
.I J
SurnameJ Q
,Q R
requestS Z
.Z [
Command[ b
.b c
	Birthdatec l
,l m
request 
. 
Command 
.  
Gender  &
,& '
request( /
./ 0
Command0 7
.7 8
Email8 =
,= >
request? F
.F G
CommandG N
.N O
PhoneO T
,T U
requestV ]
.] ^
Command^ e
.e f
Specialisationf t
)t u
;u v
if 
( 
result 
. 
	IsFailure  
)  !
{ 
return   
ResponseStatusCodes   *
.  * +

BadRequest  + 5
;  5 6
}!! 
await## 

unitOfWork## 
.## 
VetRepository## *
.##* +
Update##+ 1
(##1 2
vet##2 5
)##5 6
;##6 7
return%% 
ResponseStatusCodes%% &
.%%& '
	NoContent%%' 0
;%%0 1
}&& 	
}'' 
}(( æ
bC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.Application\Response\AppointmentResponse.cs
	namespace 	
VetAppointment
 
. 
Application $
.$ %
Response% -
{ 
public 

class 
AppointmentResponse $
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
string 
? 
ScheduledDate $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
int &
EstimatedDurationInMinutes -
{. /
get0 3
;3 4
set5 8
;8 9
}: ;
public 
Guid 
VetId 
{ 
get 
;  
set! $
;$ %
}& '
public		 
Guid		 
PetId		 
{		 
get		 
;		  
set		! $
;		$ %
}		& '
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
} π
[C:\Users\Leonard\Desktop\VetAppointment\VetAppointment.Application\Response\DrugResponse.cs
	namespace 	
VetAppointment
 
. 
Application $
.$ %
Response% -
{ 
public 

class 
DrugResponse 
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
double 
Quantity 
{  
get! $
;$ %
set& )
;) *
}+ ,
public		 
double		 
	UnitPrice		 
{		  !
get		" %
;		% &
set		' *
;		* +
}		, -
}

 
} ¡
_C:\Users\Leonard\Desktop\VetAppointment\VetAppointment.Application\Response\PetOwnerResponse.cs
	namespace 	
VetAppointment
 
. 
Application $
.$ %
Response% -
{ 
public 

class 
PetOwnerResponse !
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
public 
Guid 
ClinicId 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
public		 
string		 
Surname		 
{		 
get		  #
;		# $
set		% (
;		( )
}		* +
public

 
string

 
	Birthdate

 
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
public 
string 
Gender 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 
Address 
{ 
get  #
;# $
set% (
;( )
}* +
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
Phone 
{ 
get !
;! "
set# &
;& '
}( )
} 
} Ä
ZC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.Application\Response\PetResponse.cs
	namespace 	
VetAppointment
 
. 
Application $
.$ %
Response% -
{ 
public 

class 
PetResponse 
{ 
public 
Guid 
OwnerId 
{ 
get !
;! "
set# &
;& '
}( )
public 
Guid 
ClinicId 
{ 
get "
;" #
set$ '
;' (
}) *
public 
Guid 
Id 
{ 
get 
; 
set !
;! "
}# $
public		 
string		 
Name		 
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
 
	Birthdate

 
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
public 
string 
Race 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
Gender 
{ 
get "
;" #
set$ '
;' (
}) *
} 
} ÿ
eC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.Application\Response\PrescribedDrugResponse.cs
	namespace 	
VetAppointment
 
. 
Application $
.$ %
Response% -
{ 
public 

class "
PrescribedDrugResponse '
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
Guid 
DrugToPrescribeId %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
double 
Quantity 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
double 
	TotalCost 
{  !
get" %
;% &
set' *
;* +
}, -
}		 
}

 ò
bC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.Application\Response\ResponseStatusCodes.cs
	namespace 	
VetAppointment
 
. 
Application $
.$ %
Response% -
{ 
public 

enum 
ResponseStatusCodes #
{ 
Ok 

= 
$num 
, 
Created 
= 
$num 
, 
Accepted 
= 
$num 
, 
	NoContent 
= 
$num 
, 

BadRequest		 
=		 
$num		 
,		 
Unauthorized

 
=

 
$num

 
,

 
	Forbidden 
= 
$num 
, 
NotFound 
= 
$num 
, 
MethodNotAllowed 
= 
$num 
, 
Conflict 
= 
$num 
, 
InternalServerError 
= 
$num !
,! "
NotImplemented 
= 
$num 
, 

BadGateway 
= 
$num 
, 
ServiceUnavailable 
= 
$num  
,  !
GatewayTimeout 
= 
$num 
} 
} Ã
`C:\Users\Leonard\Desktop\VetAppointment\VetAppointment.Application\Response\VetClinicResponse.cs
	namespace 	
VetAppointment
 
. 
Application $
.$ %
Response% -
{ 
public 

class 
VetClinicResponse "
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
public 
Guid 
MedicalHistoryId $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
DateTime 
RegistrationDate (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
public		 
string		 
Name		 
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
 
Address

 
{

 
get

  #
;

# $
set

% (
;

( )
}

* +
public 
int 
NumberOfPlaces !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string 
ContactEmail "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
string 
ContactPhone "
{# $
get% (
;( )
set* -
;- .
}/ 0
} 
} æ
ZC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.Application\Response\VetResponse.cs
	namespace 	
VetAppointment
 
. 
Application $
.$ %
Response% -
{ 
public 

class 
VetResponse 
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
public 
Guid 
ClinicId 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
public		 
string		 
Surname		 
{		 
get		  #
;		# $
set		% (
;		( )
}		* +
public

 
string

 
	Birthdate

 
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
public 
string 
Gender 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
Phone 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
Specialisation $
{% &
get' *
;* +
set, /
;/ 0
}1 2
} 
} 