�d
�D:\Facultate\Anul_3\.NET\VetAppointment_S12\VetAppointment - APIs + Tests\VetAppointment - Working\VetAppointment.API\Controllers\AppointmentsController.cs
	namespace 	
VetAppointment
 
. 
API 
. 
Controllers (
{ 
[		 
Route		 

(		
 
$str		  
)		  !
]		! "
[

 
ApiController

 
]

 
public 

class "
AppointmentsController '
:( )
ControllerBase* 8
{ 
private 
readonly 
IUnitOfWork $

unitOfWork% /
;/ 0
public "
AppointmentsController %
(% &
IUnitOfWork& 1

unitOfWork2 <
)< =
=>> @
thisA E
.E F

unitOfWorkF P
=Q R

unitOfWorkS ]
;] ^
[ 	
HttpPost	 
] 
public 
IActionResult 
Create #
(# $
[$ %
FromBody% -
]- . 
CreateAppointmentDto/ C
appointmentDtoD R
)R S
{ 	
var 
pet 
= 

unitOfWork  
.  !
PetRepository! .
.. /
Get/ 2
(2 3
appointmentDto3 A
.A B
PetIdB G
)G H
;H I
if 
( 
pet 
== 
null 
) 
{ 
return 
NotFound 
(  
)  !
;! "
} 
var 
vet 
= 

unitOfWork  
.  !
VetRepository! .
.. /
Get/ 2
(2 3
appointmentDto3 A
.A B
VetIdB G
)G H
;H I
if 
( 
vet 
== 
null 
) 
{ 
return 
NotFound 
(  
)  !
;! "
} 
var   
appointment   
=   
Appointment   )
.  ) *
SettleAppointment  * ;
(  ; <
vet!! 
,!! 
pet"" 
,"" 
appointmentDto## "
.##" #
ScheduledDate### 0
,##0 1
appointmentDto$$ "
.$$" #&
EstimatedDurationInMinutes$$# =
)%% 
;%% 
var'' 

treatement'' 
='' 

unitOfWork'' '
.''' (
TreatmentRepository''( ;
.''; <
Get''< ?
(''? @
appointmentDto''@ N
.''N O
TreatmentId''O Z
)''Z [
;''[ \
if(( 
((( 

treatement(( 
==(( 
null(( "
)((# $
{)) 
return** 
NotFound** 
(**  
)**  !
;**! "
}++ 
var-- 
history-- 
=-- 

unitOfWork-- $
.--$ %$
MedicalHistoryRepository--% =
.--= >
Get--> A
(--A B
appointmentDto--B P
.--P Q
MedicalHistoryId--Q a
)--a b
;--b c
if.. 
(.. 
history.. 
==.. 
null.. 
)..  
{// 
return00 
NotFound00 
(00  
)00  !
;00! "
}11 
history33 
.33 (
RegisterAppointmentToHistory33 0
(330 1
appointment331 <
.33< =
Entity33= C
)33C D
;33D E

unitOfWork44 
.44 $
MedicalHistoryRepository44 /
.44/ 0
Update440 6
(446 7
history447 >
)44> ?
;44? @

unitOfWork55 
.55 
SaveChanges55 "
(55" #
)55# $
;55$ %
appointment77 
.77 
Entity77 
.77 (
AttachTreatmentToAppointment77 ;
(77; <

treatement77< F
)77F G
;77G H
appointment88 
.88 
Entity88 
.88 -
!AttachAppointmentToMedicalHistory88 @
(88@ A
history88A H
)88H I
;88I J
if;; 
(;; 
appointment;; 
.;; 
	IsFailure;; %
);;% &
{<< 
return== 

BadRequest== !
(==! "
appointment==" -
.==- .
Error==. 3
)==3 4
;==4 5
}>> 

unitOfWork@@ 
.@@ !
AppointmentRepository@@ ,
.@@, -
Add@@- 0
(@@0 1
appointment@@1 <
.@@< =
Entity@@= C
)@@C D
;@@D E

unitOfWorkAA 
.AA 
SaveChangesAA "
(AA" #
)AA# $
;AA$ %
varBB 
fullAppointmentBB 
=BB  !
newBB" %
AppointmentDtoBB& 4
{CC 
IdDD 
=DD 
appointmentDD  
.DD  !
EntityDD! '
.DD' (
IdDD( *
,DD* +
VetIdEE 
=EE 
appointmentEE #
.EE# $
EntityEE$ *
.EE* +
VetIdEE+ 0
,EE0 1
PetIdFF 
=FF 
appointmentFF #
.FF# $
EntityFF$ *
.FF* +
PetIdFF+ 0
,FF0 1
ScheduledDateGG 
=GG 
appointmentGG  +
.GG+ ,
EntityGG, 2
.GG2 3
ScheduledDateGG3 @
.GG@ A
ToStringGGA I
(GGI J
)GGJ K
,GGK L&
EstimatedDurationInMinutesHH *
=HH+ ,
appointmentHH- 8
.HH8 9
EntityHH9 ?
.HH? @&
EstimatedDurationInMinutesHH@ Z
}II 
;II 
returnKK 
CreatedKK 
(KK 
nameofKK !
(KK! "
GetAllAppointmentsKK" 4
)KK4 5
,KK5 6
fullAppointmentKK7 F
)KKF G
;KKG H
}LL 	
[NN 	
HttpGetNN	 
]NN 
publicOO 
IActionResultOO 
GetAllAppointmentsOO /
(OO/ 0
)OO0 1
{PP 	
varQQ 
appointmentsQQ 
=QQ 

unitOfWorkQQ )
.QQ) *!
AppointmentRepositoryQQ* ?
.QQ? @
AllQQ@ C
(QQC D
)QQD E
.QQE F
SelectQQF L
(QQL M
appointmentQQM X
=>QQY [
newQQ\ _
AppointmentDtoQQ` n
(QQn o
)QQo p
{RR 
IdSS 
=SS 
appointmentSS  
.SS  !
IdSS! #
,SS# $
VetIdTT 
=TT 
appointmentTT #
.TT# $
VetIdTT$ )
,TT) *
PetIdUU 
=UU 
appointmentUU #
.UU# $
PetIdUU$ )
,UU) *
ScheduledDateVV 
=VV 
appointmentVV  +
.VV+ ,
ScheduledDateVV, 9
.VV9 :
ToStringVV: B
(VVB C
)VVC D
,VVD E&
EstimatedDurationInMinutesWW *
=WW+ ,
appointmentWW- 8
.WW8 9&
EstimatedDurationInMinutesWW9 S
,WWS T
TreatmentIdXX 
=XX 
appointmentXX )
.XX) *
TreatmentIdXX* 5
,XX5 6
MedicalHistoryIdYY  
=YY! "
appointmentYY# .
.YY. /
MedicalHistoryIdYY/ ?
}ZZ 
)ZZ 
;ZZ 
return\\ 
Ok\\ 
(\\ 
appointments\\ "
)\\" #
;\\# $
}]] 	
[__ 	
HttpGet__	 
(__ 
$str__ 
)__ 
]__ 
public`` 
IActionResult`` 
GetAppointmentById`` /
(``/ 0
Guid``0 4
id``5 7
)``7 8
{aa 	
varbb 
appointmentbb 
=bb 

unitOfWorkbb (
.bb( )!
AppointmentRepositorybb) >
.bb> ?
Getbb? B
(bbB C
idbbC E
)bbE F
;bbF G
ifcc 
(cc 
appointmentcc 
==cc 
nullcc #
)cc# $
{dd 
returnee 
NotFoundee 
(ee  
)ee  !
;ee! "
}ff 
varhh 
appointmentDtohh 
=hh  
newhh! $
AppointmentDtohh% 3
{ii 
Idjj 
=jj 
appointmentjj  
.jj  !
Idjj! #
,jj# $
VetIdkk 
=kk 
appointmentkk #
.kk# $
VetIdkk$ )
,kk) *
PetIdll 
=ll 
appointmentll #
.ll# $
PetIdll$ )
,ll) *
ScheduledDatemm 
=mm 
appointmentmm  +
.mm+ ,
ScheduledDatemm, 9
.mm9 :
ToStringmm: B
(mmB C
)mmC D
,mmD E&
EstimatedDurationInMinutesnn *
=nn+ ,
appointmentnn- 8
.nn8 9&
EstimatedDurationInMinutesnn9 S
,nnS T
TreatmentIdoo 
=oo 
appointmentoo )
.oo) *
TreatmentIdoo* 5
,oo5 6
MedicalHistoryIdpp  
=pp! "
appointmentpp# .
.pp. /
MedicalHistoryIdpp/ ?
}qq 
;qq 
returnss 
Okss 
(ss 
appointmentDtoss $
)ss$ %
;ss% &
}tt 	
[vv 	

HttpDeletevv	 
(vv 
$strvv 
)vv 
]vv 
publicww 
IActionResultww 
DeleteAppointmentww .
(ww. /
Guidww/ 3
idww4 6
)ww6 7
{xx 	
varyy 
appointmentyy 
=yy 

unitOfWorkyy (
.yy( )!
AppointmentRepositoryyy) >
.yy> ?
Getyy? B
(yyB C
idyyC E
)yyE F
;yyF G
ifzz 
(zz 
appointmentzz 
==zz 
nullzz #
)zz# $
{{{ 
return|| 
NotFound|| 
(||  
)||  !
;||! "
}}} 

unitOfWork 
. !
AppointmentRepository ,
., -
Delete- 3
(3 4
appointment4 ?
)? @
;@ A

unitOfWork
�� 
.
�� 
SaveChanges
�� "
(
��" #
)
��# $
;
��$ %
return
�� 
	NoContent
�� 
(
�� 
)
�� 
;
�� 
}
�� 	
[
�� 	
HttpPut
��	 
(
�� 
$str
�� 
)
�� 
]
�� 
public
�� 
IActionResult
�� 
UpdateAppointment
�� .
(
��. /
Guid
��/ 3
id
��4 6
,
��6 7
[
��8 9
FromBody
��9 A
]
��A B
AppointmentDto
��C Q
appointmentDto
��R `
)
��` a
{
�� 	
var
�� 
appointment
�� 
=
�� 

unitOfWork
�� (
.
��( )#
AppointmentRepository
��) >
.
��> ?
Get
��? B
(
��B C
id
��C E
)
��E F
;
��F G
if
�� 
(
�� 
appointment
�� 
==
�� 
null
�� #
)
��# $
{
�� 
return
�� 
NotFound
�� 
(
��  
)
��  !
;
��! "
}
�� 
appointment
�� 
.
�� 
Update
�� 
(
�� 
appointment
�� *
.
��* +
VetId
��+ 0
,
��0 1
appointmentDto
��2 @
.
��@ A
PetId
��A F
,
��F G
appointmentDto
��H V
.
��V W
ScheduledDate
��W d
,
��d e
appointmentDto
�� 
.
�� (
EstimatedDurationInMinutes
�� 9
,
��9 :
appointmentDto
��; I
.
��I J
TreatmentId
��J U
,
��U V
appointmentDto
��W e
.
��e f
MedicalHistoryId
��f v
)
��v w
;
��w x

unitOfWork
�� 
.
�� #
AppointmentRepository
�� ,
.
��, -
Update
��- 3
(
��3 4
appointment
��4 ?
)
��? @
;
��@ A

unitOfWork
�� 
.
�� 
SaveChanges
�� "
(
��" #
)
��# $
;
��$ %
return
�� 
	NoContent
�� 
(
�� 
)
�� 
;
�� 
}
�� 	
}
�� 
}�� �7
�D:\Facultate\Anul_3\.NET\VetAppointment_S12\VetAppointment - APIs + Tests\VetAppointment - Working\VetAppointment.API\Controllers\DrugsController.cs
	namespace 	
VetAppointment
 
. 
API 
. 
Controllers (
{ 
[		 
Route		 

(		
 
$str		  
)		  !
]		! "
[

 
ApiController

 
]

 
public 

class 
DrugsController  
:! "
ControllerBase# 1
{ 
private 
readonly 
IRepository $
<$ %
Drug% )
>) *
drugRepository+ 9
;9 :
public 
DrugsController 
( 
IRepository *
<* +
Drug+ /
>/ 0
drugRepository1 ?
)? @
=>A C
thisD H
.H I
drugRepositoryI W
=X Y
drugRepositoryZ h
;h i
[ 	
HttpGet	 
] 
public 
IActionResult 
Get  
(  !
)! "
{ 	
var 
drugs 
= 
drugRepository &
.& '
All' *
(* +
)+ ,
., -
Select- 3
( 
d 
=> 
new 
DrugDto $
{ 
Id 
= 
d 
. 
Id !
,! "
Name 
= 
d  
.  !
Name! %
,% &
Quantity  
=! "
d# $
.$ %
Quantity% -
,- .
	UnitPrice !
=" #
d$ %
.% &
	UnitPrice& /
} 
) 
; 
return 
Ok 
( 
drugs 
) 
; 
}   	
["" 	
HttpGet""	 
("" 
$str""  
)""  !
]""! "
public## 
IActionResult## 
Get##  
(##  !
Guid##! %
drugId##& ,
)##, -
{$$ 	
{%% 
var&& 
drug&& 
=&& 
drugRepository&& )
.&&) *
Get&&* -
(&&- .
drugId&&. 4
)&&4 5
;&&5 6
if(( 
((( 
drug(( 
==(( 
null((  
)((  !
{)) 
return** 
NotFound** #
(**# $
)**$ %
;**% &
}++ 
var-- 
drugDto-- 
=-- 
new-- !
DrugDto--" )
{.. 
Id// 
=// 
drug// 
.// 
Id//  
,//  !
Name00 
=00 
drug00 
.00  
Name00  $
,00$ %
Quantity11 
=11 
drug11 #
.11# $
Quantity11$ ,
,11, -
	UnitPrice22 
=22 
drug22  $
.22$ %
	UnitPrice22% .
}33 
;33 
return55 
Ok55 
(55 
drugDto55 !
)55! "
;55" #
}66 
}77 	
[99 	
HttpPost99	 
]99 
public:: 
IActionResult:: 
Create:: #
(::# $
[::$ %
FromBody::% -
]::- .
CreateDrugDto::/ <
drugDto::= D
)::D E
{;; 	
var<< 
drug<< 
=<< 
Drug<< 
.<< 
Create<< "
(<<" #
drugDto== 
.== 
Name==  
,==  !
drugDto>> 
.>> 
Quantity>> $
,>>$ %
drugDto?? 
.?? 
	UnitPrice?? %
)@@ 
;@@ 
ifBB 
(BB 
drugBB 
.BB 
	IsFailureBB 
)BB 
{CC 
returnDD 

BadRequestDD !
(DD! "
drugDD" &
.DD& '
ErrorDD' ,
)DD, -
;DD- .
}EE 
drugRepositoryGG 
.GG 
AddGG 
(GG 
drugGG #
.GG# $
EntityGG$ *
)GG* +
;GG+ ,
drugRepositoryHH 
.HH 
SaveChangesHH &
(HH& '
)HH' (
;HH( )
returnJJ 
CreatedJJ 
(JJ 
nameofJJ !
(JJ! "
GetJJ" %
)JJ% &
,JJ& '
drugJJ( ,
.JJ, -
EntityJJ- 3
)JJ3 4
;JJ4 5
}KK 	
[MM 	

HttpDeleteMM	 
(MM 
$strMM #
)MM# $
]MM$ %
publicNN 
IActionResultNN 
DeleteNN #
(NN# $
GuidNN$ (
drugIdNN) /
)NN/ 0
{OO 	
varPP 
drugPP 
=PP 
drugRepositoryPP %
.PP% &
GetPP& )
(PP) *
drugIdPP* 0
)PP0 1
;PP1 2
ifQQ 
(QQ 
drugQQ 
==QQ 
nullQQ 
)QQ 
{RR 
returnSS 
NotFoundSS 
(SS  
)SS  !
;SS! "
}TT 
drugRepositoryVV 
.VV 
DeleteVV !
(VV! "
drugVV" &
)VV& '
;VV' (
drugRepositoryWW 
.WW 
SaveChangesWW &
(WW& '
)WW' (
;WW( )
returnXX 
OkXX 
(XX 
)XX 
;XX 
}YY 	
[[[ 	
HttpPut[[	 
([[ 
$str[[  
)[[  !
][[! "
public\\ 
IActionResult\\ 
Update\\ #
(\\# $
Guid\\$ (
drugId\\) /
,\\/ 0
[\\1 2
FromBody\\2 :
]\\: ;
CreateDrugDto\\< I
drugDto\\J Q
)\\Q R
{]] 	
var^^ 
drug^^ 
=^^ 
drugRepository^^ %
.^^% &
Get^^& )
(^^) *
drugId^^* 0
)^^0 1
;^^1 2
if__ 
(__ 
drug__ 
==__ 
null__ 
)__ 
{`` 
returnaa 
NotFoundaa 
(aa  
)aa  !
;aa! "
}bb 
drugdd 
.dd 
Updatedd 
(dd 
drugDtodd 
.dd  
Namedd  $
,dd$ %
drugDtodd& -
.dd- .
Quantitydd. 6
,dd6 7
drugDtodd8 ?
.dd? @
	UnitPricedd@ I
)ddI J
;ddJ K
drugRepositoryff 
.ff 
Updateff !
(ff! "
drugff" &
)ff& '
;ff' (
drugRepositorygg 
.gg 
SaveChangesgg &
(gg& '
)gg' (
;gg( )
returnii 
Okii 
(ii 
drugii 
)ii 
;ii 
}jj 	
}kk 
}ll �4
�D:\Facultate\Anul_3\.NET\VetAppointment_S12\VetAppointment - APIs + Tests\VetAppointment - Working\VetAppointment.API\Controllers\MedicalHistoriesController.cs
	namespace 	
VetAppointment
 
. 
API 
. 
Controllers (
{		 
[

 
Route

 

(


 
$str

  
)

  !
]

! "
[ 
ApiController 
] 
public 

class &
MedicalHistoriesController +
:, -
ControllerBase. <
{ 
private 
readonly 
IUnitOfWork $

unitOfWork% /
;/ 0
public &
MedicalHistoriesController )
() *
IUnitOfWork* 5

unitOfWork6 @
)@ A
=>B D
thisE I
.I J

unitOfWorkJ T
=U V

unitOfWorkW a
;a b
[ 	
HttpGet	 
] 
public 
IActionResult 
Get  
(  !
)! "
{ 	
var 
medicalHistories  
=! "

unitOfWork# -
.- .$
MedicalHistoryRepository. F
. 
All 
( 
) 
. 
Select 
( 
history  
=>! #
new$ '
MedicalHistoryDto( 9
{: ;
Id< >
=? @
historyA H
.H I
IdI K
,K L
ClinicIdM U
=V W
historyX _
._ `
ClinicId` h
}i j
)k l
;l m
return 
Ok 
( 
medicalHistories &
)& '
;' (
} 	
[ 	
HttpPost	 
( 
$str 7
)7 8
]8 9
public 
IActionResult 
Post !
(! "
Guid" &
medicalHistoryId' 7
,7 8
[9 :
FromBody: B
]B C 
CreateAppointmentDtoD X
appointmentDtoY g
)g h
{ 	
var 
medicalHistory 
=  

unitOfWork! +
.+ ,$
MedicalHistoryRepository, D
.D E
GetE H
(H I
medicalHistoryIdI Y
)Y Z
;Z [
if   
(   
medicalHistory   
==   !
null  " &
)  & '
{!! 
return"" 
NotFound"" 
(""  
)""  !
;""! "
}## 
var%% 
pet%% 
=%% 

unitOfWork%%  
.%%  !
PetRepository%%! .
.%%. /
Get%%/ 2
(%%2 3
appointmentDto%%3 A
.%%A B
PetId%%B G
)%%G H
;%%H I
if&& 
(&& 
pet&& 
==&& 
null&& 
)&& 
{'' 
return(( 
NotFound(( 
(((  
)((  !
;((! "
})) 
var++ 
vet++ 
=++ 

unitOfWork++  
.++  !
VetRepository++! .
.++. /
Get++/ 2
(++2 3
appointmentDto++3 A
.++A B
VetId++B G
)++G H
;++H I
if,, 
(,, 
vet,, 
==,, 
null,, 
),, 
{-- 
return.. 
NotFound.. 
(..  
)..  !
;..! "
}// 
var11 
appointment11 
=11 
Appointment11 )
.11) *
SettleAppointment11* ;
(11; <
vet22 
,22 
pet33 
,33 
appointmentDto44 
.44 
ScheduledDate44 ,
,44, -
appointmentDto55 
.55 &
EstimatedDurationInMinutes55 9
)66 
;66 
if77 
(77 
appointment77 
.77 
	IsFailure77 %
)77% &
{88 
return99 

BadRequest99 !
(99! "
appointment99" -
.99- .
Error99. 3
)993 4
;994 5
}:: 
var<< 
result<< 
=<< 
medicalHistory<< '
.<<' ((
RegisterAppointmentToHistory<<( D
(<<D E
appointment<<E P
.<<P Q
Entity<<Q W
)<<W X
;<<X Y
if== 
(== 
result== 
.== 
	IsFailure==  
)==  !
{>> 
return?? 

BadRequest?? !
(??! "
result??" (
.??( )
Error??) .
)??. /
;??/ 0
}@@ 

unitOfWorkBB 
.BB !
AppointmentRepositoryBB ,
.BB, -
AddBB- 0
(BB0 1
appointmentBB1 <
.BB< =
EntityBB= C
)BBC D
;BBD E

unitOfWorkCC 
.CC 
SaveChangesCC "
(CC" #
)CC# $
;CC$ %
varEE 
fullAppointmentEE 
=EE  !
newEE" %
AppointmentDtoEE& 4
{FF 
IdGG 
=GG 
appointmentGG  
.GG  !
EntityGG! '
.GG' (
IdGG( *
,GG* +
ScheduledDateHH 
=HH 
appointmentHH  +
.HH+ ,
EntityHH, 2
.HH2 3
ScheduledDateHH3 @
.HH@ A
ToStringHHA I
(HHI J
)HHJ K
,HHK L&
EstimatedDurationInMinutesII *
=II+ ,
appointmentII- 8
.II8 9
EntityII9 ?
.II? @&
EstimatedDurationInMinutesII@ Z
,IIZ [
VetIdJJ 
=JJ 
appointmentJJ #
.JJ# $
EntityJJ$ *
.JJ* +
VetIdJJ+ 0
,JJ0 1
PetIdKK 
=KK 
appointmentKK #
.KK# $
EntityKK$ *
.KK* +
PetIdKK+ 0
,KK0 1
TreatmentIdLL 
=LL 
appointmentLL )
.LL) *
EntityLL* 0
.LL0 1
TreatmentIdLL1 <
,LL< =
MedicalHistoryIdMM  
=MM! "
appointmentMM# .
.MM. /
EntityMM/ 5
.MM5 6
MedicalHistoryIdMM6 F
}NN 
;NN 
returnPP 
CreatedPP 
(PP 
nameofPP !
(PP! "
PostPP" &
)PP& '
,PP' (
fullAppointmentPP) 8
)PP8 9
;PP9 :
}QQ 	
}RR 
}SS �G
�D:\Facultate\Anul_3\.NET\VetAppointment_S12\VetAppointment - APIs + Tests\VetAppointment - Working\VetAppointment.API\Controllers\PetOwnersController.cs
	namespace 	
VetAppointment
 
. 
API 
. 
Controllers (
{ 
[		 
Route		 

(		
 
$str		  
)		  !
]		! "
[

 
ApiController

 
]

 
public 

class 
PetOwnersController $
:% &
ControllerBase' 5
{ 
private 
readonly 
IRepository $
<$ %
PetOwner% -
>- .
petOwnerRepository/ A
;A B
private 
readonly 
IRepository $
<$ %
Pet% (
>( )
petRepository* 7
;7 8
public 
PetOwnersController "
(" #
IRepository# .
<. /
PetOwner/ 7
>7 8
petOwnerRepository9 K
,K L
IRepositoryM X
<X Y
PetY \
>\ ]
petRepository^ k
)k l
{ 	
this 
. 
petOwnerRepository #
=$ %
petOwnerRepository& 8
;8 9
this 
. 
petRepository 
=  
petRepository! .
;. /
} 	
[ 	
HttpGet	 
] 
public 
IActionResult 
Get  
(  !
)! "
{ 	
var 
	petOwners 
= 
petOwnerRepository .
. 
All 
( 
) 
. 
Select 
( 
owner 
=> 
new  
PetOwnerDto! ,
{ 
Id 
= 
owner "
." #
Id# %
,% &
Name 
= 
owner $
.$ %
Name% )
,) *
Surname   
=    !
owner  " '
.  ' (
Surname  ( /
,  / 0
	Birthdate!! !
=!!" #
owner!!$ )
.!!) *
	Birthdate!!* 3
.!!3 4
ToString!!4 <
(!!< =
)!!= >
,!!> ?
Gender"" 
=""  
owner""! &
.""& '
Gender""' -
.""- .
ToString"". 6
(""6 7
)""7 8
,""8 9
Address## 
=##  !
owner##" '
.##' (
Address##( /
,##/ 0
Email$$ 
=$$ 
owner$$  %
.$$% &
Email$$& +
,$$+ ,
Phone%% 
=%% 
owner%%  %
.%%% &
Phone%%& +
}&& 
)&& 
;&& 
return(( 
Ok(( 
((( 
	petOwners(( 
)((  
;((  !
})) 	
[++ 	
HttpPost++	 
]++ 
public,, 
IActionResult,, 
Create,, #
(,,# $
[,,$ %
FromBody,,% -
],,- .
CreatePetOwnerDto,,/ @
petOwnerDto,,A L
),,L M
{-- 	
var.. 
petOwner.. 
=.. 
PetOwner.. #
...# $
Create..$ *
(..+ ,
petOwnerDto// 
.//  
Name//  $
,//$ %
petOwnerDto00 
.00  
Surname00  '
,00' (
petOwnerDto11 
.11  
	Birthdate11  )
,11) *
petOwnerDto22 
.22  
Gender22  &
,22& '
petOwnerDto33 
.33  
Address33  '
,33' (
petOwnerDto44 
.44  
Email44  %
,44% &
petOwnerDto55 
.55  
Phone55  %
)66 
;66 
if88 
(88 
petOwner88 
.88 
	IsFailure88 "
)88" #
{99 
return:: 

BadRequest:: !
(::! "
petOwner::" *
.::* +
Error::+ 0
)::0 1
;::1 2
};; 
petOwnerRepository== 
.== 
Add== "
(==" #
petOwner==# +
.==+ ,
Entity==, 2
)==2 3
;==3 4
petOwnerRepository>> 
.>> 
SaveChanges>> *
(>>* +
)>>+ ,
;>>, -
var@@ 
fullPetOwner@@ 
=@@ 
new@@ "
PetOwnerDto@@# .
(@@. /
)@@/ 0
{AA 
NameBB 
=BB 
petOwnerBB 
.BB  
EntityBB  &
.BB& '
NameBB' +
,BB+ ,
SurnameCC 
=CC 
petOwnerCC "
.CC" #
EntityCC# )
.CC) *
SurnameCC* 1
,CC1 2
AddressDD 
=DD 
petOwnerDD "
.DD" #
EntityDD# )
.DD) *
AddressDD* 1
,DD1 2
	BirthdateEE 
=EE 
petOwnerEE $
.EE$ %
EntityEE% +
.EE+ ,
	BirthdateEE, 5
.EE5 6
ToStringEE6 >
(EE> ?
)EE? @
,EE@ A
EmailFF 
=FF 
petOwnerFF  
.FF  !
EntityFF! '
.FF' (
EmailFF( -
,FF- .
GenderGG 
=GG 
petOwnerGG !
.GG! "
EntityGG" (
.GG( )
GenderGG) /
.GG/ 0
ToStringGG0 8
(GG8 9
)GG9 :
,GG: ;
PhoneHH 
=HH 
petOwnerHH  
.HH  !
EntityHH! '
.HH' (
PhoneHH( -
,HH- .
IdII 
=II 
petOwnerII 
.II 
EntityII $
.II$ %
IdII% '
}JJ 
;JJ 
returnLL 
CreatedLL 
(LL 
nameofLL !
(LL! "
GetLL" %
)LL% &
,LL& '
fullPetOwnerLL( 4
)LL4 5
;LL5 6
}NN 	
[PP 	
HttpPostPP	 
(PP 
$strPP (
)PP( )
]PP) *
publicQQ 
IActionResultQQ 
RegisterPetsToOwnerQQ 0
(QQ0 1
GuidQQ1 5
ownerIdQQ6 =
,QQ= >
[QQ? @
FromBodyQQ@ H
]QQH I
ListQQJ N
<QQN O
CreatePetDtoQQO [
>QQ[ \
petsDtosQQ] e
)QQe f
{RR 	
varSS 
ownerSS 
=SS 
petOwnerRepositorySS *
.SS* +
GetSS+ .
(SS. /
ownerIdSS/ 6
)SS6 7
;SS7 8
ifTT 
(TT 
ownerTT 
==TT 
nullTT 
)TT 
{UU 
returnVV 
NotFoundVV 
(VV  
)VV  !
;VV! "
}WW 
varYY 
petsYY 
=YY 
petsDtosYY 
.YY  
SelectYY  &
(YY& '
pYY' (
=>YY) +
PetYY, /
.YY/ 0
CreateYY0 6
(YY6 7
pYY7 8
.YY8 9
NameYY9 =
,YY= >
pYY? @
.YY@ A
	BirthdateYYA J
,YYJ K
pYYL M
.YYM N
RaceYYN R
,YYR S
pYYT U
.YYU V
GenderYYV \
)YY\ ]
)YY] ^
.YY^ _
ToListYY_ e
(YYe f
)YYf g
;YYg h
ifZZ 
(ZZ 
petsZZ 
.ZZ 
AnyZZ 
(ZZ 
pZZ 
=>ZZ 
pZZ 
.ZZ 
	IsFailureZZ (
)ZZ( )
)ZZ) *
{[[ 
return\\ 

BadRequest\\ !
(\\! "
)\\" #
;\\# $
}^^ 
var`` 
result`` 
=`` 
owner`` 
.`` 
RegisterPetsToOwner`` 2
(``2 3
pets``3 7
.``7 8
Select``8 >
(``> ?
p``? @
=>``A C
p``D E
.``E F
Entity``F L
)``L M
.``M N
ToList``N T
(``T U
)``U V
)``V W
;``W X
ifbb 
(bb 
resultbb 
.bb 
	IsFailurebb  
)bb  !
{cc 
returndd 

BadRequestdd !
(dd! "
resultdd" (
.dd( )
Errordd) .
)dd. /
;dd/ 0
}ee 
petsgg 
.gg 
ForEachgg 
(gg 
pgg 
=>gg 
petRepositorygg +
.gg+ ,
Addgg, /
(gg/ 0
pgg0 1
.gg1 2
Entitygg2 8
)gg8 9
)gg9 :
;gg: ;
petOwnerRepositoryhh 
.hh 
SaveChangeshh *
(hh* +
)hh+ ,
;hh, -
returnjj 
Createdjj 
(jj 
nameofjj !
(jj! "
Getjj" %
)jj% &
,jj& '
ownerjj( -
)jj- .
;jj. /
}kk 	
}ll 
}mm �
�D:\Facultate\Anul_3\.NET\VetAppointment_S12\VetAppointment - APIs + Tests\VetAppointment - Working\VetAppointment.API\Controllers\PetsController.cs
	namespace 	
VetAppointment
 
. 
API 
. 
Controllers (
{ 
[ 
Route 

(
 
$str  
)  !
]! "
[		 
ApiController		 
]		 
public

 

class

 
PetsController

 
:

  !
ControllerBase

" 0
{ 
private 
readonly 
IRepository $
<$ %
Pet% (
>( )
petRepository* 7
;7 8
public 
PetsController 
( 
IRepository )
<) *
Pet* -
>- .
petRepository/ <
)< =
=>> @
thisA E
.E F
petRepositoryF S
=T U
petRepositoryV c
;c d
[ 	
HttpGet	 
] 
public 
IActionResult 
Get  
(  !
)! "
{ 	
var 
pets 
= 
petRepository $
. 
All 
( 
) 
. 
Select 
( 
p 
=> 
new 
PetDto #
{ 
Id 
= 
p 
. 
Id  
,  !
Name 
= 
p  
.  !
Name! %
,% &
	Birthdate !
=" #
p$ %
.% &
	Birthdate& /
./ 0
ToString0 8
(8 9
)9 :
,: ;
Race 
= 
p  
.  !
Race! %
.% &
ToString& .
(. /
)/ 0
,0 1
Gender 
=  
p! "
." #
Gender# )
.) *
ToString* 2
(2 3
)3 4
} 
) 
; 
return   
Ok   
(   
pets   
)   
;   
}!! 	
}"" 
}## �'
�D:\Facultate\Anul_3\.NET\VetAppointment_S12\VetAppointment - APIs + Tests\VetAppointment - Working\VetAppointment.API\Controllers\PrescribedDrugsController.cs
	namespace 	
VetAppointment
 
. 
API 
. 
Controllers (
{ 
[		 
Route		 

(		
 
$str		  
)		  !
]		! "
[

 
ApiController

 
]

 
public 

class %
PrescribedDrugsController *
:+ ,
ControllerBase- ;
{ 
private 
readonly 
IRepository $
<$ %
PrescribedDrug% 3
>3 4$
prescribedDrugRepository5 M
;M N
private 
readonly 
IRepository $
<$ %
Drug% )
>) *
drugRepository+ 9
;9 :
public %
PrescribedDrugsController (
(( )
IRepository) 4
<4 5
PrescribedDrug5 C
>C D$
prescribedDrugRepositoryE ]
,] ^
IRepository 
< 
Drug 
> 
drugRepository ,
), -
{ 	
this 
. $
prescribedDrugRepository )
=* +$
prescribedDrugRepository, D
;D E
this 
. 
drugRepository 
=  !
drugRepository" 0
;0 1
} 	
[ 	
HttpGet	 
] 
public 
IActionResult 
Get  
(  !
)! "
{ 	
var 
drugs 
= $
prescribedDrugRepository 0
. 
All 
( 
) 
. 
Select 
( 
d 
=> 
new 
PrescribedDrugDto .
{ 
Id 
= 
d 
. 
Id !
,! "
Quantity    
=  ! "
d  # $
.  $ %
Quantity  % -
,  - .
DrugId!! 
=!!  
d!!! "
.!!" #
DrugToPrescribeId!!# 4
,!!4 5
	TotalCost"" !
=""" #
d""$ %
.""% &
	TotalCost""& /
}## 
)$$ 
;$$ 
return&& 
Ok&& 
(&& 
drugs&& 
)&& 
;&& 
}'' 	
[)) 	
HttpPost))	 
])) 
public** 
IActionResult** 
Create** #
(**# $
[**$ %
FromBody**% -
]**- .#
CreatePrescribedDrugDto**/ F
drugDto**G N
)**N O
{++ 	
var,, 
drug,, 
=,, 
drugRepository,, %
.,,% &
Get,,& )
(,,) *
drugDto,,* 1
.,,1 2
DrugId,,2 8
),,8 9
;,,9 :
if-- 
(-- 
drug-- 
==-- 
null-- 
)-- 
{.. 
return// 
NotFound// 
(//  
)//  !
;//! "
}00 
var22 
prescribedDrug22 
=22  
PrescribedDrug22! /
.22/ 0
Create220 6
(226 7
drugDto227 >
.22> ?
Quantity22? G
,22G H
drug22I M
)22M N
;22N O
if33 
(33 
prescribedDrug33 
.33 
	IsFailure33 (
)33( )
{44 
return55 

BadRequest55 !
(55! "
prescribedDrug55" 0
.550 1
Error551 6
)556 7
;557 8
}66 $
prescribedDrugRepository88 $
.88$ %
Add88% (
(88( )
prescribedDrug88) 7
.887 8
Entity888 >
)88> ?
;88? @$
prescribedDrugRepository99 $
.99$ %
SaveChanges99% 0
(990 1
)991 2
;992 3
var;; 
fullPrescribedDrug;; "
=;;# $
new;;% (
PrescribedDrugDto;;) :
{<< 
Id== 
=== 
prescribedDrug== #
.==# $
Entity==$ *
.==* +
Id==+ -
,==- .
Quantity>> 
=>> 
prescribedDrug>> )
.>>) *
Entity>>* 0
.>>0 1
Quantity>>1 9
,>>9 :
DrugId?? 
=?? 
prescribedDrug?? '
.??' (
Entity??( .
.??. /
DrugToPrescribeId??/ @
,??@ A
	TotalCost@@ 
=@@ 
prescribedDrug@@ *
.@@* +
Entity@@+ 1
.@@1 2
	TotalCost@@2 ;
}AA 
;AA 
returnCC 
CreatedCC 
(CC 
nameofCC !
(CC! "
GetCC" %
)CC% &
,CC& '
fullPrescribedDrugCC( :
)CC: ;
;CC; <
}DD 	
}EE 
}FF �r
�D:\Facultate\Anul_3\.NET\VetAppointment_S12\VetAppointment - APIs + Tests\VetAppointment - Working\VetAppointment.API\Controllers\TreatmentsController.cs
	namespace 	
VetAppointment
 
. 
API 
. 
Controllers (
{		 
[

 
Route

 

(


 
$str

  
)

  !
]

! "
[ 
ApiController 
] 
public 

class  
TreatmentsController %
:& '
ControllerBase( 6
{ 
private 
readonly 
IUnitOfWork $

unitOfWork% /
;/ 0
public  
TreatmentsController #
(# $
IUnitOfWork$ /

unitOfWork0 :
): ;
=>< >
this? C
.C D

unitOfWorkD N
=O P

unitOfWorkQ [
;[ \
[ 	
HttpGet	 
] 
public 
IActionResult 
Get  
(  !
)! "
{ 	
var 

treatments 
= 

unitOfWork '
.' (
TreatmentRepository( ;
. 
All 
( 
) 
. 
Select 
( 
t 
=> 
new "
TreatmentDto# /
{0 1
Id2 4
=5 6
t7 8
.8 9
Id9 ;
,; <
Description= H
=I J
tK L
.L M
DescriptionM X
}Y Z
)[ \
;\ ]
return 
Ok 
( 

treatments  
)  !
;! "
} 	
[ 	
HttpPost	 
] 
public 
IActionResult 
Create #
(# $
[$ %
FromBody% -
]- .
CreateTreatmentDto/ A
treatmentDtoB N
)N O
{ 	
var 
treat 
= 
	Treatment !
.! "
Create" (
(( )
treatmentDto) 5
.5 6
Description6 A
)A B
;B C
if   
(   
treat   
.   
	IsFailure   
)    
{!! 
return"" 

BadRequest"" !
(""! "
treat""" '
.""' (
Error""( -
)""- .
;"". /
}## 

unitOfWork%% 
.%% 
TreatmentRepository%% *
.%%* +
Add%%+ .
(%%. /
treat%%/ 4
.%%4 5
Entity%%5 ;
)%%; <
;%%< =

unitOfWork&& 
.&& 
SaveChanges&& "
(&&" #
)&&# $
;&&$ %
var(( 
fullTreatment(( 
=(( 
new((  #
TreatmentDto(($ 0
(((0 1
)((1 2
{)) 
Id** 
=** 
treat** 
.** 
Entity** !
.**! "
Id**" $
,**$ %
Description++ 
=++ 
treat++ #
.++# $
Entity++$ *
.++* +
Description+++ 6
},, 
;,, 
return.. 
Created.. 
(.. 
nameof.. !
(..! "
Get.." %
)..% &
,..& '
fullTreatment..( 5
)..5 6
;..6 7
}// 	
[11 	
HttpPost11	 
(11 
$str11 6
)116 7
]117 8
public22 
IActionResult22 
AddDrugsToTreatment22 0
(220 1
Guid221 5
treatmentId226 A
,22A B
[33 
FromBody33 
]33 
List33 
<33 
PrescribedDrugDto33 -
>33- .
prescribedDrugDtos33/ A
)33A B
{44 	
var55 
	treatment55 
=55 

unitOfWork55 &
.55& '
TreatmentRepository55' :
.55: ;
Get55; >
(55> ?
treatmentId55? J
)55J K
;55K L
if66 
(66 
	treatment66 
==66 
null66 !
)66! "
{77 
return88 
NotFound88 
(88  
)88  !
;88! "
}99 
var;; 
drugs;; 
=;; 
prescribedDrugDtos;; *
.<< 
Select<< 
(<< 
d<< 
=><< 
PrescribedDrug<< +
.<<+ ,
Create<<, 2
(<<2 3
d<<3 4
.<<4 5
Quantity<<5 =
,<<= >

unitOfWork<<? I
.<<I J
DrugRepository<<J X
.<<X Y
Get<<Y \
(<<\ ]
d<<] ^
.<<^ _
DrugId<<_ e
)<<e f
)<<f g
)<<h i
.<<i j
ToList<<j p
(<<p q
)<<q r
;<<r s
if== 
(== 
drugs== 
.== 
Any== 
(== 
p== 
=>== 
p==  
.==  !
	IsFailure==! *
)==* +
)==+ ,
{>> 
return?? 

BadRequest?? !
(??! "
)??" #
;??# $
}@@ 
varBB 
resultBB 
=BB 
	treatmentBB "
.BB" #"
AppendDrugsToTreatmentBB# 9
(BB9 :
drugsBB: ?
.BB? @
SelectBB@ F
(BBF G
dBBG H
=>BBI K
dBBL M
.BBM N
EntityBBN T
)BBT U
.BBU V
ToListBBV \
(BB\ ]
)BB] ^
)BB^ _
;BB_ `
ifCC 
(CC 
resultCC 
.CC 
	IsFailureCC  
)CC  !
{DD 
returnEE 

BadRequestEE !
(EE! "
resultEE" (
.EE( )
ErrorEE) .
)EE. /
;EE/ 0
}FF 
drugsHH 
.HH 
ForEachHH 
(HH 
dHH 
=>HH 

unitOfWorkHH )
.HH) *$
PrescribedDrugRepositoryHH* B
.HHB C
AddHHC F
(HHF G
dHHG H
.HHH I
EntityHHI O
)HHO P
)HHP Q
;HHQ R

unitOfWorkII 
.II 
SaveChangesII "
(II" #
)II# $
;II$ %
returnKK 
	NoContentKK 
(KK 
)KK 
;KK 
}LL 	
[NN 	
HttpPutNN	 
(NN 
$strNN %
)NN% &
]NN& '
publicOO 
IActionResultOO 
UpdateTreatmentOO ,
(OO, -
GuidOO- 1
treatmentIdOO2 =
,OO= >
[OO? @
FromBodyOO@ H
]OOH I
CreateTreatmentDtoOOJ \
treatmentDtoOO] i
)OOi j
{PP 	
varQQ 
	treatmentQQ 
=QQ 

unitOfWorkQQ &
.QQ& '
TreatmentRepositoryQQ' :
.QQ: ;
GetQQ; >
(QQ> ?
treatmentIdQQ? J
)QQJ K
;QQK L
ifRR 
(RR 
	treatmentRR 
==RR 
nullRR !
)RR! "
{SS 
returnTT 
NotFoundTT 
(TT  
)TT  !
;TT! "
}UU 
varWW 
resultWW 
=WW 
	treatmentWW "
.WW" #
UpdateDescriptionWW# 4
(WW4 5
treatmentDtoWW5 A
.WWA B
DescriptionWWB M
)WWM N
;WWN O
ifXX 
(XX 
resultXX 
.XX 
	IsFailureXX  
)XX  !
{YY 
returnZZ 

BadRequestZZ !
(ZZ! "
resultZZ" (
.ZZ( )
ErrorZZ) .
)ZZ. /
;ZZ/ 0
}[[ 

unitOfWork]] 
.]] 
TreatmentRepository]] *
.]]* +
Update]]+ 1
(]]1 2
	treatment]]2 ;
)]]; <
;]]< =

unitOfWork^^ 
.^^ 
SaveChanges^^ "
(^^" #
)^^# $
;^^$ %
return`` 
	NoContent`` 
(`` 
)`` 
;`` 
}aa 	
[cc 	
HttpPutcc	 
(cc 
$strcc L
)ccL M
]ccM N
publicdd 
IActionResultdd !
UpdateDrugInTreatmentdd 2
(dd2 3
Guiddd3 7
treatmentIddd8 C
,ddC D
GuidddE I
prescribedDrugIdddJ Z
,ddZ [
[ee 
FromBodyee 
]ee 
PrescribedDrugDtoee (
prescribedDrugDtoee) :
)ee: ;
{ff 	
vargg 
	treatmentgg 
=gg 

unitOfWorkgg &
.gg& '
TreatmentRepositorygg' :
.gg: ;
Getgg; >
(gg> ?
treatmentIdgg? J
)ggJ K
;ggK L
ifhh 
(hh 
	treatmenthh 
==hh 
nullhh !
)hh! "
{ii 
returnjj 
NotFoundjj 
(jj  
)jj  !
;jj! "
}kk 
varmm 
drugPrescribedmm 
=mm  

unitOfWorkmm! +
.mm+ ,$
PrescribedDrugRepositorymm, D
.mmD E
GetmmE H
(mmH I
prescribedDrugIdmmI Y
)mmY Z
;mmZ [
ifnn 
(nn 
drugPrescribednn 
==nn !
nullnn" &
)nn& '
{oo 
returnpp 
NotFoundpp 
(pp  
)pp  !
;pp! "
}qq 
varss 
drugss 
=ss 

unitOfWorkss !
.ss! "
DrugRepositoryss" 0
.ss0 1
Getss1 4
(ss4 5
prescribedDrugDtoss5 F
.ssF G
DrugIdssG M
)ssM N
;ssN O
iftt 
(tt 
drugtt 
==tt 
nulltt 
)tt 
{uu 
returnvv 
NotFoundvv 
(vv  
)vv  !
;vv! "
}ww 
varyy 
resultyy 
=yy 
drugPrescribedyy '
.yy' (
Updateyy( .
(yy. /
prescribedDrugDtoyy/ @
.yy@ A
QuantityyyA I
,yyI J
drugyyK O
)yyO P
;yyP Q
if{{ 
({{ 
result{{ 
.{{ 
	IsFailure{{  
){{  !
{|| 
return}} 

BadRequest}} !
(}}! "
result}}" (
.}}( )
Error}}) .
)}}. /
;}}/ 0
}~~ 

unitOfWork
�� 
.
�� &
PrescribedDrugRepository
�� /
.
��/ 0
Update
��0 6
(
��6 7
drugPrescribed
��7 E
)
��E F
;
��F G

unitOfWork
�� 
.
�� 
SaveChanges
�� "
(
��" #
)
��# $
;
��$ %
return
�� 
	NoContent
�� 
(
�� 
)
�� 
;
�� 
}
�� 	
[
�� 	

HttpDelete
��	 
(
�� 
$str
�� O
)
��O P
]
��P Q
public
�� 
IActionResult
�� %
RemoveDrugFromTreatment
�� 4
(
��4 5
Guid
��5 9
treatmentId
��: E
,
��E F
Guid
��G K
prescribedDrugId
��L \
)
��\ ]
{
�� 	
var
�� 
	treatment
�� 
=
�� 

unitOfWork
�� &
.
��& '!
TreatmentRepository
��' :
.
��: ;
Get
��; >
(
��> ?
treatmentId
��? J
)
��J K
;
��K L
if
�� 
(
�� 
	treatment
�� 
==
�� 
null
�� !
)
��! "
{
�� 
return
�� 
NotFound
�� 
(
��  
)
��  !
;
��! "
}
�� 
var
�� 
drug
�� 
=
�� 

unitOfWork
�� !
.
��! "&
PrescribedDrugRepository
��" :
.
��: ;
Get
��; >
(
��> ?
prescribedDrugId
��? O
)
��O P
;
��P Q
if
�� 
(
�� 
drug
�� 
==
�� 
null
�� 
)
�� 
{
�� 
return
�� 
NotFound
�� 
(
��  
)
��  !
;
��! "
}
�� 
var
�� 
result
�� 
=
�� 
	treatment
�� "
.
��" #%
RemoveDrugFromTreatment
��# :
(
��: ;
drug
��; ?
)
��? @
;
��@ A
if
�� 
(
�� 
result
�� 
.
�� 
	IsFailure
��  
)
��  !
{
�� 
return
�� 

BadRequest
�� !
(
��! "
result
��" (
.
��( )
Error
��) .
)
��. /
;
��/ 0
}
�� 

unitOfWork
�� 
.
�� &
PrescribedDrugRepository
�� /
.
��/ 0
Delete
��0 6
(
��6 7
drug
��7 ;
)
��; <
;
��< =

unitOfWork
�� 
.
�� 
SaveChanges
�� "
(
��" #
)
��# $
;
��$ %
return
�� 
	NoContent
�� 
(
�� 
)
�� 
;
�� 
}
�� 	
[
�� 	

HttpDelete
��	 
(
�� 
$str
�� (
)
��( )
]
��) *
public
�� 
IActionResult
�� 
Delete
�� #
(
��# $
Guid
��$ (
treatmentId
��) 4
)
��4 5
{
�� 	
var
�� 
	treatment
�� 
=
�� 

unitOfWork
�� &
.
��& '!
TreatmentRepository
��' :
.
��: ;
Get
��; >
(
��> ?
treatmentId
��? J
)
��J K
;
��K L
if
�� 
(
�� 
	treatment
�� 
==
�� 
null
�� !
)
��! "
{
�� 
return
�� 
NotFound
�� 
(
��  
)
��  !
;
��! "
}
�� 

unitOfWork
�� 
.
�� !
TreatmentRepository
�� *
.
��* +
Delete
��+ 1
(
��1 2
	treatment
��2 ;
)
��; <
;
��< =

unitOfWork
�� 
.
�� 
SaveChanges
�� "
(
��" #
)
��# $
;
��$ %
return
�� 
	NoContent
�� 
(
�� 
)
�� 
;
�� 
}
�� 	
}
�� 
}�� ��
�D:\Facultate\Anul_3\.NET\VetAppointment_S12\VetAppointment - APIs + Tests\VetAppointment - Working\VetAppointment.API\Controllers\VetClinicsController.cs
	namespace 	
VetAppointment
 
. 
API 
. 
Controllers (
{ 
[		 
Route		 

(		
 
$str		  
)		  !
]		! "
[

 
ApiController

 
]

 
public 

class  
VetClinicsController %
:& '
ControllerBase( 6
{ 
private 
readonly 
IUnitOfWork $

unitOfWork% /
;/ 0
public  
VetClinicsController #
(# $
IUnitOfWork$ /

unitOfWork0 :
): ;
=>< >
this? C
.C D

unitOfWorkD N
=O P

unitOfWorkQ [
;[ \
[ 	
HttpPost	 
] 
public 
IActionResult 
Create #
(# $
[$ %
FromBody% -
]- .
CreateVetClinicDto/ A
vetClinicDtoB N
)N O
{ 	
var 
history 
= 
MedicalHistory (
.( )
Create) /
(/ 0
)0 1
;1 2
var 
	vetClinic 
= 
	VetClinic %
.% &
Create& ,
(, -
vetClinicDto  
.  !
Name! %
,% &
vetClinicDto  
.  !
Address! (
,( )
vetClinicDto  
.  !
NumberOfPlaces! /
,/ 0
vetClinicDto  
.  !
ContactEmail! -
,- .
vetClinicDto  
.  !
ContactPhone! -
) 
; 
if 
( 
	vetClinic 
== 
null !
)! "
{ 
return 

BadRequest !
(! "
)" #
;# $
}   
history"" 
."" 
Entity"" 
."" 
AtachToClinic"" (
(""( )
	vetClinic"") 2
.""2 3
Entity""3 9
.""9 :
Id"": <
)""< =
;""= >
	vetClinic## 
.## 
Entity## 
.##  
AttachMedicalHistory## 1
(##1 2
history##2 9
.##9 :
Entity##: @
.##@ A
Id##A C
)##C D
;##D E
if%% 
(%% 
	vetClinic%% 
.%% 
	IsFailure%% #
)%%# $
{&& 
return'' 

BadRequest'' !
(''! "
	vetClinic''" +
.''+ ,
Error'', 1
)''1 2
;''2 3
}(( 

unitOfWork** 
.** $
MedicalHistoryRepository** /
.**/ 0
Add**0 3
(**3 4
history**4 ;
.**; <
Entity**< B
)**B C
;**C D

unitOfWork++ 
.++ 
SaveChanges++ "
(++" #
)++# $
;++$ %

unitOfWork-- 
.-- 
VetClinicRepository-- *
.--* +
Add--+ .
(--. /
	vetClinic--/ 8
.--8 9
Entity--9 ?
)--? @
;--@ A

unitOfWork.. 
... 
SaveChanges.. "
(.." #
)..# $
;..$ %
var00 

fullClinic00 
=00 
new00  
VetClinicDto00! -
{11 
Id22 
=22 
	vetClinic22 
.22 
Entity22 %
.22% &
Id22& (
,22( )
Name33 
=33 
	vetClinic33  
.33  !
Entity33! '
.33' (
Name33( ,
,33, -
Address44 
=44 
	vetClinic44 #
.44# $
Entity44$ *
.44* +
Address44+ 2
,442 3
NumberOfPlaces55 
=55  
	vetClinic55! *
.55* +
Entity55+ 1
.551 2
NumberOfPlaces552 @
,55@ A
ContactEmail66 
=66 
	vetClinic66 (
.66( )
Entity66) /
.66/ 0
ContactEmail660 <
,66< =
ContactPhone77 
=77 
	vetClinic77 (
.77( )
Entity77) /
.77/ 0
ContactPhone770 <
,77< =
RegistrationDate88  
=88! "
	vetClinic88# ,
.88, -
Entity88- 3
.883 4
RegistrationDate884 D
,88D E
MedicalHistoryId99  
=99! "
history99# *
.99* +
Entity99+ 1
.991 2
Id992 4
}:: 
;:: 
return<< 
Created<< 
(<< 
nameof<< !
(<<! "
GetAllVetClinics<<" 2
)<<2 3
,<<3 4

fullClinic<<5 ?
)<<? @
;<<@ A
}== 	
[@@ 	
HttpGet@@	 
]@@ 
publicAA 
IActionResultAA 
GetAllVetClinicsAA -
(AA- .
)AA. /
{BB 	
varCC 

vetClinicsCC 
=CC 

unitOfWorkCC '
.CC' (
VetClinicRepositoryCC( ;
.DD 
AllDD 
(DD 
)DD 
.EE 
SelectEE 
(EE 
vetFF 
=>FF 
newFF 
VetClinicDtoFF +
(FF+ ,
)FF, -
{GG 
IdHH 
=HH 
vetHH  
.HH  !
IdHH! #
,HH# $
NameII 
=II 
vetII "
.II" #
NameII# '
,II' (
AddressJJ 
=JJ  !
vetJJ" %
.JJ% &
AddressJJ& -
,JJ- .
NumberOfPlacesKK &
=KK' (
vetKK) ,
.KK, -
NumberOfPlacesKK- ;
,KK; <
ContactEmailLL $
=LL% &
vetLL' *
.LL* +
ContactEmailLL+ 7
,LL7 8
ContactPhoneMM $
=MM% &
vetMM' *
.MM* +
ContactPhoneMM+ 7
,MM7 8
RegistrationDateNN (
=NN) *
vetNN+ .
.NN. /
RegistrationDateNN/ ?
,NN? @
MedicalHistoryIdOO (
=OO) *
vetOO+ .
.OO. /
MedicalHistoryIdOO/ ?
}PP 
)QQ 
;QQ 
returnSS 
OkSS 
(SS 

vetClinicsSS  
)SS  !
;SS! "
}TT 	
[VV 	
HttpGetVV	 
(VV 
$strVV %
)VV% &
]VV& '
publicWW 
IActionResultWW 
GetByIdWW $
(WW$ %
GuidWW% )
vetClinicIdWW* 5
)WW5 6
{XX 	
varYY 
clinicYY 
=YY 

unitOfWorkYY #
.YY# $
VetClinicRepositoryYY$ 7
.YY7 8
GetYY8 ;
(YY; <
vetClinicIdYY< G
)YYG H
;YYH I
ifZZ 
(ZZ 
clinicZZ 
==ZZ 
nullZZ 
)ZZ 
{[[ 
return\\ 
NotFound\\ 
(\\  
)\\  !
;\\! "
}]] 
return__ 
Ok__ 
(__ 
clinic__ 
)__ 
;__ 
}`` 	
[bb 	
HttpGetbb	 
(bb 
$strbb *
)bb* +
]bb+ ,
publiccc 
IActionResultcc 
GetVetsByClinicIdcc .
(cc. /
Guidcc/ 3
vetClinicIdcc4 ?
)cc? @
{dd 	
varee 
clinicee 
=ee 

unitOfWorkee #
.ee# $
VetClinicRepositoryee$ 7
.ee7 8
Getee8 ;
(ee; <
vetClinicIdee< G
)eeG H
;eeH I
ifff 
(ff 
clinicff 
==ff 
nullff 
)ff 
{gg 
returnhh 
NotFoundhh 
(hh  
)hh  !
;hh! "
}ii 
varkk 
vetskk 
=kk 
clinickk 
.kk 
Vetskk "
.ll 
Selectll 
(ll 
vetll 
=>ll 
newll "
VetDtoll# )
(ll) *
)ll* +
{mm 
Idnn 
=nn 
vetnn 
.nn 
Idnn 
,nn  
ClinicIdoo 
=oo 
vetoo "
.oo" #
ClinicIdoo# +
,oo+ ,
Namepp 
=pp 
vetpp 
.pp 
Namepp #
,pp# $
Surnameqq 
=qq 
vetqq !
.qq! "
Surnameqq" )
,qq) *
	Birthdaterr 
=rr 
vetrr  #
.rr# $
	Birthdaterr$ -
.rr- .
ToStringrr. 6
(rr6 7
)rr7 8
,rr8 9
Specialisationss "
=ss# $
vetss% (
.ss( )
Specialisationss) 7
.ss7 8
ToStringss8 @
(ss@ A
)ssA B
,ssB C
Emailtt 
=tt 
vettt 
.tt  
Emailtt  %
,tt% &
Genderuu 
=uu 
vetuu  
.uu  !
Genderuu! '
.uu' (
ToStringuu( 0
(uu0 1
)uu1 2
,uu2 3
Phonevv 
=vv 
vetvv 
.vv  
Phonevv  %
,vv% &
}ww 
)ww 
;ww 
returnyy 
Okyy 
(yy 
vetsyy 
)yy 
;yy 
}zz 	
[|| 	
HttpGet||	 
(|| 
$str|| *
)||* +
]||+ ,
public}} 
IActionResult}} 
GetPetsByClinicId}} .
(}}. /
Guid}}/ 3
vetClinicId}}4 ?
)}}? @
{~~ 	
var 
clinic 
= 

unitOfWork #
.# $
VetClinicRepository$ 7
.7 8
Get8 ;
(; <
vetClinicId< G
)G H
;H I
if
�� 
(
�� 
clinic
�� 
==
�� 
null
�� 
)
�� 
{
�� 
return
�� 
NotFound
�� 
(
��  
)
��  !
;
��! "
}
�� 
var
�� 
pets
�� 
=
�� 
clinic
�� 
.
�� 
Pets
�� "
.
�� 
Select
�� 
(
�� 
pet
�� 
=>
�� 
new
�� "
PetDto
��# )
(
��) *
)
��* +
{
�� 
Id
�� 
=
�� 
pet
�� 
.
�� 
Id
�� 
,
��  
Name
�� 
=
�� 
pet
�� 
.
�� 
Name
�� #
,
��# $
	Birthdate
�� 
=
�� 
pet
��  #
.
��# $
	Birthdate
��$ -
.
��- .
ToString
��. 6
(
��6 7
)
��7 8
,
��8 9
Gender
�� 
=
�� 
pet
��  
.
��  !
Gender
��! '
.
��' (
ToString
��( 0
(
��0 1
)
��1 2
,
��2 3
Race
�� 
=
�� 
pet
�� 
.
�� 
Race
�� #
.
��# $
ToString
��$ ,
(
��, -
)
��- .
,
��. /
}
�� 
)
�� 
;
�� 
return
�� 
Ok
�� 
(
�� 
pets
�� 
)
�� 
;
�� 
}
�� 	
[
�� 	
HttpGet
��	 
(
�� 
$str
�� 2
)
��2 3
]
��3 4
public
�� 
IActionResult
�� '
GetAppointmentsByClinicId
�� 6
(
��6 7
Guid
��7 ;
vetClinicId
��< G
)
��G H
{
�� 	
var
�� 
clinic
�� 
=
�� 

unitOfWork
�� #
.
��# $!
VetClinicRepository
��$ 7
.
��7 8
Get
��8 ;
(
��; <
vetClinicId
��< G
)
��G H
;
��H I
if
�� 
(
�� 
clinic
�� 
==
�� 
null
�� 
)
�� 
{
�� 
return
�� 
NotFound
�� 
(
��  
)
��  !
;
��! "
}
�� 
var
�� 
medicalHistory
�� 
=
��  

unitOfWork
��! +
.
��+ ,&
MedicalHistoryRepository
��, D
.
��D E
Get
��E H
(
��H I
clinic
��I O
.
��O P
MedicalHistoryId
��P `
)
��` a
;
��a b
var
�� 
appointments
�� 
=
�� 
medicalHistory
�� -
.
��- .
Appointments
��. :
.
�� 
Select
�� 
(
�� 
appointment
�� 
=>
��  "
new
��# &
AppointmentDto
��' 5
(
��5 6
)
��6 7
{
�� 
Id
�� 
=
�� 
appointment
�� (
.
��( )
Id
��) +
,
��+ ,(
EstimatedDurationInMinutes
�� 2
=
��3 4
appointment
��5 @
.
��@ A(
EstimatedDurationInMinutes
��A [
,
��[ \
PetId
�� 
=
�� 
appointment
��  +
.
��+ ,
PetId
��, 1
,
��1 2
VetId
�� 
=
�� 
appointment
��  +
.
��+ ,
VetId
��, 1
,
��1 2
ScheduledDate
�� %
=
��& '
appointment
��( 3
.
��3 4
ScheduledDate
��4 A
.
��A B
ToString
��B J
(
��J K
)
��K L
,
��L M
TreatmentId
�� #
=
��$ %
appointment
��& 1
.
��1 2
TreatmentId
��2 =
}
�� 
)
�� 
;
�� 
return
�� 
Ok
�� 
(
�� 
appointments
�� "
)
��" #
;
��# $
}
�� 	
[
�� 	
HttpPost
��	 
(
�� 
$str
�� +
)
��+ ,
]
��, -
public
�� 
IActionResult
��  
RegisterPetsFamily
�� /
(
��/ 0
Guid
��0 4
vetClinicId
��5 @
,
��@ A
[
��B C
FromBody
��C K
]
��K L
List
��M Q
<
��Q R
CreatePetDto
��R ^
>
��^ _
petsDtos
��` h
)
��h i
{
�� 	
var
�� 
clinic
�� 
=
�� 

unitOfWork
�� #
.
��# $!
VetClinicRepository
��$ 7
.
��7 8
Get
��8 ;
(
��; <
vetClinicId
��< G
)
��G H
;
��H I
if
�� 
(
�� 
clinic
�� 
==
�� 
null
�� 
)
�� 
{
�� 
return
�� 
NotFound
�� 
(
��  
)
��  !
;
��! "
}
�� 
var
�� 
pets
�� 
=
�� 
petsDtos
�� 
.
��  
Select
��  &
(
��& '
p
��' (
=>
��) +
Pet
��, /
.
��/ 0
Create
��0 6
(
��6 7
p
��7 8
.
��8 9
Name
��9 =
,
��= >
p
��? @
.
��@ A
	Birthdate
��A J
,
��J K
p
��L M
.
��M N
Race
��N R
,
��R S
p
��T U
.
��U V
Gender
��V \
)
��\ ]
)
��] ^
.
��^ _
ToList
��_ e
(
��e f
)
��f g
;
��g h
if
�� 
(
�� 
pets
�� 
.
�� 
Any
�� 
(
�� 
p
�� 
=>
�� 
p
�� 
.
��  
	IsFailure
��  )
)
��) *
)
��* +
{
�� 
return
�� 

BadRequest
�� !
(
��! "
)
��" #
;
��# $
}
�� 
var
�� 
result
�� 
=
�� 
clinic
�� 
.
��  (
RegisterPetsFamilyToClinic
��  :
(
��: ;
pets
��; ?
.
��? @
Select
��@ F
(
��F G
p
��G H
=>
��I K
p
��L M
.
��M N
Entity
��N T
)
��T U
.
��U V
ToList
��V \
(
��\ ]
)
��] ^
)
��^ _
;
��_ `
if
�� 
(
�� 
result
�� 
.
�� 
	IsFailure
��  
)
��  !
{
�� 
return
�� 

BadRequest
�� !
(
��! "
result
��" (
.
��( )
Error
��) .
)
��. /
;
��/ 0
}
�� 
pets
�� 
.
�� 
ForEach
�� 
(
�� 
p
�� 
=>
�� 

unitOfWork
�� (
.
��( )
PetRepository
��) 6
.
��6 7
Add
��7 :
(
��: ;
p
��; <
.
��< =
Entity
��= C
)
��C D
)
��D E
;
��E F

unitOfWork
�� 
.
�� 
SaveChanges
�� "
(
��" #
)
��# $
;
��$ %
var
�� 
createdPets
�� 
=
�� 
pets
�� "
.
��" #
Select
��# )
(
��) *
pet
�� 
=>
�� 
new
�� 
PetDto
�� !
(
��! "
)
��" #
{
�� 
Name
�� 
=
�� 
pet
�� 
.
�� 
Entity
�� %
.
��% &
Name
��& *
,
��* +
	Birthdate
�� 
=
�� 
pet
��  #
.
��# $
Entity
��$ *
.
��* +
	Birthdate
��+ 4
.
��4 5
ToString
��5 =
(
��= >
)
��> ?
,
��? @
Gender
�� 
=
�� 
pet
��  
.
��  !
Entity
��! '
.
��' (
Gender
��( .
.
��. /
ToString
��/ 7
(
��7 8
)
��8 9
,
��9 :
Race
�� 
=
�� 
pet
�� 
.
�� 
Entity
�� %
.
��% &
Race
��& *
.
��* +
ToString
��+ 3
(
��3 4
)
��4 5
,
��5 6
Id
�� 
=
�� 
pet
�� 
.
�� 
Entity
�� #
.
��# $
Id
��$ &
,
��& '
}
�� 
)
�� 
;
�� 
return
�� 
Created
�� 
(
�� 
nameof
�� !
(
��! "
GetPetsByClinicId
��" 3
)
��3 4
,
��4 5
createdPets
��6 A
)
��A B
;
��B C
}
�� 	
[
�� 	
HttpPost
��	 
(
�� 
$str
�� *
)
��* +
]
��+ ,
public
�� 
IActionResult
�� 
RegisterVet
�� (
(
��( )
Guid
��) -
vetClinicId
��. 9
,
��9 :
[
��; <
FromBody
��< D
]
��D E
CreateVetDto
��F R
vetDto
��S Y
)
��Y Z
{
�� 	
var
�� 
clinic
�� 
=
�� 

unitOfWork
�� #
.
��# $!
VetClinicRepository
��$ 7
.
��7 8
Get
��8 ;
(
��; <
vetClinicId
��< G
)
��G H
;
��H I
if
�� 
(
�� 
clinic
�� 
==
�� 
null
�� 
)
�� 
{
�� 
return
�� 
NotFound
�� 
(
��  
)
��  !
;
��! "
}
�� 
var
�� 
doctor
�� 
=
�� 
Vet
�� 
.
�� 
Create
�� #
(
��# $
vetDto
��$ *
.
��* +
Name
��+ /
,
��/ 0
vetDto
��1 7
.
��7 8
Surname
��8 ?
,
��? @
vetDto
��A G
.
��G H
	Birthdate
��H Q
,
��Q R
vetDto
��S Y
.
��Y Z
Gender
��Z `
,
��` a
vetDto
��b h
.
��h i
Email
��i n
,
��n o
vetDto
�� 
.
�� 
Phone
�� 
,
�� 
vetDto
�� $
.
��$ %
Specialisation
��% 3
)
��3 4
;
��4 5
if
�� 
(
�� 
doctor
�� 
.
�� 
	IsFailure
��  
)
��  !
{
�� 
return
�� 

BadRequest
�� !
(
��! "
)
��" #
;
��# $
}
�� 
var
�� 
result
�� 
=
�� 
clinic
�� 
.
��  !
RegisterVetToClinic
��  3
(
��3 4
doctor
��4 :
.
��: ;
Entity
��; A
)
��A B
;
��B C
if
�� 
(
�� 
result
�� 
.
�� 
	IsFailure
��  
)
��  !
{
�� 
return
�� 

BadRequest
�� !
(
��! "
result
��" (
.
��( )
Error
��) .
)
��. /
;
��/ 0
}
�� 

unitOfWork
�� 
.
�� !
VetClinicRepository
�� *
.
��* +
Update
��+ 1
(
��1 2
clinic
��2 8
)
��8 9
;
��9 :

unitOfWork
�� 
.
�� 
VetRepository
�� $
.
��$ %
Add
��% (
(
��( )
doctor
��) /
.
��/ 0
Entity
��0 6
)
��6 7
;
��7 8

unitOfWork
�� 
.
�� 
SaveChanges
�� "
(
��" #
)
��# $
;
��$ %
var
�� 
	createVet
�� 
=
�� 
new
�� 
VetDto
��  &
(
��& '
)
��' (
{
�� 
Name
�� 
=
�� 
doctor
�� 
.
�� 
Entity
�� $
.
��$ %
Name
��% )
,
��) *
Surname
�� 
=
�� 
doctor
��  
.
��  !
Entity
��! '
.
��' (
Surname
��( /
,
��/ 0
Specialisation
�� 
=
��  
doctor
��! '
.
��' (
Entity
��( .
.
��. /
Specialisation
��/ =
.
��= >
ToString
��> F
(
��F G
)
��G H
,
��H I
	Birthdate
�� 
=
�� 
doctor
�� "
.
��" #
Entity
��# )
.
��) *
	Birthdate
��* 3
.
��3 4
ToString
��4 <
(
��< =
)
��= >
,
��> ?
Gender
�� 
=
�� 
doctor
�� 
.
��  
Entity
��  &
.
��& '
Gender
��' -
.
��- .
ToString
��. 6
(
��6 7
)
��7 8
,
��8 9
Email
�� 
=
�� 
doctor
�� 
.
�� 
Entity
�� %
.
��% &
Email
��& +
,
��+ ,
Phone
�� 
=
�� 
doctor
�� 
.
�� 
Entity
�� %
.
��% &
Phone
��& +
,
��+ ,
Id
�� 
=
�� 
doctor
�� 
.
�� 
Entity
�� "
.
��" #
Id
��# %
,
��% &
}
�� 
;
�� 
return
�� 
Created
�� 
(
�� 
nameof
�� !
(
��! "
RegisterVet
��" -
)
��- .
,
��. /
	createVet
��0 9
)
��9 :
;
��: ;
}
�� 	
[
�� 	
HttpPost
��	 
(
�� 
$str
�� 2
)
��2 3
]
��3 4
public
�� 
IActionResult
�� !
RegisterAppointment
�� 0
(
��0 1
Guid
��1 5
vetClinicId
��6 A
,
��A B
[
��C D
FromBody
��D L
]
��L M"
CreateAppointmentDto
��N b
appointmentDto
��c q
)
��q r
{
�� 	
var
�� 
clinic
�� 
=
�� 

unitOfWork
�� #
.
��# $!
VetClinicRepository
��$ 7
.
��7 8
Get
��8 ;
(
��; <
vetClinicId
��< G
)
��G H
;
��H I
if
�� 
(
�� 
clinic
�� 
==
�� 
null
�� 
)
�� 
{
�� 
return
�� 
NotFound
�� 
(
��  
)
��  !
;
��! "
}
�� 
var
�� 
medicalHistory
�� 
=
��  

unitOfWork
��! +
.
��+ ,&
MedicalHistoryRepository
��, D
.
��D E
Get
��E H
(
��H I
clinic
��I O
.
��O P
MedicalHistoryId
��P `
)
��` a
;
��a b
var
�� 
pet
�� 
=
�� 

unitOfWork
��  
.
��  !
PetRepository
��! .
.
��. /
Get
��/ 2
(
��2 3
appointmentDto
��3 A
.
��A B
PetId
��B G
)
��G H
;
��H I
if
�� 
(
�� 
pet
�� 
==
�� 
null
�� 
)
�� 
{
�� 
return
�� 
NotFound
�� 
(
��  
)
��  !
;
��! "
}
�� 
var
�� 
vet
�� 
=
�� 

unitOfWork
��  
.
��  !
VetRepository
��! .
.
��. /
Get
��/ 2
(
��2 3
appointmentDto
��3 A
.
��A B
VetId
��B G
)
��G H
;
��H I
if
�� 
(
�� 
vet
�� 
==
�� 
null
�� 
)
�� 
{
�� 
return
�� 
NotFound
�� 
(
��  
)
��  !
;
��! "
}
�� 
var
�� 
appointment
�� 
=
�� 
Appointment
�� )
.
��) *
SettleAppointment
��* ;
(
��; <
vet
��< ?
,
��? @
pet
��A D
,
��D E
appointmentDto
��F T
.
��T U
ScheduledDate
��U b
,
��b c
appointmentDto
�� 
.
�� (
EstimatedDurationInMinutes
�� 9
)
��9 :
;
��: ;
if
�� 
(
�� 
appointment
�� 
.
�� 
	IsFailure
�� %
)
��% &
{
�� 
return
�� 

BadRequest
�� !
(
��! "
)
��" #
;
��# $
}
�� 
var
�� 
result
�� 
=
�� 
medicalHistory
�� '
.
��' (*
RegisterAppointmentToHistory
��( D
(
��D E
appointment
��E P
.
��P Q
Entity
��Q W
)
��W X
;
��X Y
if
�� 
(
�� 
result
�� 
.
�� 
	IsFailure
��  
)
��  !
{
�� 
return
�� 

BadRequest
�� !
(
��! "
result
��" (
.
��( )
Error
��) .
)
��. /
;
��/ 0
}
�� 

unitOfWork
�� 
.
�� &
MedicalHistoryRepository
�� /
.
��/ 0
Update
��0 6
(
��6 7
medicalHistory
��7 E
)
��E F
;
��F G

unitOfWork
�� 
.
�� #
AppointmentRepository
�� ,
.
��, -
Add
��- 0
(
��0 1
appointment
��1 <
.
��< =
Entity
��= C
)
��C D
;
��D E

unitOfWork
�� 
.
�� 
SaveChanges
�� "
(
��" #
)
��# $
;
��$ %
var
��  
createdAppointment
�� "
=
��# $
new
��% (
AppointmentDto
��) 7
(
��7 8
)
��8 9
{
�� 
Id
�� 
=
�� 
appointment
��  
.
��  !
Entity
��! '
.
��' (
Id
��( *
,
��* +(
EstimatedDurationInMinutes
�� *
=
��+ ,
appointment
��- 8
.
��8 9
Entity
��9 ?
.
��? @(
EstimatedDurationInMinutes
��@ Z
,
��Z [
PetId
�� 
=
�� 
appointment
�� #
.
��# $
Entity
��$ *
.
��* +
PetId
��+ 0
,
��0 1
VetId
�� 
=
�� 
appointment
�� #
.
��# $
Entity
��$ *
.
��* +
VetId
��+ 0
,
��0 1
ScheduledDate
�� 
=
�� 
appointment
��  +
.
��+ ,
Entity
��, 2
.
��2 3
ScheduledDate
��3 @
.
��@ A
ToString
��A I
(
��I J
)
��J K
,
��K L
TreatmentId
�� 
=
�� 
appointment
�� )
.
��) *
Entity
��* 0
.
��0 1
TreatmentId
��1 <
}
�� 
;
�� 
return
�� 
Created
�� 
(
�� 
nameof
�� !
(
��! "!
RegisterAppointment
��" 5
)
��5 6
,
��6 7 
createdAppointment
��8 J
)
��J K
;
��K L
}
�� 	
[
�� 	
HttpPut
��	 
(
�� 
$str
�� %
)
��% &
]
��& '
public
�� 
IActionResult
�� 
Update
�� #
(
��# $
Guid
��$ (
vetClinicId
��) 4
,
��4 5
[
��6 7
FromBody
��7 ?
]
��? @ 
CreateVetClinicDto
��A S
vetClinicDto
��T `
)
��` a
{
�� 	
var
�� 
clinic
�� 
=
�� 

unitOfWork
�� #
.
��# $!
VetClinicRepository
��$ 7
.
��7 8
Get
��8 ;
(
��; <
vetClinicId
��< G
)
��G H
;
��H I
if
�� 
(
�� 
clinic
�� 
==
�� 
null
�� 
)
�� 
{
�� 
return
�� 
NotFound
�� 
(
��  
)
��  !
;
��! "
}
�� 
var
�� 
result
�� 
=
�� 
clinic
�� 
.
��  
Update
��  &
(
��& '
vetClinicDto
��' 3
.
��3 4
Name
��4 8
,
��8 9
vetClinicDto
��: F
.
��F G
Address
��G N
,
��N O
vetClinicDto
��P \
.
��\ ]
NumberOfPlaces
��] k
,
��k l
vetClinicDto
�� 
.
�� 
ContactEmail
�� )
,
��) *
vetClinicDto
��+ 7
.
��7 8
ContactPhone
��8 D
)
��D E
;
��E F
if
�� 
(
�� 
result
�� 
.
�� 
	IsFailure
��  
)
��  !
{
�� 
return
�� 

BadRequest
�� !
(
��! "
result
��" (
.
��( )
Error
��) .
)
��. /
;
��/ 0
}
�� 

unitOfWork
�� 
.
�� !
VetClinicRepository
�� *
.
��* +
Update
��+ 1
(
��1 2
result
��2 8
.
��8 9
Entity
��9 ?
)
��? @
;
��@ A

unitOfWork
�� 
.
�� 
SaveChanges
�� "
(
��" #
)
��# $
;
��$ %
return
�� 
	NoContent
�� 
(
�� 
)
�� 
;
�� 
}
�� 	
[
�� 	
HttpPut
��	 
(
�� 
$str
�� 6
)
��6 7
]
��7 8
public
�� 
IActionResult
�� 
	UpdateVet
�� &
(
��& '
Guid
��' +
vetClinicId
��, 7
,
��7 8
Guid
��9 =
vetId
��> C
,
��C D
[
��E F
FromBody
��F N
]
��N O
VetDto
��P V
vetDto
��W ]
)
��] ^
{
�� 	
var
�� 
clinic
�� 
=
�� 

unitOfWork
�� #
.
��# $!
VetClinicRepository
��$ 7
.
��7 8
Get
��8 ;
(
��; <
vetClinicId
��< G
)
��G H
;
��H I
if
�� 
(
�� 
clinic
�� 
==
�� 
null
�� 
)
�� 
{
�� 
return
�� 
NotFound
�� 
(
��  
)
��  !
;
��! "
}
�� 
var
�� 
vet
�� 
=
�� 

unitOfWork
��  
.
��  !
VetRepository
��! .
.
��. /
Get
��/ 2
(
��2 3
vetId
��3 8
)
��8 9
;
��9 :
if
�� 
(
�� 
vet
�� 
==
�� 
null
�� 
)
�� 
{
�� 
return
�� 
NotFound
�� 
(
��  
)
��  !
;
��! "
}
�� 
var
�� 
result
�� 
=
�� 
vet
�� 
.
�� 
Update
�� #
(
��# $
vetDto
��$ *
.
��* +
Name
��+ /
,
��/ 0
vetDto
��1 7
.
��7 8
Surname
��8 ?
,
��? @
vetDto
��A G
.
��G H
	Birthdate
��H Q
,
��Q R
vetDto
��S Y
.
��Y Z
Gender
��Z `
,
��` a
vetDto
��b h
.
��h i
Email
��i n
,
��n o
vetDto
�� 
.
�� 
Phone
�� 
,
�� 
vetDto
�� $
.
��$ %
Specialisation
��% 3
)
��3 4
;
��4 5
if
�� 
(
�� 
result
�� 
.
�� 
	IsFailure
��  
)
��  !
{
�� 
return
�� 

BadRequest
�� !
(
��! "
result
��" (
.
��( )
Error
��) .
)
��. /
;
��/ 0
}
�� 

unitOfWork
�� 
.
�� 
VetRepository
�� $
.
��$ %
Update
��% +
(
��+ ,
vet
��, /
)
��/ 0
;
��0 1

unitOfWork
�� 
.
�� 
SaveChanges
�� "
(
��" #
)
��# $
;
��$ %
return
�� 
	NoContent
�� 
(
�� 
)
�� 
;
�� 
}
�� 	
[
�� 	
HttpPut
��	 
(
�� 
$str
�� 6
)
��6 7
]
��7 8
public
�� 
IActionResult
�� 
	UpdatePet
�� &
(
��& '
Guid
��' +
vetClinicId
��, 7
,
��7 8
Guid
��9 =
petId
��> C
,
��C D
[
��E F
FromBody
��F N
]
��N O
PetDto
��P V
petDto
��W ]
)
��] ^
{
�� 	
var
�� 
clinic
�� 
=
�� 

unitOfWork
�� #
.
��# $!
VetClinicRepository
��$ 7
.
��7 8
Get
��8 ;
(
��; <
vetClinicId
��< G
)
��G H
;
��H I
if
�� 
(
�� 
clinic
�� 
==
�� 
null
�� 
)
�� 
{
�� 
return
�� 
NotFound
�� 
(
��  
)
��  !
;
��! "
}
�� 
var
�� 
pet
�� 
=
�� 

unitOfWork
��  
.
��  !
PetRepository
��! .
.
��. /
Get
��/ 2
(
��2 3
petId
��3 8
)
��8 9
;
��9 :
if
�� 
(
�� 
pet
�� 
==
�� 
null
�� 
)
�� 
{
�� 
return
�� 
NotFound
�� 
(
��  
)
��  !
;
��! "
}
�� 
var
�� 
result
�� 
=
�� 
pet
�� 
.
�� 
Update
�� #
(
��# $
petDto
��$ *
.
��* +
Name
��+ /
,
��/ 0
petDto
��1 7
.
��7 8
	Birthdate
��8 A
,
��A B
petDto
��C I
.
��I J
Race
��J N
,
��N O
petDto
��P V
.
��V W
Gender
��W ]
)
��] ^
;
��^ _
if
�� 
(
�� 
result
�� 
.
�� 
	IsFailure
��  
)
��  !
{
�� 
return
�� 

BadRequest
�� !
(
��! "
result
��" (
.
��( )
Error
��) .
)
��. /
;
��/ 0
}
�� 

unitOfWork
�� 
.
�� 
PetRepository
�� $
.
��$ %
Update
��% +
(
��+ ,
pet
��, /
)
��/ 0
;
��0 1

unitOfWork
�� 
.
�� 
SaveChanges
�� "
(
��" #
)
��# $
;
��$ %
return
�� 
	NoContent
�� 
(
�� 
)
�� 
;
�� 
}
�� 	
[
�� 	

HttpDelete
��	 
(
�� 
$str
�� (
)
��( )
]
��) *
public
�� 
IActionResult
�� 
Delete
�� #
(
��# $
Guid
��$ (
vetClinicId
��) 4
)
��4 5
{
�� 	
var
�� 
	vetClinic
�� 
=
�� 

unitOfWork
�� &
.
��& '!
VetClinicRepository
��' :
.
��: ;
Get
��; >
(
��> ?
vetClinicId
��? J
)
��J K
;
��K L
if
�� 
(
�� 
	vetClinic
�� 
==
�� 
null
�� !
)
��! "
{
�� 
return
�� 
NotFound
�� 
(
��  
)
��  !
;
��! "
}
�� 
var
�� 
medicalHistorys
�� 
=
��  !

unitOfWork
��" ,
.
��, -&
MedicalHistoryRepository
��- E
.
��E F
All
��F I
(
��I J
)
��J K
.
��K L
Where
��L Q
(
��Q R
m
��R S
=>
��T V
m
��W X
.
��X Y
ClinicId
��Y a
==
��b d
vetClinicId
��e p
)
��p q
;
��q r
if
�� 
(
�� 
medicalHistorys
�� 
!=
��  "
null
��# '
)
��' (
{
�� 
foreach
�� 
(
�� 
var
�� 
item
�� !
in
��" $
medicalHistorys
��% 4
)
��4 5
{
�� 

unitOfWork
�� 
.
�� &
MedicalHistoryRepository
�� 7
.
��7 8
Delete
��8 >
(
��> ?
item
��? C
)
��C D
;
��D E
}
�� 
}
�� 
var
�� 
vets
�� 
=
�� 

unitOfWork
�� !
.
��! "
VetRepository
��" /
.
��/ 0
All
��0 3
(
��3 4
)
��4 5
.
��5 6
Where
��6 ;
(
��; <
v
��< =
=>
��> @
v
��A B
.
��B C
ClinicId
��C K
==
��L N
vetClinicId
��O Z
)
��Z [
;
��[ \
if
�� 
(
�� 
vets
�� 
!=
�� 
null
�� 
)
�� 
{
�� 
foreach
�� 
(
�� 
var
�� 
item
�� !
in
��" $
vets
��% )
)
��) *
{
�� 

unitOfWork
�� 
.
�� 
VetRepository
�� ,
.
��, -
Delete
��- 3
(
��3 4
item
��4 8
)
��8 9
;
��9 :
}
�� 
}
�� 
var
�� 
pets
�� 
=
�� 

unitOfWork
�� !
.
��! "
PetRepository
��" /
.
��/ 0
All
��0 3
(
��3 4
)
��4 5
.
��5 6
Where
��6 ;
(
��; <
p
��< =
=>
��> @
p
��A B
.
��B C
ClinicId
��C K
==
��L N
vetClinicId
��O Z
)
��Z [
;
��[ \
if
�� 
(
�� 
pets
�� 
!=
�� 
null
�� 
)
�� 
{
�� 
foreach
�� 
(
�� 
var
�� 
item
�� !
in
��" $
pets
��% )
)
��) *
{
�� 

unitOfWork
�� 
.
�� 
PetRepository
�� ,
.
��, -
Delete
��- 3
(
��3 4
item
��4 8
)
��8 9
;
��9 :
}
�� 
}
�� 

unitOfWork
�� 
.
�� !
VetClinicRepository
�� *
.
��* +
Delete
��+ 1
(
��1 2
	vetClinic
��2 ;
)
��; <
;
��< =

unitOfWork
�� 
.
�� 
SaveChanges
�� "
(
��" #
)
��# $
;
��$ %
return
�� 
	NoContent
�� 
(
�� 
)
�� 
;
�� 
}
�� 	
[
�� 	

HttpDelete
��	 
(
�� 
$str
�� 9
)
��9 :
]
��: ;
public
�� 
IActionResult
�� 
	DeleteVet
�� &
(
��& '
Guid
��' +
vetClinicId
��, 7
,
��7 8
Guid
��9 =
vetId
��> C
)
��C D
{
�� 	
var
�� 
clinic
�� 
=
�� 

unitOfWork
�� #
.
��# $!
VetClinicRepository
��$ 7
.
��7 8
Get
��8 ;
(
��; <
vetClinicId
��< G
)
��G H
;
��H I
if
�� 
(
�� 
clinic
�� 
==
�� 
null
�� 
)
�� 
{
�� 
return
�� 
NotFound
�� 
(
��  
)
��  !
;
��! "
}
�� 
var
�� 
vet
�� 
=
�� 

unitOfWork
��  
.
��  !
VetRepository
��! .
.
��. /
Get
��/ 2
(
��2 3
vetId
��3 8
)
��8 9
;
��9 :
if
�� 
(
�� 
vet
�� 
==
�� 
null
�� 
)
�� 
{
�� 
return
�� 
NotFound
�� 
(
��  
)
��  !
;
��! "
}
�� 

unitOfWork
�� 
.
�� 
VetRepository
�� $
.
��$ %
Delete
��% +
(
��+ ,
vet
��, /
)
��/ 0
;
��0 1

unitOfWork
�� 
.
�� 
SaveChanges
�� "
(
��" #
)
��# $
;
��$ %
return
�� 
	NoContent
�� 
(
�� 
)
�� 
;
�� 
}
�� 	
[
�� 	

HttpDelete
��	 
(
�� 
$str
�� 9
)
��9 :
]
��: ;
public
�� 
IActionResult
�� 
	DeletePet
�� &
(
��& '
Guid
��' +
vetClinicId
��, 7
,
��7 8
Guid
��9 =
petId
��> C
)
��C D
{
�� 	
var
�� 
clinic
�� 
=
�� 

unitOfWork
�� #
.
��# $!
VetClinicRepository
��$ 7
.
��7 8
Get
��8 ;
(
��; <
vetClinicId
��< G
)
��G H
;
��H I
if
�� 
(
�� 
clinic
�� 
==
�� 
null
�� 
)
�� 
{
�� 
return
�� 
NotFound
�� 
(
��  
)
��  !
;
��! "
}
�� 
var
�� 
pet
�� 
=
�� 

unitOfWork
��  
.
��  !
PetRepository
��! .
.
��. /
Get
��/ 2
(
��2 3
petId
��3 8
)
��8 9
;
��9 :
if
�� 
(
�� 
pet
�� 
==
�� 
null
�� 
)
�� 
{
�� 
return
�� 
NotFound
�� 
(
��  
)
��  !
;
��! "
}
�� 

unitOfWork
�� 
.
�� 
PetRepository
�� $
.
��$ %
Delete
��% +
(
��+ ,
pet
��, /
)
��/ 0
;
��0 1

unitOfWork
�� 
.
�� 
SaveChanges
�� "
(
��" #
)
��# $
;
��$ %
return
�� 
	NoContent
�� 
(
�� 
)
�� 
;
�� 
}
�� 	
}
�� 
}�� �.
�D:\Facultate\Anul_3\.NET\VetAppointment_S12\VetAppointment - APIs + Tests\VetAppointment - Working\VetAppointment.API\Controllers\VetsController.cs
	namespace 	
VetAppointment
 
. 
API 
. 
Controllers (
{ 
[		 
Route		 

(		
 
$str		  
)		  !
]		! "
[

 
ApiController

 
]

 
public 

class 
VetsController 
:  !
ControllerBase" 0
{ 
private 
readonly 
IRepository $
<$ %
Vet% (
>( )
vetRepository* 7
;7 8
public 
VetsController 
( 
IRepository )
<) *
Vet* -
>- .
vetRepository/ <
)< =
=>> @
thisA E
.E F
vetRepositoryF S
=T U
vetRepositoryV c
;c d
[ 	
HttpGet	 
] 
public 
IActionResult 
Get  
(  !
)! "
{ 	
var 
vets 
= 
vetRepository $
. 
All 
( 
) 
. 
Select 
( 
v 
=> 
new 
VetDto #
(# $
)$ %
{ 
Id 
= 
v 
. 
Id !
,! "
Name 
= 
v  
.  !
Name! %
,% &
Surname 
=  !
v" #
.# $
Surname$ +
,+ ,
	Birthdate !
=" #
v$ %
.% &
	Birthdate& /
./ 0
ToString0 8
(8 9
)9 :
,: ;
Gender 
=  
v! "
." #
Gender# )
.) *
ToString* 2
(2 3
)3 4
,4 5
Email 
= 
v  !
.! "
Email" '
,' (
Phone 
= 
v  !
.! "
Phone" '
,' (
Specialisation   &
=  ' (
v  ) *
.  * +
Specialisation  + 9
.  9 :
ToString  : B
(  B C
)  C D
}!! 
)"" 
;"" 
return$$ 
Ok$$ 
($$ 
vets$$ 
)$$ 
;$$ 
}%% 	
['' 	
HttpPost''	 
]'' 
public(( 
IActionResult(( 
Create(( #
(((# $
[(($ %
FromBody((% -
]((- .
CreateVetDto((/ ;
vetDto((< B
)((B C
{)) 	
var** 
vet** 
=** 
Vet** 
.** 
Create**  
(**  !
vetDto++ 
.++ 
Name++ 
,++  
vetDto,, 
.,, 
Surname,, "
,,," #
vetDto-- 
.-- 
	Birthdate-- $
,--$ %
vetDto.. 
... 
Gender.. !
,..! "
vetDto// 
.// 
Email//  
,//  !
vetDto00 
.00 
Phone00  
,00  !
vetDto11 
.11 
Specialisation11 )
)22 
;22 
if44 
(44 
vet44 
.44 
	IsFailure44 
)44 
{55 
return66 

BadRequest66 !
(66! "
vet66" %
.66% &
Error66& +
)66+ ,
;66, -
}77 
vetRepository99 
.99 
Add99 
(99 
vet99 !
.99! "
Entity99" (
)99( )
;99) *
vetRepository:: 
.:: 
SaveChanges:: %
(::% &
)::& '
;::' (
var<< 
fullVet<< 
=<< 
new<< 
VetDto<< $
(<<$ %
)<<% &
{== 
Id>> 
=>> 
vet>> 
.>> 
Entity>> 
.>>  
Id>>  "
,>>" #
ClinicId?? 
=?? 
vet?? 
.?? 
Entity?? %
.??% &
ClinicId??& .
,??. /
Name@@ 
=@@ 
vet@@ 
.@@ 
Entity@@ !
.@@! "
Name@@" &
,@@& '
SurnameAA 
=AA 
vetAA 
.AA 
EntityAA $
.AA$ %
SurnameAA% ,
,AA, -
	BirthdateBB 
=BB 
vetBB 
.BB  
EntityBB  &
.BB& '
	BirthdateBB' 0
.BB0 1
ToStringBB1 9
(BB9 :
)BB: ;
,BB; <
GenderCC 
=CC 
vetCC 
.CC 
EntityCC #
.CC# $
GenderCC$ *
.CC* +
ToStringCC+ 3
(CC3 4
)CC4 5
,CC5 6
EmailDD 
=DD 
vetDD 
.DD 
EntityDD "
.DD" #
EmailDD# (
,DD( )
PhoneEE 
=EE 
vetEE 
.EE 
EntityEE "
.EE" #
PhoneEE# (
,EE( )
SpecialisationFF 
=FF  
vetFF! $
.FF$ %
EntityFF% +
.FF+ ,
SpecialisationFF, :
.FF: ;
ToStringFF; C
(FFC D
)FFD E
}GG 
;GG 
returnII 
CreatedII 
(II 
nameofII !
(II! "
GetII" %
)II% &
,II& '
fullVetII( /
)II/ 0
;II0 1
}JJ 	
}KK 
}LL �
�D:\Facultate\Anul_3\.NET\VetAppointment_S12\VetAppointment - APIs + Tests\VetAppointment - Working\VetAppointment.API\Dtos\AppointmentDto.cs
	namespace 	
VetAppointment
 
. 
API 
. 
Dtos !
{ 
public 

class 
AppointmentDto 
:  ! 
CreateAppointmentDto" 6
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
}		 �

�D:\Facultate\Anul_3\.NET\VetAppointment_S12\VetAppointment - APIs + Tests\VetAppointment - Working\VetAppointment.API\Dtos\Create\CreateAppointmentDto.cs
	namespace 	
VetAppointment
 
. 
API 
. 
Dtos !
.! "
Create" (
{ 
public 

class  
CreateAppointmentDto %
{ 
public 
string 
ScheduledDate #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
int &
EstimatedDurationInMinutes -
{. /
get0 3
;3 4
set5 8
;8 9
}: ;
public		 
Guid		 
VetId		 
{		 
get		 
;		  
set		! $
;		$ %
}		& '
public 
Guid 
PetId 
{ 
get 
;  
set! $
;$ %
}& '
public 
Guid 
TreatmentId 
{  !
get" %
;% &
set' *
;* +
}, -
public 
Guid 
MedicalHistoryId $
{% &
get' *
;* +
set, /
;/ 0
}1 2
} 
} �
�D:\Facultate\Anul_3\.NET\VetAppointment_S12\VetAppointment - APIs + Tests\VetAppointment - Working\VetAppointment.API\Dtos\Create\CreateDrugDto.cs
	namespace 	
VetAppointment
 
. 
API 
. 
Dtos !
.! "
Create" (
{ 
public 

class 
CreateDrugDto 
{ 
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
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
	UnitPrice 
{  !
get" %
;% &
set' *
;* +
}, -
}		 
}

 �
�D:\Facultate\Anul_3\.NET\VetAppointment_S12\VetAppointment - APIs + Tests\VetAppointment - Working\VetAppointment.API\Dtos\Create\CreatePetDto.cs
	namespace 	
VetAppointment
 
. 
API 
. 
Dtos !
.! "
Create" (
{ 
public 

class 
CreatePetDto 
{ 
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
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
string 
Race 
{ 
get  
;  !
set" %
;% &
}' (
public		 
string		 
Gender		 
{		 
get		 "
;		" #
set		$ '
;		' (
}		) *
}

 
} �
�D:\Facultate\Anul_3\.NET\VetAppointment_S12\VetAppointment - APIs + Tests\VetAppointment - Working\VetAppointment.API\Dtos\Create\CreatePetOwnerDto.cs
	namespace 	
VetAppointment
 
. 
API 
. 
Dtos !
.! "
Create" (
{ 
public 

class 
CreatePetOwnerDto "
{ 
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
Surname 
{ 
get  #
;# $
set% (
;( )
}* +
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
string		 
Gender		 
{		 
get		 "
;		" #
set		$ '
;		' (
}		) *
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
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
Phone 
{ 
get !
;! "
set# &
;& '
}( )
} 
} �
�D:\Facultate\Anul_3\.NET\VetAppointment_S12\VetAppointment - APIs + Tests\VetAppointment - Working\VetAppointment.API\Dtos\Create\CreatePrescribedDrugDto.cs
	namespace 	
VetAppointment
 
. 
API 
. 
Dtos !
.! "
Create" (
{ 
public 

class #
CreatePrescribedDrugDto (
{ 
public 
double 
Quantity 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
double 
	TotalCost 
{  !
get" %
;% &
set' *
;* +
}, -
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
}		 �
�D:\Facultate\Anul_3\.NET\VetAppointment_S12\VetAppointment - APIs + Tests\VetAppointment - Working\VetAppointment.API\Dtos\Create\CreateTreatmentDto.cs
	namespace 	
VetAppointment
 
. 
API 
. 
Dtos !
.! "
Create" (
{ 
public 

class 
CreateTreatmentDto #
{ 
public 
string 
Description !
{" #
get$ '
;' (
set) ,
;, -
}. /
} 
} �	
�D:\Facultate\Anul_3\.NET\VetAppointment_S12\VetAppointment - APIs + Tests\VetAppointment - Working\VetAppointment.API\Dtos\Create\CreateVetClinicDto.cs
	namespace 	
VetAppointment
 
. 
API 
. 
Dtos !
.! "
Create" (
{ 
public 

class 
CreateVetClinicDto #
{ 
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
Address 
{ 
get  #
;# $
set% (
;( )
}* +
public 
int 
NumberOfPlaces !
{" #
get$ '
;' (
set) ,
;, -
}. /
public		 
string		 
ContactEmail		 "
{		# $
get		% (
;		( )
set		* -
;		- .
}		/ 0
public

 
string

 
ContactPhone

 "
{

# $
get

% (
;

( )
set

* -
;

- .
}

/ 0
} 
} �
�D:\Facultate\Anul_3\.NET\VetAppointment_S12\VetAppointment - APIs + Tests\VetAppointment - Working\VetAppointment.API\Dtos\Create\CreateVetDto.cs
	namespace 	
VetAppointment
 
. 
API 
. 
Dtos !
.! "
Create" (
{ 
public 

class 
CreateVetDto 
{ 
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
Surname 
{ 
get  #
;# $
set% (
;( )
}* +
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
string		 
Gender		 
{		 
get		 "
;		" #
set		$ '
;		' (
}		) *
public

 
string

 
Email

 
{

 
get

 !
;

! "
set

# &
;

& '
}

( )
public 
string 
Phone 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
Specialisation $
{% &
get' *
;* +
set, /
;/ 0
}1 2
} 
} �
�D:\Facultate\Anul_3\.NET\VetAppointment_S12\VetAppointment - APIs + Tests\VetAppointment - Working\VetAppointment.API\Dtos\DrugDto.cs
	namespace 	
VetAppointment
 
. 
API 
. 
Dtos !
{ 
public 

class 
DrugDto 
: 
CreateDrugDto (
{ 
public 
Guid 
Id 
{ 
get 
; 
set !
;! "
}# $
}		 
}

 �
�D:\Facultate\Anul_3\.NET\VetAppointment_S12\VetAppointment - APIs + Tests\VetAppointment - Working\VetAppointment.API\Dtos\MedicalHistoryDto.cs
	namespace 	
VetAppointment
 
. 
API 
. 
Dtos !
{ 
public 

class 
MedicalHistoryDto "
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
Guid 
ClinicId 
{ 
get "
;" #
set$ '
;' (
}) *
} 
} �
�D:\Facultate\Anul_3\.NET\VetAppointment_S12\VetAppointment - APIs + Tests\VetAppointment - Working\VetAppointment.API\Dtos\PetDto.cs
	namespace 	
VetAppointment
 
. 
API 
. 
Dtos !
{ 
public 

class 
PetDto 
: 
CreatePetDto &
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
}		 �
�D:\Facultate\Anul_3\.NET\VetAppointment_S12\VetAppointment - APIs + Tests\VetAppointment - Working\VetAppointment.API\Dtos\PetOwnerDto.cs
	namespace 	
VetAppointment
 
. 
API 
. 
Dtos !
{ 
public 

class 
PetOwnerDto 
: 
CreatePetOwnerDto 0
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
}		 �
�D:\Facultate\Anul_3\.NET\VetAppointment_S12\VetAppointment - APIs + Tests\VetAppointment - Working\VetAppointment.API\Dtos\PrescribedDrugDto.cs
	namespace 	
VetAppointment
 
. 
API 
. 
Dtos !
{ 
public 

class 
PrescribedDrugDto "
:# $#
CreatePrescribedDrugDto% <
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
}		 �
�D:\Facultate\Anul_3\.NET\VetAppointment_S12\VetAppointment - APIs + Tests\VetAppointment - Working\VetAppointment.API\Dtos\TreatmentDto.cs
	namespace 	
VetAppointment
 
. 
API 
. 
Dtos !
{ 
public 

class 
TreatmentDto 
: 
CreateTreatmentDto  2
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
}		 �
�D:\Facultate\Anul_3\.NET\VetAppointment_S12\VetAppointment - APIs + Tests\VetAppointment - Working\VetAppointment.API\Dtos\VetClinicDto.cs
	namespace 	
VetAppointment
 
. 
API 
. 
Dtos !
{ 
public 

class 
VetClinicDto 
: 
CreateVetClinicDto  2
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
public 
Guid 
MedicalHistoryId $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public		 
DateTime		 
RegistrationDate		 (
{		) *
get		+ .
;		. /
set		0 3
;		3 4
}		5 6
}

 
} �
�D:\Facultate\Anul_3\.NET\VetAppointment_S12\VetAppointment - APIs + Tests\VetAppointment - Working\VetAppointment.API\Dtos\VetDto.cs
	namespace 	
VetAppointment
 
. 
API 
. 
Dtos !
{ 
public 

class 
VetDto 
: 
CreateVetDto &
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
Guid		 
ClinicId		 
{		 
get		 "
;		" #
set		$ '
;		' (
}		) *
}

 
} �,
�D:\Facultate\Anul_3\.NET\VetAppointment_S12\VetAppointment - APIs + Tests\VetAppointment - Working\VetAppointment.API\Program.cs
var 
builder 
= 
WebApplication 
. 
CreateBuilder *
(* +
args+ /
)/ 0
;0 1
builder 
. 
Services 
. 
AddControllers 
(  
)  !
;! "
builder 
. 
Services 
. #
AddEndpointsApiExplorer (
(( )
)) *
;* +
builder 
. 
Services 
. 
AddSwaggerGen 
( 
)  
;  !
builder 
. 
Services 
. 
AddTransient 
< 
IUnitOfWork )
,) *

UnitOfWork+ 5
>5 6
(6 7
)7 8
;8 9
builder 
. 
Services 
. 
	AddScoped 
< 
IRepository &
<& '
Appointment' 2
>2 3
,3 4!
AppointmentRepository5 J
>J K
(K L
)L M
;M N
builder 
. 
Services 
. 
	AddScoped 
< 
IRepository &
<& '
PetOwner' /
>/ 0
,0 1
PetOwnerRepository2 D
>D E
(E F
)F G
;G H
builder 
. 
Services 
. 
	AddScoped 
< 
IRepository &
<& '
Pet' *
>* +
,+ ,
PetRepository- :
>: ;
(; <
)< =
;= >
builder   
.   
Services   
.   
	AddScoped   
<   
IRepository   &
<  & '
	VetClinic  ' 0
>  0 1
,  1 2
VetClinicRepository  3 F
>  F G
(  G H
)  H I
;  I J
builder!! 
.!! 
Services!! 
.!! 
	AddScoped!! 
<!! 
IRepository!! &
<!!& '
Vet!!' *
>!!* +
,!!+ ,
VetRepository!!- :
>!!: ;
(!!; <
)!!< =
;!!= >
builder"" 
."" 
Services"" 
."" 
	AddScoped"" 
<"" 
IRepository"" &
<""& '
Drug""' +
>""+ ,
,"", -
DrugRepository"". <
>""< =
(""= >
)""> ?
;""? @
builder## 
.## 
Services## 
.## 
	AddScoped## 
<## 
IRepository## &
<##& '
MedicalHistory##' 5
>##5 6
,##6 7$
MedicalHistoryRepository##8 P
>##P Q
(##Q R
)##R S
;##S T
builder$$ 
.$$ 
Services$$ 
.$$ 
	AddScoped$$ 
<$$ 
IRepository$$ &
<$$& '
PrescribedDrug$$' 5
>$$5 6
,$$6 7$
PrescribedDrugRepository$$8 P
>$$P Q
($$Q R
)$$R S
;$$S T
builder%% 
.%% 
Services%% 
.%% 
	AddScoped%% 
<%% 
IRepository%% &
<%%& '
	Treatment%%' 0
>%%0 1
,%%1 2
TreatmentRepository%%3 F
>%%F G
(%%G H
)%%H I
;%%I J
builder// 
.// 
Services// 
.// 
AddCors// 
(// 
options//  
=>//! #
{00 
options11 
.11 
AddDefaultPolicy11 
(11 
builder11 $
=>11% '
{22 
builder33 
.33 
WithOrigins33 
(33 
$str33 4
)334 5
;335 6
}44 
)44 
;44 
options66 
.66 
	AddPolicy66 
(66 
name66 
:66 
$str66 )
,66) *
builder66+ 2
=>663 5
{77 
builder88 
.88 
WithOrigins88 
(88 
$str88 4
)884 5
;885 6
}99 
)99 
;99 
}:: 
):: 
;:: 
builder<< 
.<< 
Services<< 
.<< 
AddControllers<< 
(<<  
)<<  !
;<<! "
var>> 
app>> 
=>> 	
builder>>
 
.>> 
Build>> 
(>> 
)>> 
;>> 
ifAA 
(AA 
appAA 
.AA 
EnvironmentAA 
.AA 
IsDevelopmentAA !
(AA! "
)AA" #
)AA# $
{BB 
appCC 
.CC 

UseSwaggerCC 
(CC 
)CC 
;CC 
appDD 
.DD 
UseSwaggerUIDD 
(DD 
)DD 
;DD 
}EE 
appGG 
.GG 
UseHttpsRedirectionGG 
(GG 
)GG 
;GG 
appHH 
.HH 
UseCorsHH 
(HH 
$strHH 
)HH 
;HH 
appJJ 
.JJ 
UseAuthorizationJJ 
(JJ 
)JJ 
;JJ 
appLL 
.LL 
MapControllersLL 
(LL 
)LL 
;LL 
appNN 
.NN 
RunNN 
(NN 
)NN 	
;NN	 
