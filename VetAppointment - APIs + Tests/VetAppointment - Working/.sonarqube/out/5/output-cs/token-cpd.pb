�m
YD:\.NET\VetAppointment - Working\VetAppointment.API\Controllers\AppointmentsController.cs
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
class "
AppointmentsController '
:( )
ControllerBase* 8
{ 
private 
readonly 
IRepository $
<$ %
Appointment% 0
>0 1!
appointmentRepository2 G
;G H
private 
readonly 
IRepository $
<$ %
MedicalHistory% 3
>3 4$
medicalHistoryRepository5 M
;M N
private 
readonly 
IRepository $
<$ %
	Treatment% .
>. /
treatmentRepository0 C
;C D
private 
readonly 
IRepository $
<$ %
Pet% (
>( )
petRepository* 7
;7 8
private 
readonly 
IRepository $
<$ %
Vet% (
>( )
vetRepository* 7
;7 8
public "
AppointmentsController %
(% &
IRepository& 1
<1 2
Appointment2 =
>= >!
appointmentRepository? T
,T U
IRepository 
< 
Pet 
> 
petRepository *
,* +
IRepository, 7
<7 8
Vet8 ;
>; <
vetRepository= J
,J K
IRepositoryL W
<W X
MedicalHistoryX f
>f g%
medicalHistoryRepository	h �
,
� �
IRepository 
< 
	Treatment !
>! "
treatmentRepository# 6
)6 7
{ 	
this 
. !
appointmentRepository &
=' (!
appointmentRepository) >
;> ?
this 
. 
petRepository 
=  
petRepository! .
;. /
this 
. 
vetRepository 
=  
vetRepository! .
;. /
this 
. $
medicalHistoryRepository )
=* +$
medicalHistoryRepository, D
;D E
this 
. 
treatmentRepository $
=% &
treatmentRepository' :
;: ;
} 	
[ 	
HttpPost	 
] 
public   
IActionResult   
Create   #
(  # $
[  $ %
FromBody  % -
]  - . 
CreateAppointmentDto  / C
appointmentDto  D R
)  R S
{!! 	
var"" 
pet"" 
="" 
petRepository"" #
.""# $
Get""$ '
(""' (
appointmentDto""( 6
.""6 7
PetId""7 <
)""< =
;""= >
if## 
(## 
pet## 
==## 
null## 
)## 
{$$ 
return%% 
NotFound%% 
(%%  
)%%  !
;%%! "
}&& 
var'' 
vet'' 
='' 
vetRepository'' #
.''# $
Get''$ '
(''' (
appointmentDto''( 6
.''6 7
VetId''7 <
)''< =
;''= >
if(( 
((( 
vet(( 
==(( 
null(( 
)(( 
{)) 
return** 
NotFound** 
(**  
)**  !
;**! "
}++ 
var,, 
appointment,, 
=,, 
Appointment,, )
.,,) *
SettleAppointment,,* ;
(,,; <
vet-- 
,-- 
pet.. 
,.. 
appointmentDto// "
.//" #
ScheduledDate//# 0
,//0 1
appointmentDto00 "
.00" #&
EstimatedDurationInMinutes00# =
)11 
;11 
var33 

treatement33 
=33 
treatmentRepository33 0
.330 1
Get331 4
(334 5
appointmentDto335 C
.33C D
TreatmentId33D O
)33O P
;33P Q
if44 
(44 

treatement44 
==44 
null44 "
)44# $
{55 
return66 
NotFound66 
(66  
)66  !
;66! "
}77 
var99 
history99 
=99 $
medicalHistoryRepository99 2
.992 3
Get993 6
(996 7
appointmentDto997 E
.99E F
MedicalHistoryId99F V
)99V W
;99W X
if:: 
(:: 
history:: 
==:: 
null:: 
)::  
{;; 
return<< 
NotFound<< 
(<<  
)<<  !
;<<! "
}== 
history?? 
.?? (
RegisterAppointmentToHistory?? 0
(??0 1
appointment??1 <
.??< =
Entity??= C
)??C D
;??D E$
medicalHistoryRepository@@ $
.@@$ %
Update@@% +
(@@+ ,
history@@, 3
)@@3 4
;@@4 5$
medicalHistoryRepositoryAA $
.AA$ %
SaveChangesAA% 0
(AA0 1
)AA1 2
;AA2 3
appointmentCC 
.CC 
EntityCC 
.CC (
AttachTreatmentToAppointmentCC ;
(CC; <

treatementCC< F
)CCF G
;CCG H
appointmentDD 
.DD 
EntityDD 
.DD -
!AttachAppointmentToMedicalHistoryDD @
(DD@ A
historyDDA H
)DDH I
;DDI J
ifGG 
(GG 
appointmentGG 
.GG 
	IsFailureGG %
)GG% &
{HH 
returnII 

BadRequestII !
(II! "
appointmentII" -
.II- .
ErrorII. 3
)II3 4
;II4 5
}JJ !
appointmentRepositoryLL !
.LL! "
AddLL" %
(LL% &
appointmentLL& 1
.LL1 2
EntityLL2 8
)LL8 9
;LL9 :!
appointmentRepositoryMM !
.MM! "
SaveChangesMM" -
(MM- .
)MM. /
;MM/ 0
varNN 
fullAppointmentNN 
=NN  !
newNN" %
AppointmentDtoNN& 4
{OO 
IdPP 
=PP 
appointmentPP  
.PP  !
EntityPP! '
.PP' (
IdPP( *
,PP* +
VetIdQQ 
=QQ 
appointmentQQ #
.QQ# $
EntityQQ$ *
.QQ* +
VetIdQQ+ 0
,QQ0 1
PetIdRR 
=RR 
appointmentRR #
.RR# $
EntityRR$ *
.RR* +
PetIdRR+ 0
,RR0 1
ScheduledDateSS 
=SS 
appointmentSS  +
.SS+ ,
EntitySS, 2
.SS2 3
ScheduledDateSS3 @
,SS@ A&
EstimatedDurationInMinutesTT *
=TT+ ,
appointmentTT- 8
.TT8 9
EntityTT9 ?
.TT? @&
EstimatedDurationInMinutesTT@ Z
}UU 
;UU 
returnWW 
CreatedWW 
(WW 
nameofWW !
(WW! "
GetAllAppointmentsWW" 4
)WW4 5
,WW5 6
appointmentWW7 B
)WWB C
;WWC D
}XX 	
[ZZ 	
HttpGetZZ	 
]ZZ 
public[[ 
IActionResult[[ 
GetAllAppointments[[ /
([[/ 0
)[[0 1
{\\ 	
var]] 
appointments]] 
=]] !
appointmentRepository]] 4
.]]4 5
All]]5 8
(]]8 9
)]]9 :
.]]: ;
Select]]; A
(]]A B
appointment]]B M
=>]]N P
new]]Q T
AppointmentDto]]U c
(]]c d
)]]d e
{^^ 
Id__ 
=__ 
appointment__  
.__  !
Id__! #
,__# $
VetId`` 
=`` 
appointment`` #
.``# $
VetId``$ )
,``) *
PetIdaa 
=aa 
appointmentaa #
.aa# $
PetIdaa$ )
,aa) *
ScheduledDatebb 
=bb 
appointmentbb  +
.bb+ ,
ScheduledDatebb, 9
,bb9 :&
EstimatedDurationInMinutescc *
=cc+ ,
appointmentcc- 8
.cc8 9&
EstimatedDurationInMinutescc9 S
,ccS T
TreatmentIddd 
=dd 
appointmentdd )
.dd) *
TreatmentIddd* 5
,dd5 6
MedicalHistoryIdee  
=ee! "
appointmentee# .
.ee. /
MedicalHistoryIdee/ ?
}ff 
)ff 
;ff 
returnhh 
Okhh 
(hh 
appointmentshh "
)hh" #
;hh# $
}ii 	
[kk 	
HttpGetkk	 
(kk 
$strkk 
)kk 
]kk 
publicll 
IActionResultll 
GetAppointmentByIdll /
(ll/ 0
Guidll0 4
idll5 7
)ll7 8
{mm 	
varnn 
appointmentnn 
=nn !
appointmentRepositorynn 3
.nn3 4
Getnn4 7
(nn7 8
idnn8 :
)nn: ;
;nn; <
ifoo 
(oo 
appointmentoo 
==oo 
nulloo #
)oo# $
{pp 
returnqq 
NotFoundqq 
(qq  
)qq  !
;qq! "
}rr 
vartt 
appointmentDtott 
=tt  
newtt! $
AppointmentDtott% 3
{uu 
Idvv 
=vv 
appointmentvv  
.vv  !
Idvv! #
,vv# $
VetIdww 
=ww 
appointmentww #
.ww# $
VetIdww$ )
,ww) *
PetIdxx 
=xx 
appointmentxx #
.xx# $
PetIdxx$ )
,xx) *
ScheduledDateyy 
=yy 
appointmentyy  +
.yy+ ,
ScheduledDateyy, 9
,yy9 :&
EstimatedDurationInMinuteszz *
=zz+ ,
appointmentzz- 8
.zz8 9&
EstimatedDurationInMinuteszz9 S
,zzS T
TreatmentId{{ 
={{ 
appointment{{ )
.{{) *
TreatmentId{{* 5
,{{5 6
MedicalHistoryId||  
=||! "
appointment||# .
.||. /
MedicalHistoryId||/ ?
}}} 
;}} 
return 
Ok 
( 
appointmentDto $
)$ %
;% &
}
�� 	
[
�� 	

HttpDelete
��	 
(
�� 
$str
�� 
)
�� 
]
�� 
public
�� 
IActionResult
�� 
DeleteAppointment
�� .
(
��. /
Guid
��/ 3
id
��4 6
)
��6 7
{
�� 	
var
�� 
appointment
�� 
=
�� #
appointmentRepository
�� 3
.
��3 4
Get
��4 7
(
��7 8
id
��8 :
)
��: ;
;
��; <
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
�� #
appointmentRepository
�� !
.
��! "
Delete
��" (
(
��( )
appointment
��) 4
)
��4 5
;
��5 6#
appointmentRepository
�� !
.
��! "
SaveChanges
��" -
(
��- .
)
��. /
;
��/ 0
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
�� #
appointmentRepository
�� 3
.
��3 4
Get
��4 7
(
��7 8
id
��8 :
)
��: ;
;
��; <
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
��w x#
appointmentRepository
�� !
.
��! "
Update
��" (
(
��( )
appointment
��) 4
)
��4 5
;
��5 6#
appointmentRepository
�� !
.
��! "
SaveChanges
��" -
(
��- .
)
��. /
;
��/ 0
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
RD:\.NET\VetAppointment - Working\VetAppointment.API\Controllers\DrugsController.cs
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
 
DrugsController

  
:

! "
ControllerBase

# 1
{ 
private 
readonly 
IRepository $
<$ %
Drug% )
>) *
drugRepository+ 9
;9 :
public 
DrugsController 
( 
IRepository *
<* +
Drug+ /
>/ 0
drugRepository1 ?
)? @
{ 	
this 
. 
drugRepository 
=  !
drugRepository" 0
;0 1
} 	
[ 	
HttpGet	 
] 
public 
IActionResult 
Get  
(  !
)! "
{ 	
var 
drugs 
= 
drugRepository &
.& '
All' *
(* +
)+ ,
., -
Select- 3
( 
d 
=> 
new 
DrugDto $
{ 
Id 
= 
d 
. 
Id !
,! "
Name 
= 
d  
.  !
Name! %
,% &
Quantity  
=! "
d# $
.$ %
Quantity% -
,- .
	UnitPrice !
=" #
d$ %
.% &
	UnitPrice& /
} 
) 
; 
return!! 
Ok!! 
(!! 
drugs!! 
)!! 
;!! 
}"" 	
[$$ 	
HttpGet$$	 
($$ 
$str$$  
)$$  !
]$$! "
public%% 
IActionResult%% 
Get%%  
(%%  !
Guid%%! %
drugId%%& ,
)%%, -
{&& 	
{'' 
var(( 
drug(( 
=(( 
drugRepository(( )
.(() *
Get((* -
(((- .
drugId((. 4
)((4 5
;((5 6
if** 
(** 
drug** 
==** 
null**  
)**  !
{++ 
return,, 
NotFound,, #
(,,# $
),,$ %
;,,% &
}-- 
var// 
drugDto// 
=// 
new// !
DrugDto//" )
{00 
Id11 
=11 
drug11 
.11 
Id11  
,11  !
Name22 
=22 
drug22 
.22  
Name22  $
,22$ %
Quantity33 
=33 
drug33 #
.33# $
Quantity33$ ,
,33, -
	UnitPrice44 
=44 
drug44  $
.44$ %
	UnitPrice44% .
}55 
;55 
return77 
Ok77 
(77 
drugDto77 !
)77! "
;77" #
}88 
}99 	
[;; 	
HttpPost;;	 
];; 
public<< 
IActionResult<< 
Create<< #
(<<# $
[<<$ %
FromBody<<% -
]<<- .
DrugDto<</ 6
drugDto<<7 >
)<<> ?
{== 	
var>> 
drug>> 
=>> 
Drug>> 
.>> 
Create>> "
(>>" #
drugDto?? 
.?? 
Name??  
,??  !
drugDto@@ 
.@@ 
Quantity@@ $
,@@$ %
drugDtoAA 
.AA 
	UnitPriceAA %
)BB 
;BB 
ifDD 
(DD 
drugDD 
.DD 
	IsFailureDD 
)DD 
{EE 
returnFF 

BadRequestFF !
(FF! "
drugFF" &
.FF& '
ErrorFF' ,
)FF, -
;FF- .
}GG 
drugRepositoryII 
.II 
AddII 
(II 
drugII #
.II# $
EntityII$ *
)II* +
;II+ ,
drugRepositoryJJ 
.JJ 
SaveChangesJJ &
(JJ& '
)JJ' (
;JJ( )
returnLL 
CreatedLL 
(LL 
nameofLL !
(LL! "
GetLL" %
)LL% &
,LL& '
drugLL( ,
.LL, -
EntityLL- 3
)LL3 4
;LL4 5
}MM 	
[OO 	

HttpDeleteOO	 
(OO 
$strOO #
)OO# $
]OO$ %
publicPP 
IActionResultPP 
DeletePP #
(PP# $
GuidPP$ (
drugIdPP) /
)PP/ 0
{QQ 	
varRR 
drugRR 
=RR 
drugRepositoryRR %
.RR% &
GetRR& )
(RR) *
drugIdRR* 0
)RR0 1
;RR1 2
ifSS 
(SS 
drugSS 
==SS 
nullSS 
)SS 
{TT 
returnUU 
NotFoundUU 
(UU  
)UU  !
;UU! "
}VV 
drugRepositoryWW 
.WW 
DeleteWW !
(WW! "
drugWW" &
)WW& '
;WW' (
drugRepositoryXX 
.XX 
SaveChangesXX &
(XX& '
)XX' (
;XX( )
returnYY 
OkYY 
(YY 
)YY 
;YY 
}ZZ 	
[\\ 	
HttpPut\\	 
(\\ 
$str\\  
)\\  !
]\\! "
public]] 
IActionResult]] 
Update]] #
(]]# $
Guid]]$ (
drugId]]) /
,]]/ 0
[]]1 2
FromBody]]2 :
]]]: ;
DrugDto]]< C
drugDto]]D K
)]]K L
{^^ 	
var__ 
drug__ 
=__ 
drugRepository__ %
.__% &
Get__& )
(__) *
drugId__* 0
)__0 1
;__1 2
if`` 
(`` 
drug`` 
==`` 
null`` 
)`` 
{aa 
returnbb 
NotFoundbb 
(bb  
)bb  !
;bb! "
}cc 
drugee 
.ee 
Updateee 
(ee 
drugDtoee 
.ee  
Nameee  $
,ee$ %
drugDtoee& -
.ee- .
Quantityee. 6
,ee6 7
drugDtoee8 ?
.ee? @
	UnitPriceee@ I
)eeI J
;eeJ K
drugRepositorygg 
.gg 
Updategg !
(gg! "
druggg" &
)gg& '
;gg' (
drugRepositoryhh 
.hh 
SaveChangeshh &
(hh& '
)hh' (
;hh( )
returnjj 
Okjj 
(jj 
drugjj 
)jj 
;jj 
}kk 	
}ll 
}mm �1
]D:\.NET\VetAppointment - Working\VetAppointment.API\Controllers\MedicalHistoriesController.cs
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
 &
MedicalHistoriesController

 +
:

, -
ControllerBase

. <
{ 
private 
readonly 
IRepository $
<$ %
MedicalHistory% 3
>3 4$
medicalHistoryRepository5 M
;M N
private 
readonly 
IRepository $
<$ %
Pet% (
>( )
petRepository* 7
;7 8
private 
readonly 
IRepository $
<$ %
Vet% (
>( )
vetRepository* 7
;7 8
private 
readonly 
IRepository $
<$ %
Appointment% 0
>0 1!
appointmentRepository2 G
;G H
public &
MedicalHistoriesController )
() *
IRepository* 5
<5 6
MedicalHistory6 D
>D E$
medicalHistoryRepositoryF ^
,^ _
IRepository 
< 
Pet 
> 
petRepository *
,* +
IRepository, 7
<7 8
Vet8 ;
>; <
vetRepository= J
,J K
IRepositoryL W
<W X
AppointmentX c
>c d!
appointmentRepositorye z
)z {
{ 	
this 
. $
medicalHistoryRepository )
=* +$
medicalHistoryRepository, D
;D E
this 
. 
petRepository 
=  
petRepository! .
;. /
this 
. 
vetRepository 
=  
vetRepository! .
;. /
this 
. !
appointmentRepository &
=' (!
appointmentRepository) >
;> ?
} 	
[ 	
HttpGet	 
] 
public 
IActionResult 
Get  
(  !
)! "
{ 	
var 
medicalHistories  
=! "$
medicalHistoryRepository# ;
.; <
All< ?
(? @
)@ A
.A B
SelectB H
(H I
historyI P
=>Q S
newT W
MedicalHistoryDtoX i
{ 
Id   
=   
history   
.   
Id   
}!! 
)!! 
;!! 
return## 
Ok## 
(## 
medicalHistories## &
)##& '
;##' (
}$$ 	
[&& 	
HttpPost&&	 
(&& 
$str&& 7
)&&7 8
]&&8 9
public'' 
IActionResult'' 
Post'' !
(''! "
Guid''" &
medicalHistoryId''' 7
,''7 8
[''9 :
FromBody'': B
]''B C
AppointmentDto''D R
appointmentDto''S a
)''a b
{(( 	
var)) 
medicalHistory)) 
=))  $
medicalHistoryRepository))! 9
.))9 :
Get)): =
())= >
medicalHistoryId))> N
)))N O
;))O P
if** 
(** 
medicalHistory** 
==** !
null**" &
)**& '
{++ 
return,, 
NotFound,, 
(,,  
),,  !
;,,! "
}-- 
var// 
pet// 
=// 
petRepository// #
.//# $
Get//$ '
(//' (
appointmentDto//( 6
.//6 7
PetId//7 <
)//< =
;//= >
if00 
(00 
pet00 
==00 
null00 
)00 
{11 
return22 
NotFound22 
(22  
)22  !
;22! "
}33 
var55 
vet55 
=55 
vetRepository55 #
.55# $
Get55$ '
(55' (
appointmentDto55( 6
.556 7
VetId557 <
)55< =
;55= >
if66 
(66 
vet66 
==66 
null66 
)66 
{77 
return88 
NotFound88 
(88  
)88  !
;88! "
}99 
var;; 
appointment;; 
=;; 
Appointment;; )
.;;) *
SettleAppointment;;* ;
(;;; <
vet;;< ?
,;;? @
pet;;A D
,;;D E
appointmentDto;;F T
.;;T U
ScheduledDate;;U b
,;;b c
appointmentDto;;d r
.;;r s'
EstimatedDurationInMinutes	;;s �
)
;;� �
;
;;� �
if<< 
(<< 
appointment<< 
.<< 
	IsFailure<< %
)<<% &
{== 
return>> 

BadRequest>> !
(>>! "
appointment>>" -
.>>- .
Error>>. 3
)>>3 4
;>>4 5
}?? 
varAA 
resultAA 
=AA 
medicalHistoryAA '
.AA' ((
RegisterAppointmentToHistoryAA( D
(AAD E
appointmentAAE P
.AAP Q
EntityAAQ W
)AAW X
;AAX Y
ifBB 
(BB 
resultBB 
.BB 
	IsFailureBB  
)BB  !
{CC 
returnDD 

BadRequestDD !
(DD! "
resultDD" (
.DD( )
ErrorDD) .
)DD. /
;DD/ 0
}EE !
appointmentRepositoryGG !
.GG! "
AddGG" %
(GG% &
appointmentGG& 1
.GG1 2
EntityGG2 8
)GG8 9
;GG9 :!
appointmentRepositoryHH !
.HH! "
SaveChangesHH" -
(HH- .
)HH. /
;HH/ 0
returnJJ 
OkJJ 
(JJ 
)JJ 
;JJ 
}KK 	
}rr 
}ss �G
VD:\.NET\VetAppointment - Working\VetAppointment.API\Controllers\PetOwnersController.cs
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
.. /
All/ 2
(2 3
)3 4
.4 5
Select5 ;
(; <
owner< A
=>B D
newE H
PetOwnerDtoI T
{ 
Id 
= 
owner 
. 
Id 
, 
Name 
= 
owner 
. 
Name !
,! "
Surname 
= 
owner 
.  
Surname  '
,' (
	Birthdate 
= 
owner !
.! "
	Birthdate" +
.+ ,
ToString, 4
(4 5
)5 6
,6 7
Gender 
= 
owner 
. 
Gender %
.% &
ToString& .
(. /
)/ 0
,0 1
Address   
=   
owner   
.    
Address    '
,  ' (
Email!! 
=!! 
owner!! 
.!! 
Email!! #
,!!# $
Phone"" 
="" 
owner"" 
."" 
Phone"" #
}## 
)## 
;## 
return%% 
Ok%% 
(%% 
	petOwners%% 
)%%  
;%%  !
}&& 	
[(( 	
HttpPost((	 
](( 
public)) 
IActionResult)) 
Create)) #
())# $
[))$ %
FromBody))% -
]))- .
CreatePetOwnerDto))/ @
petOwnerDto))A L
)))L M
{** 	
var++ 
petOwner++ 
=++ 
PetOwner++ #
.++# $
Create++$ *
(+++ ,
petOwnerDto,, 
.,,  
Name,,  $
,,,$ %
petOwnerDto-- 
.--  
Surname--  '
,--' (
petOwnerDto.. 
...  
	Birthdate..  )
,..) *
petOwnerDto// 
.//  
Gender//  &
,//& '
petOwnerDto00 
.00  
Address00  '
,00' (
petOwnerDto11 
.11  
Email11  %
,11% &
petOwnerDto22 
.22  
Phone22  %
)33 
;33 
if55 
(55 
petOwner55 
.55 
	IsFailure55 "
)55" #
{66 
return77 

BadRequest77 !
(77! "
petOwner77" *
.77* +
Error77+ 0
)770 1
;771 2
}88 
petOwnerRepository:: 
.:: 
Add:: "
(::" #
petOwner::# +
.::+ ,
Entity::, 2
)::2 3
;::3 4
petOwnerRepository;; 
.;; 
SaveChanges;; *
(;;* +
);;+ ,
;;;, -
var== 
createdPetOwner== 
===  !
new==" %
PetOwnerDto==& 1
(==1 2
)==2 3
{>> 
Name?? 
=?? 
petOwner?? 
.??  
Entity??  &
.??& '
Name??' +
,??+ ,
Surname@@ 
=@@ 
petOwner@@ "
.@@" #
Entity@@# )
.@@) *
Surname@@* 1
,@@1 2
AddressAA 
=AA 
petOwnerAA "
.AA" #
EntityAA# )
.AA) *
AddressAA* 1
,AA1 2
	BirthdateBB 
=BB 
petOwnerBB $
.BB$ %
EntityBB% +
.BB+ ,
	BirthdateBB, 5
.BB5 6
ToStringBB6 >
(BB> ?
)BB? @
,BB@ A
EmailCC 
=CC 
petOwnerCC  
.CC  !
EntityCC! '
.CC' (
EmailCC( -
,CC- .
GenderDD 
=DD 
petOwnerDD !
.DD! "
EntityDD" (
.DD( )
GenderDD) /
.DD/ 0
ToStringDD0 8
(DD8 9
)DD9 :
,DD: ;
PhoneEE 
=EE 
petOwnerEE  
.EE  !
EntityEE! '
.EE' (
PhoneEE( -
,EE- .
IdFF 
=FF 
petOwnerFF 
.FF 
EntityFF $
.FF$ %
IdFF% '
}GG 
;GG 
returnII 
CreatedII 
(II 
nameofII !
(II! "
GetII" %
)II% &
,II& '
createdPetOwnerII( 7
)II7 8
;II8 9
}KK 	
[MM 	
HttpPostMM	 
(MM 
$strMM (
)MM( )
]MM) *
publicNN 
IActionResultNN 
RegisterPetsToOwnerNN 0
(NN0 1
GuidNN1 5
ownerIdNN6 =
,NN= >
[NN? @
FromBodyNN@ H
]NNH I
ListNNJ N
<NNN O
PetDtoNNO U
>NNU V
petsDtosNNW _
)NN_ `
{OO 	
varPP 
ownerPP 
=PP 
petOwnerRepositoryPP *
.PP* +
GetPP+ .
(PP. /
ownerIdPP/ 6
)PP6 7
;PP7 8
ifQQ 
(QQ 
ownerQQ 
==QQ 
nullQQ 
)QQ 
{RR 
returnSS 
NotFoundSS 
(SS  
)SS  !
;SS! "
}TT 
varVV 
petsVV 
=VV 
petsDtosVV 
.VV  
SelectVV  &
(VV& '
pVV' (
=>VV) +
PetVV, /
.VV/ 0
CreateVV0 6
(VV6 7
pVV7 8
.VV8 9
NameVV9 =
,VV= >
pVV? @
.VV@ A
	BirthdateVVA J
,VVJ K
pVVL M
.VVM N
RaceVVN R
,VVR S
pVVT U
.VVU V
GenderVVV \
)VV\ ]
)VV] ^
.VV^ _
ToListVV_ e
(VVe f
)VVf g
;VVg h
ifWW 
(WW 
petsWW 
.WW 
AnyWW 
(WW 
pWW 
=>WW 
pWW 
.WW 
	IsFailureWW (
)WW( )
)WW) *
{XX 
returnYY 

BadRequestYY !
(YY! "
)YY" #
;YY# $
}[[ 
var]] 
result]] 
=]] 
owner]] 
.]] 
RegisterPetsToOwner]] 2
(]]2 3
pets]]3 7
.]]7 8
Select]]8 >
(]]> ?
p]]? @
=>]]A C
p]]D E
.]]E F
Entity]]F L
)]]L M
.]]M N
ToList]]N T
(]]T U
)]]U V
)]]V W
;]]W X
if__ 
(__ 
result__ 
.__ 
	IsFailure__  
)__  !
{`` 
returnaa 

BadRequestaa !
(aa! "
resultaa" (
.aa( )
Erroraa) .
)aa. /
;aa/ 0
}bb 
petsdd 
.dd 
ForEachdd 
(dd 
pdd 
=>dd 
petRepositorydd +
.dd+ ,
Adddd, /
(dd/ 0
pdd0 1
.dd1 2
Entitydd2 8
)dd8 9
)dd9 :
;dd: ;
petOwnerRepositoryee 
.ee 
SaveChangesee *
(ee* +
)ee+ ,
;ee, -
returngg 
Createdgg 
(gg 
nameofgg !
(gg! "
Getgg" %
)gg% &
,gg& '
ownergg( -
)gg- .
;gg. /
}hh 	
}ii 
}jj �
QD:\.NET\VetAppointment - Working\VetAppointment.API\Controllers\PetsController.cs
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
( 
IRepository *
<* +
Pet+ .
>. /
petRepository0 =
)= >
{ 	
this 
. 
petRepository 
=  
petRepository! .
;. /
} 	
[ 	
HttpGet	 
] 
public 
IActionResult 
Get  
(  !
)! "
{ 	
var 
pets 
= 
petRepository $
.$ %
All% (
(( )
)) *
.* +
Select+ 1
( 
p 
=> 
new 
PetDto #
{ 
Id 
= 
p 
. 
Id  
,  !
Name 
= 
p  
.  !
Name! %
,% &
	Birthdate !
=" #
p$ %
.% &
	Birthdate& /
./ 0
ToString0 8
(8 9
)9 :
,: ;
Race 
= 
p  
.  !
Race! %
.% &
ToString& .
(. /
)/ 0
,0 1
Gender 
=  
p! "
." #
Gender# )
.) *
ToString* 2
(2 3
)3 4
} 
)   
;   
return"" 
Ok"" 
("" 
pets"" 
)"" 
;"" 
}## 	
[%% 	
HttpPost%%	 
]%% 
public&& 
IActionResult&& 
Create&& #
(&&# $
[&&$ %
FromBody&&% -
]&&- .
PetDto&&/ 5
petDto&&6 <
)&&< =
{'' 	
var(( 
pet(( 
=(( 
Pet(( 
.(( 
Create((  
(((  !
petDto)) 
.)) 
Name)) 
,))  
petDto** 
.** 
	Birthdate** $
,**$ %
petDto++ 
.++ 
Race++ 
,++  
petDto,, 
.,, 
Gender,, !
)-- 
;-- 
if// 
(// 
pet// 
.// 
	IsFailure// 
)// 
{00 
return11 

BadRequest11 !
(11! "
pet11" %
.11% &
Error11& +
)11+ ,
;11, -
}22 
petRepository44 
.44 
Add44 
(44 
pet44 !
.44! "
Entity44" (
)44( )
;44) *
petRepository55 
.55 
SaveChanges55 %
(55% &
)55& '
;55' (
return77 
Created77 
(77 
nameof77 !
(77! "
Get77" %
)77% &
,77& '
pet77( +
.77+ ,
Entity77, 2
)772 3
;773 4
}88 	
}99 
}:: �
\D:\.NET\VetAppointment - Working\VetAppointment.API\Controllers\PrescribedDrugsController.cs
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
 %
PrescribedDrugsController

 *
:

+ ,
ControllerBase

- ;
{ 
private 
readonly 
IRepository $
<$ %
PrescribedDrug% 3
>3 4$
prescribedDrugRepository5 M
;M N
private 
readonly 
IRepository $
<$ %
Drug% )
>) *
drugRepository+ 9
;9 :
public %
PrescribedDrugsController (
(( )
IRepository) 4
<4 5
PrescribedDrug5 C
>C D$
prescribedDrugRepositoryE ]
,] ^
IRepository 
< 
Drug 
> 
drugRepository ,
), -
{ 	
this 
. $
prescribedDrugRepository )
=* +$
prescribedDrugRepository, D
;D E
this 
. 
drugRepository 
=  !
drugRepository" 0
;0 1
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
var 
drugs 
= $
prescribedDrugRepository 0
.0 1
All1 4
(4 5
)5 6
.6 7
Select7 =
( 
d 
=> 
new 
PrescribedDrugDto .
{ 
Quantity  
=! "
d# $
.$ %
Quantity% -
,- .
DrugId 
=  
d! "
." #
DrugToPrescribeId# 4
,4 5
	TotalCost !
=" #
d$ %
.% &
	TotalCost& /
}   
)!! 
;!! 
return## 
Ok## 
(## 
drugs## 
)## 
;## 
}$$ 	
[&& 	
HttpPost&&	 
]&& 
public'' 
IActionResult'' 
Create'' #
(''# $
[''$ %
FromBody''% -
]''- .
PrescribedDrugDto''/ @
drugDto''A H
)''H I
{(( 	
var)) 
baseDrug)) 
=)) 
drugRepository)) )
.))) *
Get))* -
())- .
drugDto)). 5
.))5 6
DrugId))6 <
)))< =
;))= >
var** 
drug** 
=** 
PrescribedDrug** %
.**% &
Create**& ,
(**, -
drugDto++ 
.++ 
Quantity++ $
,++$ %
baseDrug,, 
)-- 
;-- 
if// 
(// 
drug// 
.// 
	IsFailure// 
)// 
{00 
return11 

BadRequest11 !
(11! "
drug11" &
.11& '
Error11' ,
)11, -
;11- .
}22 $
prescribedDrugRepository44 $
.44$ %
Add44% (
(44( )
drug44) -
.44- .
Entity44. 4
)444 5
;445 6$
prescribedDrugRepository55 $
.55$ %
SaveChanges55% 0
(550 1
)551 2
;552 3
return77 
Created77 
(77 
nameof77 !
(77! "
Get77" %
)77% &
,77& '
drug77( ,
.77, -
Entity77- 3
)773 4
;774 5
}88 	
}99 
}:: �q
WD:\.NET\VetAppointment - Working\VetAppointment.API\Controllers\TreatmentsController.cs
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
TreatmentsController %
:& '
ControllerBase( 6
{ 
private 
readonly 
IRepository $
<$ %
	Treatment% .
>. /
treatmentRepository0 C
;C D
private 
readonly 
IRepository $
<$ %
PrescribedDrug% 3
>3 4$
prescribedDrugRepository5 M
;M N
private 
readonly 
IRepository $
<$ %
Drug% )
>) *
drugRepository+ 9
;9 :
public  
TreatmentsController #
(# $
IRepository$ /
</ 0
	Treatment0 9
>9 :
treatmentRepository; N
,N O
IRepository 
< 
PrescribedDrug &
>& '$
prescribedDrugRepository( @
,@ A
IRepositoryB M
<M N
DrugN R
>R S
drugRepositoryT b
)b c
{ 	
this 
. 
treatmentRepository $
=% &
treatmentRepository' :
;: ;
this 
. $
prescribedDrugRepository )
=* +$
prescribedDrugRepository, D
;D E
this 
. 
drugRepository 
=  !
drugRepository" 0
;0 1
} 	
[ 	
HttpGet	 
] 
public 
IActionResult 
Get  
(  !
)! "
{ 	
var 

treatments 
= 
treatmentRepository 0
.0 1
All1 4
(4 5
)5 6
.6 7
Select7 =
( 
treat 
=> 
new  
TreatmentDto! -
{ 
Id   
=   
treat   "
.  " #
Id  # %
,  % &
Description!! #
=!!$ %
treat!!& +
.!!+ ,
Description!!, 7
}"" 
)## 
;## 
return%% 
Ok%% 
(%% 

treatments%%  
)%%  !
;%%! "
}&& 	
[(( 	
HttpPost((	 
](( 
public)) 
IActionResult)) 
Create)) #
())# $
[))$ %
FromBody))% -
]))- .
CreateTreatmentDto))/ A
treatmentDto))B N
)))N O
{** 	
var++ 
treat++ 
=++ 
	Treatment++ !
.++! "
Create++" (
(++( )
treatmentDto,,  
.,,  !
Description,,! ,
)-- 
;-- 
if// 
(// 
treat// 
.// 
	IsFailure// 
)//  
{00 
return11 

BadRequest11 !
(11! "
treat11" '
.11' (
Error11( -
)11- .
;11. /
}22 
treatmentRepository44 
.44  
Add44  #
(44# $
treat44$ )
.44) *
Entity44* 0
)440 1
;441 2
treatmentRepository55 
.55  
SaveChanges55  +
(55+ ,
)55, -
;55- .
return77 
Created77 
(77 
nameof77 !
(77! "
Get77" %
)77% &
,77& '
treat77( -
)77- .
;77. /
}88 	
[:: 	
HttpPost::	 
(:: 
$str:: +
)::+ ,
]::, -
public;; 
IActionResult;; 
AddDrugsToTreatment;; 0
(;;0 1
Guid;;1 5
treatmentId;;6 A
,;;A B
[;;C D
FromBody;;D L
];;L M
List;;N R
<;;R S
PrescribedDrugDto;;S d
>;;d e
drugDtos;;f n
);;n o
{<< 	
var== 
	treatment== 
=== 
treatmentRepository== /
.==/ 0
Get==0 3
(==3 4
treatmentId==4 ?
)==? @
;==@ A
if>> 
(>> 
	treatment>> 
==>> 
null>> !
)>>! "
{?? 
return@@ 
NotFound@@ 
(@@  
)@@  !
;@@! "
}AA 
varCC 
drugsCC 
=CC 
drugDtosCC  
.CC  !
SelectCC! '
(CC' (
dCC( )
=>CC* ,
PrescribedDrugCC- ;
.CC; <
CreateCC< B
(CCB C
dCCC D
.CCD E
QuantityCCE M
,CCM N
drugRepositoryCCO ]
.CC] ^
GetCC^ a
(CCa b
dCCb c
.CCc d
DrugIdCCd j
)CCj k
)CCk l
)CCl m
.CCm n
ToListCCn t
(CCt u
)CCu v
;CCv w
ifDD 
(DD 
drugsDD 
.DD 
AnyDD 
(DD 
pDD 
=>DD 
pDD  
.DD  !
	IsFailureDD! *
)DD* +
)DD+ ,
{EE 
returnFF 

BadRequestFF !
(FF! "
)FF" #
;FF# $
}GG 
varII 
resultII 
=II 
	treatmentII "
.II" #"
AppendDrugsToTreatmentII# 9
(II9 :
drugsII: ?
.II? @
SelectII@ F
(IIF G
dIIG H
=>III K
dIIL M
.IIM N
EntityIIN T
)IIT U
.IIU V
ToListIIV \
(II\ ]
)II] ^
)II^ _
;II_ `
ifJJ 
(JJ 
resultJJ 
.JJ 
	IsFailureJJ  
)JJ  !
{KK 
returnLL 

BadRequestLL !
(LL! "
resultLL" (
.LL( )
ErrorLL) .
)LL. /
;LL/ 0
}MM 
drugsOO 
.OO 
ForEachOO 
(OO 
dOO 
=>OO $
prescribedDrugRepositoryOO 7
.OO7 8
AddOO8 ;
(OO; <
dOO< =
.OO= >
EntityOO> D
)OOD E
)OOE F
;OOF G
drugRepositoryPP 
.PP 
SaveChangesPP &
(PP& '
)PP' (
;PP( )
returnRR 
	NoContentRR 
(RR 
)RR 
;RR 
}SS 	
[UU 	
HttpPutUU	 
(UU 
$strUU %
)UU% &
]UU& '
publicVV 
IActionResultVV 
UpdateTreatmentVV ,
(VV, -
GuidVV- 1
treatmentIdVV2 =
,VV= >
[VV? @
FromBodyVV@ H
]VVH I
CreateTreatmentDtoVVJ \
treatmentDtoVV] i
)VVi j
{WW 	
varXX 
	treatmentXX 
=XX 
treatmentRepositoryXX /
.XX/ 0
GetXX0 3
(XX3 4
treatmentIdXX4 ?
)XX? @
;XX@ A
ifYY 
(YY 
	treatmentYY 
==YY 
nullYY !
)YY! "
{ZZ 
return[[ 
NotFound[[ 
([[  
)[[  !
;[[! "
}\\ 
var__ 
result__ 
=__ 
	treatment__ "
.__" #
UpdateDescription__# 4
(__4 5
treatmentDto__5 A
.__A B
Description__B M
)__M N
;__N O
if`` 
(`` 
result`` 
.`` 
	IsFailure``  
)``  !
{aa 
returnbb 

BadRequestbb !
(bb! "
resultbb" (
.bb( )
Errorbb) .
)bb. /
;bb/ 0
}cc 
treatmentRepositoryee 
.ee  
Updateee  &
(ee& '
	treatmentee' 0
)ee0 1
;ee1 2
treatmentRepositoryff 
.ff  
SaveChangesff  +
(ff+ ,
)ff, -
;ff- .
returnhh 
	NoContenthh 
(hh 
)hh 
;hh 
}ii 	
[kk 	
HttpPutkk	 
(kk 
$strkk 8
)kk8 9
]kk9 :
publicll 
IActionResultll !
UpdateDrugInTreatmentll 2
(ll2 3
Guidll3 7
treatmentIdll8 C
,llC D
GuidllE I
drugIdllJ P
,llP Q
[llR S
FromBodyllS [
]ll[ \
PrescribedDrugDtoll] n
drugDtollo v
)llv w
{mm 	
varnn 
	treatmentnn 
=nn 
treatmentRepositorynn /
.nn/ 0
Getnn0 3
(nn3 4
treatmentIdnn4 ?
)nn? @
;nn@ A
ifoo 
(oo 
	treatmentoo 
==oo 
nulloo !
)oo! "
{pp 
returnqq 
NotFoundqq 
(qq  
)qq  !
;qq! "
}rr 
vartt 
drugPrescribedtt 
=tt  $
prescribedDrugRepositorytt! 9
.tt9 :
Gettt: =
(tt= >
drugIdtt> D
)ttD E
;ttE F
ifuu 
(uu 
drugPrescribeduu 
==uu !
nulluu" &
)uu& '
{vv 
returnww 
NotFoundww 
(ww  
)ww  !
;ww! "
}xx 
varzz 
drugzz 
=zz 
drugRepositoryzz %
.zz% &
Getzz& )
(zz) *
drugDtozz* 1
.zz1 2
DrugIdzz2 8
)zz8 9
;zz9 :
if{{ 
({{ 
drug{{ 
=={{ 
null{{ 
){{ 
{|| 
return}} 
NotFound}} 
(}}  
)}}  !
;}}! "
}~~ 
var
�� 
result
�� 
=
�� 
drugPrescribed
�� '
.
��' (
Update
��( .
(
��. /
drugDto
��/ 6
.
��6 7
Quantity
��7 ?
,
��? @
drug
��A E
)
��E F
;
��F G
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
�� &
prescribedDrugRepository
�� $
.
��$ %
Update
��% +
(
��+ ,
drugPrescribed
��, :
)
��: ;
;
��; <&
prescribedDrugRepository
�� $
.
��$ %
SaveChanges
��% 0
(
��0 1
)
��1 2
;
��2 3
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
�� ;
)
��; <
]
��< =
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
�� !
treatmentRepository
�� /
.
��/ 0
Get
��0 3
(
��3 4
treatmentId
��4 ?
)
��? @
;
��@ A
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
�� &
prescribedDrugRepository
�� /
.
��/ 0
Get
��0 3
(
��3 4
prescribedDrugId
��4 D
)
��D E
;
��E F
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
�� &
prescribedDrugRepository
�� $
.
��$ %
Delete
��% +
(
��+ ,
drug
��, 0
)
��0 1
;
��1 2&
prescribedDrugRepository
�� $
.
��$ %
SaveChanges
��% 0
(
��0 1
)
��1 2
;
��2 3
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
�� !
treatmentRepository
�� /
.
��/ 0
Get
��0 3
(
��3 4
treatmentId
��4 ?
)
��? @
;
��@ A
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
�� !
treatmentRepository
�� 
.
��  
Delete
��  &
(
��& '
	treatment
��' 0
)
��0 1
;
��1 2!
treatmentRepository
�� 
.
��  
SaveChanges
��  +
(
��+ ,
)
��, -
;
��- .
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
}�� ը
WD:\.NET\VetAppointment - Working\VetAppointment.API\Controllers\VetClinicsController.cs
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
IRepository $
<$ %
	VetClinic% .
>. /
vetClinicRepository0 C
;C D
private 
readonly 
IRepository $
<$ %
Pet% (
>( )
petRepository* 7
;7 8
private 
readonly 
IRepository $
<$ %
Vet% (
>( )
vetRepository* 7
;7 8
private 
readonly 
IRepository $
<$ %
Appointment% 0
>0 1!
appointmentRepository2 G
;G H
private 
readonly 
IRepository $
<$ %
MedicalHistory% 3
>3 4$
medicalHistoryRepository5 M
;M N
public  
VetClinicsController #
(# $
IRepository$ /
</ 0
	VetClinic0 9
>9 :
vetClinicRepository; N
,N O
IRepositoryP [
<[ \
Pet\ _
>_ `
petRepositorya n
,n o
IRepository 
< 
Vet 
> 
vetRepository *
,* +
IRepository, 7
<7 8
Appointment8 C
>C D!
appointmentRepositoryE Z
,Z [
IRepository 
< 
MedicalHistory &
>& '$
medicalHistoryRepository( @
)@ A
{ 	
this 
. 
vetClinicRepository $
=% &
vetClinicRepository' :
;: ;
this 
. 
petRepository 
=  
petRepository! .
;. /
this 
. 
vetRepository 
=  
vetRepository! .
;. /
this 
. !
appointmentRepository &
=' (!
appointmentRepository) >
;> ?
this 
. $
medicalHistoryRepository )
=* +$
medicalHistoryRepository, D
;D E
} 	
[ 	
HttpPost	 
] 
public   
IActionResult   
Create   #
(  # $
[  $ %
FromBody  % -
]  - .
CreateVetClinicDto  / A
vetClinicDto  B N
)  N O
{!! 	
var"" 
history"" 
="" 
MedicalHistory"" (
.""( )
Create"") /
(""/ 0
)""0 1
;""1 2
var## 
	vetClinic## 
=## 
	VetClinic## %
.##% &
Create##& ,
(##, -
vetClinicDto$$  
.$$  !
Name$$! %
,$$% &
vetClinicDto%%  
.%%  !
Address%%! (
,%%( )
vetClinicDto&&  
.&&  !
NumberOfPlaces&&! /
,&&/ 0
vetClinicDto''  
.''  !
ContactEmail''! -
,''- .
vetClinicDto((  
.((  !
ContactPhone((! -
))) 
;)) 
if++ 
(++ 
	vetClinic++ 
==++ 
null++ !
)++! "
{,, 
return-- 

BadRequest-- !
(--! "
)--" #
;--# $
}.. 
history00 
.00 
Entity00 
.00 
AtachToClinic00 (
(00( )
	vetClinic00) 2
.002 3
Entity003 9
.009 :
Id00: <
)00< =
;00= >
	vetClinic11 
.11 
Entity11 
.11  
AttachMedicalHistory11 1
(111 2
history112 9
.119 :
Entity11: @
.11@ A
Id11A C
)11C D
;11D E
if33 
(33 
	vetClinic33 
.33 
	IsFailure33 #
)33# $
{44 
return55 

BadRequest55 !
(55! "
	vetClinic55" +
.55+ ,
Error55, 1
)551 2
;552 3
}66 
var99 

fullClinic99 
=99 
new99  
VetClinicDto99! -
{:: 
Id;; 
=;; 
	vetClinic;; 
.;; 
Entity;; %
.;;% &
Id;;& (
,;;( )
Name<< 
=<< 
	vetClinic<<  
.<<  !
Entity<<! '
.<<' (
Name<<( ,
,<<, -
Address== 
=== 
	vetClinic== #
.==# $
Entity==$ *
.==* +
Address==+ 2
,==2 3
NumberOfPlaces>> 
=>>  
	vetClinic>>! *
.>>* +
Entity>>+ 1
.>>1 2
NumberOfPlaces>>2 @
,>>@ A
ContactEmail?? 
=?? 
	vetClinic?? (
.??( )
Entity??) /
.??/ 0
ContactEmail??0 <
,??< =
ContactPhone@@ 
=@@ 
	vetClinic@@ (
.@@( )
Entity@@) /
.@@/ 0
ContactPhone@@0 <
,@@< =
RegistrationDateAA  
=AA! "
	vetClinicAA# ,
.AA, -
EntityAA- 3
.AA3 4
RegistrationDateAA4 D
,AAD E
MedicalHistoryIdBB  
=BB! "
historyBB# *
.BB* +
EntityBB+ 1
.BB1 2
IdBB2 4
}CC 
;CC $
medicalHistoryRepositoryEE $
.EE$ %
AddEE% (
(EE( )
historyEE) 0
.EE0 1
EntityEE1 7
)EE7 8
;EE8 9$
medicalHistoryRepositoryFF $
.FF$ %
SaveChangesFF% 0
(FF0 1
)FF1 2
;FF2 3
vetClinicRepositoryGG 
.GG  
AddGG  #
(GG# $
	vetClinicGG$ -
.GG- .
EntityGG. 4
)GG4 5
;GG5 6
vetClinicRepositoryHH 
.HH  
SaveChangesHH  +
(HH+ ,
)HH, -
;HH- .
returnJJ 
CreatedJJ 
(JJ 
nameofJJ !
(JJ! "
GetAllVetClinicsJJ" 2
)JJ2 3
,JJ3 4

fullClinicJJ5 ?
)JJ? @
;JJ@ A
}KK 	
[NN 	
HttpGetNN	 
]NN 
publicOO 
IActionResultOO 
GetAllVetClinicsOO -
(OO- .
)OO. /
{PP 	
varQQ 

vetClinicsQQ 
=QQ 
vetClinicRepositoryQQ 0
.QQ0 1
AllQQ1 4
(QQ4 5
)QQ5 6
.QQ6 7
SelectQQ7 =
(QQ= >
vetQQ> A
=>QQB D
newQQE H
VetClinicDtoQQI U
(QQU V
)QQV W
{RR 
IdSS 
=SS 
vetSS 
.SS 
IdSS 
,SS 
NameTT 
=TT 
vetTT 
.TT 
NameTT 
,TT  
AddressUU 
=UU 
vetUU 
.UU 
AddressUU %
,UU% &
NumberOfPlacesVV 
=VV  
vetVV! $
.VV$ %
NumberOfPlacesVV% 3
,VV3 4
ContactEmailWW 
=WW 
vetWW "
.WW" #
ContactEmailWW# /
,WW/ 0
ContactPhoneXX 
=XX 
vetXX "
.XX" #
ContactPhoneXX# /
,XX/ 0
RegistrationDateYY  
=YY! "
vetYY# &
.YY& '
RegistrationDateYY' 7
,YY7 8
MedicalHistoryIdZZ  
=ZZ! "
vetZZ# &
.ZZ& '
MedicalHistoryIdZZ' 7
}[[ 
)[[ 
;[[ 
return\\ 
Ok\\ 
(\\ 

vetClinics\\  
)\\  !
;\\! "
}]] 	
[__ 	
HttpGet__	 
(__ 
$str__ %
)__% &
]__& '
public`` 
IActionResult`` 
GetById`` $
(``$ %
Guid``% )
vetClinicId``* 5
)``5 6
{aa 	
varbb 
clinicbb 
=bb 
vetClinicRepositorybb ,
.bb, -
Getbb- 0
(bb0 1
vetClinicIdbb1 <
)bb< =
;bb= >
ifcc 
(cc 
cliniccc 
==cc 
nullcc 
)cc 
{dd 
returnee 
NotFoundee 
(ee  
)ee  !
;ee! "
}ff 
returngg 
Okgg 
(gg 
clinicgg 
)gg 
;gg 
}hh 	
[jj 	
HttpGetjj	 
(jj 
$strjj *
)jj* +
]jj+ ,
publickk 
IActionResultkk 
GetVetsByClinicIdkk .
(kk. /
Guidkk/ 3
vetClinicIdkk4 ?
)kk? @
{ll 	
varmm 
clinicmm 
=mm 
vetClinicRepositorymm ,
.mm, -
Getmm- 0
(mm0 1
vetClinicIdmm1 <
)mm< =
;mm= >
ifnn 
(nn 
clinicnn 
==nn 
nullnn 
)nn 
{oo 
returnpp 
NotFoundpp 
(pp  
)pp  !
;pp! "
}qq 
varss 
vetsss 
=ss 
clinicss 
.ss 
Vetsss "
.ss" #
Selectss# )
(ss) *
vetss* -
=>ss. 0
newss1 4
VetDtoss5 ;
(ss; <
)ss< =
{tt 
Iduu 
=uu 
vetuu 
.uu 
Iduu 
,uu 
Namevv 
=vv 
vetvv 
.vv 
Namevv 
,vv  
Surnameww 
=ww 
vetww 
.ww 
Surnameww %
,ww% &
	Birthdatexx 
=xx 
vetxx 
.xx  
	Birthdatexx  )
.xx) *
ToStringxx* 2
(xx2 3
)xx3 4
,xx4 5
Specialisationyy 
=yy  
vetyy! $
.yy$ %
Specialisationyy% 3
.yy3 4
ToStringyy4 <
(yy< =
)yy= >
,yy> ?
Emailzz 
=zz 
vetzz 
.zz 
Emailzz !
,zz! "
Gender{{ 
={{ 
vet{{ 
.{{ 
Gender{{ #
.{{# $
ToString{{$ ,
({{, -
){{- .
,{{. /
Phone|| 
=|| 
vet|| 
.|| 
Phone|| !
,||! "
}}} 
)}} 
;}} 
return 
Ok 
( 
vets 
) 
; 
}
�� 	
[
�� 	
HttpGet
��	 
(
�� 
$str
�� *
)
��* +
]
��+ ,
public
�� 
IActionResult
�� 
GetPetsByClinicId
�� .
(
��. /
Guid
��/ 3
vetClinicId
��4 ?
)
��? @
{
�� 	
var
�� 
clinic
�� 
=
�� !
vetClinicRepository
�� ,
.
��, -
Get
��- 0
(
��0 1
vetClinicId
��1 <
)
��< =
;
��= >
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
��" #
Select
��# )
(
��) *
pet
��* -
=>
��. 0
new
��1 4
PetDto
��5 ;
(
��; <
)
��< =
{
�� 
Id
�� 
=
�� 
pet
�� 
.
�� 
Id
�� 
,
�� 
Name
�� 
=
�� 
pet
�� 
.
�� 
Name
�� 
,
��  
	Birthdate
�� 
=
�� 
pet
�� 
.
��  
	Birthdate
��  )
.
��) *
ToString
��* 2
(
��2 3
)
��3 4
,
��4 5
Gender
�� 
=
�� 
pet
�� 
.
�� 
Gender
�� #
.
��# $
ToString
��$ ,
(
��, -
)
��- .
,
��. /
Race
�� 
=
�� 
pet
�� 
.
�� 
Race
�� 
.
��  
ToString
��  (
(
��( )
)
��) *
,
��* +
}
�� 
)
�� 
;
�� 
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
�� !
vetClinicRepository
�� ,
.
��, -
Get
��- 0
(
��0 1
vetClinicId
��1 <
)
��< =
;
��= >
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
��  &
medicalHistoryRepository
��! 9
.
��9 :
Get
��: =
(
��= >
clinic
��> D
.
��D E
MedicalHistoryId
��E U
)
��U V
;
��V W
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
��: ;
Select
��; A
(
��A B
appointment
��B M
=>
��N P
new
��Q T
AppointmentDto
��U c
(
��c d
)
��d e
{
�� 
Id
�� 
=
�� 
appointment
��  
.
��  !
Id
��! #
,
��# $(
EstimatedDurationInMinutes
�� *
=
��+ ,
appointment
��- 8
.
��8 9(
EstimatedDurationInMinutes
��9 S
,
��S T
PetId
�� 
=
�� 
appointment
�� #
.
��# $
PetId
��$ )
,
��) *
VetId
�� 
=
�� 
appointment
�� #
.
��# $
VetId
��$ )
,
��) *
ScheduledDate
�� 
=
�� 
appointment
��  +
.
��+ ,
ScheduledDate
��, 9
,
��9 :
TreatmentId
�� 
=
�� 
appointment
�� )
.
��) *
TreatmentId
��* 5
}
�� 
)
�� 
;
�� 
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
��Q R
PetDto
��R X
>
��X Y
petsDtos
��Z b
)
��b c
{
�� 	
var
�� 
clinic
�� 
=
�� !
vetClinicRepository
�� ,
.
��, -
Get
��- 0
(
��0 1
vetClinicId
��1 <
)
��< =
;
��= >
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
�� 
petRepository
�� +
.
��+ ,
Add
��, /
(
��/ 0
p
��0 1
.
��1 2
Entity
��2 8
)
��8 9
)
��9 :
;
��: ;
petRepository
�� 
.
�� 
SaveChanges
�� %
(
��% &
)
��& '
;
��' (
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
GetAllVetClinics
��" 2
)
��2 3
,
��3 4
pets
��5 9
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
��D E
VetDto
��F L
vetDto
��M S
)
��S T
{
�� 	
var
�� 
clinic
�� 
=
�� !
vetClinicRepository
�� ,
.
��, -
Get
��- 0
(
��0 1
vetClinicId
��1 <
)
��< =
;
��= >
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
��p v
.
��v w
Phone
��w |
,
��| }
vetDto��~ �
.��� �
Specialisation��� �
)��� �
;��� �
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
�� !
vetClinicRepository
�� 
.
��  
Update
��  &
(
��& '
clinic
��' -
)
��- .
;
��. /
vetRepository
�� 
.
�� 
Add
�� 
(
�� 
doctor
�� $
.
��$ %
Entity
��% +
)
��+ ,
;
��, -
vetRepository
�� 
.
�� 
SaveChanges
�� %
(
��% &
)
��& '
;
��' (
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
�� 	
HttpPut
��	 
(
�� 
$str
�� %
)
��% &
]
��& '
public
�� 
IActionResult
�� 
Update
�� #
(
��# $
Guid
��$ (
vetClinicId
��) 4
,
��4 5
[
��6 7
FromBody
��7 ?
]
��? @
VetClinicDto
��A M
vetClinicDto
��N Z
)
��Z [
{
�� 	
if
�� 
(
�� 
vetClinicDto
�� 
==
�� 
null
��  $
)
��$ %
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
clinic
�� 
=
�� !
vetClinicRepository
�� ,
.
��, -
Get
��- 0
(
��0 1
vetClinicId
��1 <
)
��< =
;
��= >
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
��m y
.
��y z
ContactEmail��z �
,��� �
vetClinicDto��� �
.��� �
ContactPhone��� �
)��� �
;��� �
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
�� !
vetClinicRepository
�� 
.
��  
Update
��  &
(
��& '
result
��' -
.
��- .
Entity
��. 4
)
��4 5
;
��5 6!
vetClinicRepository
�� 
.
��  
SaveChanges
��  +
(
��+ ,
)
��, -
;
��- .
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
�� !
vetClinicRepository
�� ,
.
��, -
Get
��- 0
(
��0 1
vetClinicId
��1 <
)
��< =
;
��= >
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
�� 
vetRepository
�� #
.
��# $
Get
��$ '
(
��' (
vetId
��( -
)
��- .
;
��. /
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
��p v
.
��v w
Phone
��w |
,
��| }
vetDto��~ �
.��� �
Specialisation��� �
)��� �
;��� �
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
�� 
vetRepository
�� 
.
�� 
Update
��  
(
��  !
vet
��! $
)
��$ %
;
��% &
vetRepository
�� 
.
�� 
SaveChanges
�� %
(
��% &
)
��& '
;
��' (
var
�� 
	createVet
�� 
=
�� 
new
�� 
VetDto
��  &
(
��& '
)
��' (
{
�� 
Name
�� 
=
�� 
vet
�� 
.
�� 
Name
�� 
,
��  
Surname
�� 
=
�� 
vet
�� 
.
�� 
Surname
�� %
,
��% &
Specialisation
�� 
=
��  
vet
��! $
.
��$ %
Specialisation
��% 3
.
��3 4
ToString
��4 <
(
��< =
)
��= >
,
��> ?
	Birthdate
�� 
=
�� 
vet
�� 
.
��  
	Birthdate
��  )
.
��) *
ToString
��* 2
(
��2 3
)
��3 4
,
��4 5
Gender
�� 
=
�� 
vet
�� 
.
�� 
Gender
�� #
.
��# $
ToString
��$ ,
(
��, -
)
��- .
,
��. /
Email
�� 
=
�� 
vet
�� 
.
�� 
Email
�� !
,
��! "
Phone
�� 
=
�� 
vet
�� 
.
�� 
Phone
�� !
,
��! "
Id
�� 
=
�� 
vet
�� 
.
�� 
Id
�� 
,
�� 
}
�� 
;
�� 
return
�� 
Ok
�� 
(
�� 
	createVet
�� 
)
��  
;
��  !
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
�� !
vetClinicRepository
�� ,
.
��, -
Get
��- 0
(
��0 1
vetClinicId
��1 <
)
��< =
;
��= >
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
�� 
petRepository
�� #
.
��# $
Get
��$ '
(
��' (
petId
��( -
)
��- .
;
��. /
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
�� 
petRepository
�� 
.
�� 
Update
��  
(
��  !
pet
��! $
)
��$ %
;
��% &
petRepository
�� 
.
�� 
SaveChanges
�� %
(
��% &
)
��& '
;
��' (
var
�� 
	createPet
�� 
=
�� 
new
�� 
PetDto
��  &
(
��& '
)
��' (
{
�� 
Name
�� 
=
�� 
pet
�� 
.
�� 
Name
�� 
,
��  
	Birthdate
�� 
=
�� 
pet
�� 
.
��  
	Birthdate
��  )
.
��) *
ToString
��* 2
(
��2 3
)
��3 4
,
��4 5
Gender
�� 
=
�� 
pet
�� 
.
�� 
Gender
�� #
.
��# $
ToString
��$ ,
(
��, -
)
��- .
,
��. /
Race
�� 
=
�� 
pet
�� 
.
�� 
Race
�� 
.
��  
ToString
��  (
(
��( )
)
��) *
,
��* +
Id
�� 
=
�� 
pet
�� 
.
�� 
Id
�� 
}
�� 
;
�� 
return
�� 
Ok
�� 
(
�� 
	createPet
�� 
)
��  
;
��  !
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
�� 
IActionResult
�� 
Delete
�� #
(
��# $
Guid
��$ (
vetClinicId
��) 4
)
��4 5
{
�� 	
var
�� 
	vetClinic
�� 
=
�� !
vetClinicRepository
�� /
.
��/ 0
Get
��0 3
(
��3 4
vetClinicId
��4 ?
)
��? @
;
��@ A
if
�� 
(
�� 
	vetClinic
�� 
==
�� 
null
�� !
)
��! "
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
�� !
vetClinicRepository
�� 
.
��  
Delete
��  &
(
��& '
	vetClinic
��' 0
)
��0 1
;
��1 2!
vetClinicRepository
�� 
.
��  
SaveChanges
��  +
(
��+ ,
)
��, -
;
��- .
return
�� 
Ok
�� 
(
�� 
)
�� 
;
�� 
}
�� 	
[
�� 	

HttpDelete
��	 
(
�� 
$str
�� 9
)
��9 :
]
��: ;
public
�� 
IActionResult
�� 
	DeleteVet
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
)
��C D
{
�� 	
var
�� 
clinic
�� 
=
�� !
vetClinicRepository
�� ,
.
��, -
Get
��- 0
(
��0 1
vetClinicId
��1 <
)
��< =
;
��= >
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
�� 
vetRepository
�� #
.
��# $
Get
��$ '
(
��' (
vetId
��( -
)
��- .
;
��. /
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
�� 
vetRepository
�� 
.
�� 
Delete
��  
(
��  !
vet
��! $
)
��$ %
;
��% &
vetRepository
�� 
.
�� 
SaveChanges
�� %
(
��% &
)
��& '
;
��' (
return
�� 
Ok
�� 
(
�� 
)
�� 
;
�� 
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
�� !
vetClinicRepository
�� ,
.
��, -
Get
��- 0
(
��0 1
vetClinicId
��1 <
)
��< =
;
��= >
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
�� 
petRepository
�� #
.
��# $
Get
��$ '
(
��' (
petId
��( -
)
��- .
;
��. /
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
�� 
petRepository
�� 
.
�� 
Delete
��  
(
��  !
pet
��! $
)
��$ %
;
��% &
petRepository
�� 
.
�� 
SaveChanges
�� %
(
��% &
)
��& '
;
��' (
return
�� 
Ok
�� 
(
�� 
)
�� 
;
�� 
}
�� 	
}
�� 
}�� �!
QD:\.NET\VetAppointment - Working\VetAppointment.API\Controllers\VetsController.cs
	namespace 	
VetAppointment
 
. 
API 
. 
Features %
.% &
Vets& *
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
VetsController
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
Vet% (
>( )
vetRepository* 7
;7 8
public 
VetsController 
( 
IRepository )
<) *
Vet* -
>- .
vetRepository/ <
)< =
{ 	
this 
. 
vetRepository 
=  
vetRepository! .
;. /
} 	
[ 	
HttpGet	 
] 
public 
IActionResult 
Get  
(  !
)! "
{ 	
var 
vets 
= 
vetRepository $
.$ %
All% (
(( )
)) *
.* +
Select+ 1
( 
v 
=> 
new 
VetDto 
(  
)  !
{ 
Id 
= 
v 
. 
Id 
, 
Name 
= 
v 
. 
Name !
,! "
Surname 
= 
v 
.  
Surname  '
,' (
	Birthdate 
= 
v  !
.! "
	Birthdate" +
.+ ,
ToString, 4
(4 5
)5 6
,6 7
Gender 
= 
v 
. 
Gender %
.% &
ToString& .
(. /
)/ 0
,0 1
Email 
= 
v 
. 
Email #
,# $
Phone   
=   
v   
.   
Phone   #
,  # $
Specialisation!! "
=!!# $
v!!% &
.!!& '
Specialisation!!' 5
.!!5 6
ToString!!6 >
(!!> ?
)!!? @
}"" 
)## 
;## 
return%% 
Ok%% 
(%% 
vets%% 
)%% 
;%% 
}&& 	
[(( 	
HttpPost((	 
](( 
public)) 
IActionResult)) 
Create)) #
())# $
[))$ %
FromBody))% -
]))- .
VetDto))/ 5
vetDto))6 <
)))< =
{** 	
var++ 
vet++ 
=++ 
Vet++ 
.++ 
Create++  
(++  !
vetDto,, 
.,, 
Name,, 
,,,  
vetDto-- 
.-- 
Surname-- "
,--" #
vetDto.. 
... 
	Birthdate.. $
,..$ %
vetDto// 
.// 
Gender// !
,//! "
vetDto00 
.00 
Email00  
,00  !
vetDto11 
.11 
Phone11  
,11  !
vetDto22 
.22 
Specialisation22 )
)33 
;33 
if55 
(55 
vet55 
.55 
	IsFailure55 
)55 
{66 
return77 

BadRequest77 !
(77! "
vet77" %
.77% &
Error77& +
)77+ ,
;77, -
}88 
vetRepository:: 
.:: 
Add:: 
(:: 
vet:: !
.::! "
Entity::" (
)::( )
;::) *
vetRepository;; 
.;; 
SaveChanges;; %
(;;% &
);;& '
;;;' (
return== 
Created== 
(== 
nameof== !
(==! "
Get==" %
)==% &
,==& '
vet==( +
.==+ ,
Entity==, 2
)==2 3
;==3 4
}>> 	
}?? 
}@@ �
JD:\.NET\VetAppointment - Working\VetAppointment.API\Dtos\AppointmentDto.cs
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

WD:\.NET\VetAppointment - Working\VetAppointment.API\Dtos\Create\CreateAppointmentDto.cs
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
public 
DateTime 
ScheduledDate %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
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
} �
ZD:\.NET\VetAppointment - Working\VetAppointment.API\Dtos\Create\CreateMedicalHistoryDto.cs
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
CreateMedicalHistoryDto (
{ 
} 
} �
TD:\.NET\VetAppointment - Working\VetAppointment.API\Dtos\Create\CreatePetOwnerDto.cs
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
public 
string 
Surname 
{ 
get  #
;# $
set% (
;( )
}* +
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
public 
string 
Gender 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 
Address 
{ 
get  #
;# $
set% (
;( )
}* +
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
Phone 
{ 
get !
;! "
set# &
;& '
}( )
} 
} �
UD:\.NET\VetAppointment - Working\VetAppointment.API\Dtos\Create\CreateTreatmentDto.cs
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
} �
UD:\.NET\VetAppointment - Working\VetAppointment.API\Dtos\Create\CreateVetClinicDto.cs
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
OD:\.NET\VetAppointment - Working\VetAppointment.API\Dtos\Create\CreateVetDto.cs
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
class 
CreateVetDto 
: 
VetDto  &
{ 
public 
CreateVetDto 
( 
string "
name# '
,' (
string) /
surname0 7
,7 8
string9 ?
	birthdate@ I
,I J
stringK Q
genderR X
,X Y
stringZ `
emaila f
,f g
stringh n
phoneo t
,t u
stringv |
specialisation	} �
)
� �
:
� �
base
� �
(
� �
name
� �
,
� �
surname
� �
,
� �
	birthdate
� �
,
� �
gender
� �
,
� �
email
� �
,
� �
phone
� �
,
� �
specialisation
� �
)
� �
{ 	
} 	
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
 
Guid

 
ClinicId

 
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
CD:\.NET\VetAppointment - Working\VetAppointment.API\Dtos\DrugDto.cs
	namespace 	
VetAppointment
 
. 
API 
. 
Dtos !
{ 
public 

class 
DrugDto 
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
} �
MD:\.NET\VetAppointment - Working\VetAppointment.API\Dtos\MedicalHistoryDto.cs
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
MedicalHistoryDto "
:# $#
CreateMedicalHistoryDto% <
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
}		 �
BD:\.NET\VetAppointment - Working\VetAppointment.API\Dtos\PetDto.cs
	namespace 	
VetAppointment
 
. 
API 
. 
Dtos !
{ 
public 

class 
PetDto 
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
public		 
string		 
	Birthdate		 
{		  !
get		" %
;		% &
set		' *
;		* +
}		, -
public 
string 
Race 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
Gender 
{ 
get "
;" #
set$ '
;' (
}) *
} 
} �
GD:\.NET\VetAppointment - Working\VetAppointment.API\Dtos\PetOwnerDto.cs
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
}		 �
MD:\.NET\VetAppointment - Working\VetAppointment.API\Dtos\PrescribedDrugDto.cs
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
PrescribedDrugDto "
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
}		 
}

 �
HD:\.NET\VetAppointment - Working\VetAppointment.API\Dtos\TreatmentDto.cs
	namespace 	
VetAppointment
 
. 
API 
. 
Dtos !
{ 
public 

class 
TreatmentDto 
: 
CreateTreatmentDto  2
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
 �
HD:\.NET\VetAppointment - Working\VetAppointment.API\Dtos\VetClinicDto.cs
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
public		 
Guid		 
MedicalHistoryId		 $
{		% &
get		' *
;		* +
set		, /
;		/ 0
}		1 2
public 
DateTime 
RegistrationDate (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
} 
} �
BD:\.NET\VetAppointment - Working\VetAppointment.API\Dtos\VetDto.cs
	namespace 	
VetAppointment
 
. 
API 
. 
Dtos !
{ 
public 

class 
VetDto 
{ 
public 
VetDto 
( 
) 
{ 	
}		 	
public

 
VetDto

 
(

 
string

 
name

 !
,

! "
string

# )
surname

* 1
,

1 2
string

3 9
	birthdate

: C
,

C D
string

E K
gender

L R
,

R S
string 
email 
, 
string  
phone! &
,& '
string( .
specialisation/ =
)= >
{ 	
Name 
= 
name 
; 
Surname 
= 
surname 
; 
	Birthdate 
= 
	birthdate !
;! "
Gender 
= 
gender 
; 
Email 
= 
email 
; 
Phone 
= 
phone 
; 
Specialisation 
= 
specialisation +
;+ ,
} 	
public 
Guid 
Id 
{ 
get 
; 
set !
;! "
}# $
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
Surname 
{ 
get  #
;# $
set% (
;( )
}* +
public 
string 
	Birthdate 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string 
Gender 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
public!! 
string!! 
Phone!! 
{!! 
get!! !
;!!! "
set!!# &
;!!& '
}!!( )
public## 
string## 
Specialisation## $
{##% &
get##' *
;##* +
set##, /
;##/ 0
}##1 2
}$$ 
}%% �*
>D:\.NET\VetAppointment - Working\VetAppointment.API\Program.cs
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
builder 
. 
Services 
. 
AddDbContext 
< 
DatabaseContext -
>- .
(. /
options 
=>	 
options 
. 
	UseSqlite 
( 
$str C
)C D
)D E
;E F
builder 
. 
Services 
. 
	AddScoped 
< 
IRepository &
<& '
Appointment' 2
>2 3
,3 4!
AppointmentRepository5 J
>J K
(K L
)L M
;M N
builder 
. 
Services 
. 
	AddScoped 
< 
IRepository &
<& '
PetOwner' /
>/ 0
,0 1
PetOwnerRepository2 D
>D E
(E F
)F G
;G H
builder 
. 
Services 
. 
	AddScoped 
< 
IRepository &
<& '
Pet' *
>* +
,+ ,
PetRepository- :
>: ;
(; <
)< =
;= >
builder 
. 
Services 
. 
	AddScoped 
< 
IRepository &
<& '
	VetClinic' 0
>0 1
,1 2
VetClinicRepository3 F
>F G
(G H
)H I
;I J
builder   
.   
Services   
.   
	AddScoped   
<   
IRepository   &
<  & '
Vet  ' *
>  * +
,  + ,
VetRepository  - :
>  : ;
(  ; <
)  < =
;  = >
builder!! 
.!! 
Services!! 
.!! 
	AddScoped!! 
<!! 
IRepository!! &
<!!& '
Drug!!' +
>!!+ ,
,!!, -
DrugRepository!!. <
>!!< =
(!!= >
)!!> ?
;!!? @
builder"" 
."" 
Services"" 
."" 
	AddScoped"" 
<"" 
IRepository"" &
<""& '
MedicalHistory""' 5
>""5 6
,""6 7$
MedicalHistoryRepository""8 P
>""P Q
(""Q R
)""R S
;""S T
builder## 
.## 
Services## 
.## 
	AddScoped## 
<## 
IRepository## &
<##& '
PrescribedDrug##' 5
>##5 6
,##6 7$
PrescribedDrugRepository##8 P
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
<$$& '
	Treatment$$' 0
>$$0 1
,$$1 2
TreatmentRepository$$3 F
>$$F G
($$G H
)$$H I
;$$I J
builder&& 
.&& 
Services&& 
.&& 
AddCors&& 
(&& 
options&&  
=>&&! #
{'' 
options(( 
.(( 	
	AddPolicy((	 
((( 
$str((  
,((  !
policy((" (
=>(() +
{)) 
policy** 
.** 	
AllowAnyOrigin**	 
(** 
)** 
.** 
AllowAnyHeader** (
(**( )
)**) *
.*** +
AllowAnyMethod**+ 9
(**9 :
)**: ;
;**; <
}++ 
)++ 
;++ 
},, 
),, 
;,, 
var-- 
app-- 
=-- 	
builder--
 
.-- 
Build-- 
(-- 
)-- 
;-- 
if00 
(00 
app00 
.00 
Environment00 
.00 
IsDevelopment00 !
(00! "
)00" #
)00# $
{11 
app22 
.22 

UseSwagger22 
(22 
)22 
;22 
app33 
.33 
UseSwaggerUI33 
(33 
)33 
;33 
}44 
app66 
.66 
UseHttpsRedirection66 
(66 
)66 
;66 
app77 
.77 
UseCors77 
(77 
$str77 
)77 
;77 
app99 
.99 
UseAuthorization99 
(99 
)99 
;99 
app;; 
.;; 
MapControllers;; 
(;; 
);; 
;;; 
app== 
.== 
Run== 
(== 
)== 	
;==	 
