��
^C:\Users\Leonard\Desktop\Clean VetApp\VetAppointment.API\Controllers\AppointmentsController.cs
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
IUnitOfWork $

unitOfWork% /
;/ 0
private 
readonly )
CreateAppointmentDtoValidator 6)
createAppointmentDtoValidator7 T
=U V
newW Z
(Z [
)[ \
;\ ]
public "
AppointmentsController %
(% &
IUnitOfWork& 1

unitOfWork2 <
)< =
=>> @
thisA E
.E F

unitOfWorkF P
=Q R

unitOfWorkS ]
;] ^
[ 	
HttpPost	 
] 
public 
IActionResult 
Create #
(# $
[$ %
FromBody% -
]- . 
CreateAppointmentDto/ C
appointmentDtoD R
)R S
{ 	
var 
validatorResult 
=  !)
createAppointmentDtoValidator" ?
.? @
Validate@ H
(H I
appointmentDtoI W
)W X
;X Y
if 
( 
! 
validatorResult  
.  !
IsValid! (
)( )
{ 
return 

BadRequest !
(! "
validatorResult" 1
.1 2
Errors2 8
)8 9
;9 :
} 
var 
pet 
= 

unitOfWork  
.  !
PetRepository! .
.. /
Get/ 2
(2 3
appointmentDto3 A
.A B
PetIdB G
)G H
.H I
ResultI O
;O P
if 
( 
pet 
== 
null 
) 
{ 
return 
NotFound 
(  
)  !
;! "
} 
var!! 
vet!! 
=!! 

unitOfWork!!  
.!!  !
VetRepository!!! .
.!!. /
Get!!/ 2
(!!2 3
appointmentDto!!3 A
.!!A B
VetId!!B G
)!!G H
.!!H I
Result!!I O
;!!O P
if"" 
("" 
vet"" 
=="" 
null"" 
)"" 
{## 
return$$ 
NotFound$$ 
($$  
)$$  !
;$$! "
}%% 
var'' 
appointment'' 
='' 
Appointment'' )
.'') *
SettleAppointment''* ;
(''; <
vet(( 
,(( 
pet)) 
,)) 
appointmentDto** "
.**" #
ScheduledDate**# 0
,**0 1
appointmentDto++ "
.++" #&
EstimatedDurationInMinutes++# =
),, 
;,, 
var.. 

treatement.. 
=.. 

unitOfWork.. '
...' (
TreatmentRepository..( ;
...; <
Get..< ?
(..? @
appointmentDto..@ N
...N O
TreatmentId..O Z
)..Z [
...[ \
Result..\ b
;..b c
if// 
(// 

treatement// 
==// 
null// "
)//# $
{00 
return11 
NotFound11 
(11  
)11  !
;11! "
}22 
var44 
history44 
=44 

unitOfWork44 $
.44$ %$
MedicalHistoryRepository44% =
.44= >
Get44> A
(44A B
appointmentDto44B P
.44P Q
MedicalHistoryId44Q a
)44a b
.44b c
Result44c i
;44i j
if55 
(55 
history55 
==55 
null55 
)55  
{66 
return77 
NotFound77 
(77  
)77  !
;77! "
}88 
history:: 
.:: (
RegisterAppointmentToHistory:: 0
(::0 1
appointment::1 <
.::< =
Entity::= C
)::C D
;::D E

unitOfWork;; 
.;; $
MedicalHistoryRepository;; /
.;;/ 0
Update;;0 6
(;;6 7
history;;7 >
);;> ?
;;;? @

unitOfWork<< 
.<< 
SaveChanges<< "
(<<" #
)<<# $
;<<$ %
appointment>> 
.>> 
Entity>> 
.>> (
AttachTreatmentToAppointment>> ;
(>>; <

treatement>>< F
)>>F G
;>>G H
appointment?? 
.?? 
Entity?? 
.?? -
!AttachAppointmentToMedicalHistory?? @
(??@ A
history??A H
)??H I
;??I J
ifBB 
(BB 
appointmentBB 
.BB 
	IsFailureBB %
)BB% &
{CC 
returnDD 

BadRequestDD !
(DD! "
appointmentDD" -
.DD- .
ErrorDD. 3
)DD3 4
;DD4 5
}EE 

unitOfWorkGG 
.GG !
AppointmentRepositoryGG ,
.GG, -
AddGG- 0
(GG0 1
appointmentGG1 <
.GG< =
EntityGG= C
)GGC D
;GGD E

unitOfWorkHH 
.HH 
SaveChangesHH "
(HH" #
)HH# $
;HH$ %
varII 
fullAppointmentII 
=II  !
newII" %
AppointmentDtoII& 4
{JJ 
IdKK 
=KK 
appointmentKK  
.KK  !
EntityKK! '
.KK' (
IdKK( *
,KK* +
VetIdLL 
=LL 
appointmentLL #
.LL# $
EntityLL$ *
.LL* +
VetIdLL+ 0
,LL0 1
PetIdMM 
=MM 
appointmentMM #
.MM# $
EntityMM$ *
.MM* +
PetIdMM+ 0
,MM0 1
ScheduledDateNN 
=NN 
appointmentNN  +
.NN+ ,
EntityNN, 2
.NN2 3
ScheduledDateNN3 @
.NN@ A
ToStringNNA I
(NNI J
)NNJ K
,NNK L&
EstimatedDurationInMinutesOO *
=OO+ ,
appointmentOO- 8
.OO8 9
EntityOO9 ?
.OO? @&
EstimatedDurationInMinutesOO@ Z
}PP 
;PP 
ResponseRR 
.RR 
HeadersRR 
.RR 
AddRR  
(RR  !
$strRR! ?
,RR? @
$strRRA a
)RRa b
;RRb c
ResponseSS 
.SS 
HeadersSS 
.SS 
AddSS  
(SS  !
$strSS! ?
,SS? @
$strSSA b
)SSb c
;SSc d
ResponseTT 
.TT 
HeadersTT 
.TT 
AddTT  
(TT  !
$strTT! >
,TT> ?
$strTT@ X
)TTX Y
;TTY Z
returnUU 
CreatedUU 
(UU 
nameofUU !
(UU! "
GetAllAppointmentsUU" 4
)UU4 5
,UU5 6
fullAppointmentUU7 F
)UUF G
;UUG H
}VV 	
[XX 	
HttpGetXX	 
]XX 
publicYY 
IActionResultYY 
GetAllAppointmentsYY /
(YY/ 0
)YY0 1
{ZZ 	
var[[ 
appointments[[ 
=[[ 

unitOfWork[[ )
.[[) *!
AppointmentRepository[[* ?
.[[? @
All[[@ C
([[C D
)[[D E
.[[E F
Result[[F L
.[[L M
Select[[M S
([[S T
appointment[[T _
=>[[` b
new[[c f
AppointmentDto[[g u
([[u v
)[[v w
{\\ 
Id]] 
=]] 
appointment]]  
.]]  !
Id]]! #
,]]# $
VetId^^ 
=^^ 
appointment^^ #
.^^# $
VetId^^$ )
,^^) *
PetId__ 
=__ 
appointment__ #
.__# $
PetId__$ )
,__) *
ScheduledDate`` 
=`` 
appointment``  +
.``+ ,
ScheduledDate``, 9
.``9 :
ToString``: B
(``B C
)``C D
,``D E&
EstimatedDurationInMinutesaa *
=aa+ ,
appointmentaa- 8
.aa8 9&
EstimatedDurationInMinutesaa9 S
,aaS T
TreatmentIdbb 
=bb 
appointmentbb )
.bb) *
TreatmentIdbb* 5
,bb5 6
MedicalHistoryIdcc  
=cc! "
appointmentcc# .
.cc. /
MedicalHistoryIdcc/ ?
}dd 
)dd 
;dd 
Responseff 
.ff 
Headersff 
.ff 
Addff  
(ff  !
$strff! ?
,ff? @
$strffA a
)ffa b
;ffb c
Responsegg 
.gg 
Headersgg 
.gg 
Addgg  
(gg  !
$strgg! ?
,gg? @
$strggA b
)ggb c
;ggc d
Responsehh 
.hh 
Headershh 
.hh 
Addhh  
(hh  !
$strhh! >
,hh> ?
$strhh@ X
)hhX Y
;hhY Z
returnii 
Okii 
(ii 
appointmentsii "
)ii" #
;ii# $
}jj 	
[ll 	
HttpGetll	 
(ll 
$strll 
)ll 
]ll 
publicmm 
IActionResultmm 
GetAppointmentByIdmm /
(mm/ 0
Guidmm0 4
idmm5 7
)mm7 8
{nn 	
varoo 
appointmentoo 
=oo 

unitOfWorkoo (
.oo( )!
AppointmentRepositoryoo) >
.oo> ?
Getoo? B
(ooB C
idooC E
)ooE F
.ooF G
ResultooG M
;ooM N
ifpp 
(pp 
appointmentpp 
==pp 
nullpp #
)pp# $
{qq 
returnrr 
NotFoundrr 
(rr  
)rr  !
;rr! "
}ss 
varuu 
appointmentDtouu 
=uu  
newuu! $
AppointmentDtouu% 3
{vv 
Idww 
=ww 
appointmentww  
.ww  !
Idww! #
,ww# $
VetIdxx 
=xx 
appointmentxx #
.xx# $
VetIdxx$ )
,xx) *
PetIdyy 
=yy 
appointmentyy #
.yy# $
PetIdyy$ )
,yy) *
ScheduledDatezz 
=zz 
appointmentzz  +
.zz+ ,
ScheduledDatezz, 9
.zz9 :
ToStringzz: B
(zzB C
)zzC D
,zzD E&
EstimatedDurationInMinutes{{ *
={{+ ,
appointment{{- 8
.{{8 9&
EstimatedDurationInMinutes{{9 S
,{{S T
TreatmentId|| 
=|| 
appointment|| )
.||) *
TreatmentId||* 5
,||5 6
MedicalHistoryId}}  
=}}! "
appointment}}# .
.}}. /
MedicalHistoryId}}/ ?
}~~ 
;~~ 
Response
�� 
.
�� 
Headers
�� 
.
�� 
Add
��  
(
��  !
$str
��! ?
,
��? @
$str
��A a
)
��a b
;
��b c
Response
�� 
.
�� 
Headers
�� 
.
�� 
Add
��  
(
��  !
$str
��! ?
,
��? @
$str
��A b
)
��b c
;
��c d
Response
�� 
.
�� 
Headers
�� 
.
�� 
Add
��  
(
��  !
$str
��! >
,
��> ?
$str
��@ X
)
��X Y
;
��Y Z
return
�� 
Ok
�� 
(
�� 
appointmentDto
�� $
)
��$ %
;
��% &
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
.
��F G
Result
��G M
;
��M N
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
�� 

unitOfWork
�� 
.
�� #
AppointmentRepository
�� ,
.
��, -
Delete
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
��$ %
Response
�� 
.
�� 
Headers
�� 
.
�� 
Add
��  
(
��  !
$str
��! ?
,
��? @
$str
��A a
)
��a b
;
��b c
Response
�� 
.
�� 
Headers
�� 
.
�� 
Add
��  
(
��  !
$str
��! ?
,
��? @
$str
��A b
)
��b c
;
��c d
Response
�� 
.
�� 
Headers
�� 
.
�� 
Add
��  
(
��  !
$str
��! >
,
��> ?
$str
��@ X
)
��X Y
;
��Y Z
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
.
��F G
Result
��G M
;
��M N
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
�� 
var
�� 
validatorResult
�� 
=
��  !+
createAppointmentDtoValidator
��" ?
.
��? @
Validate
��@ H
(
��H I
appointmentDto
��I W
)
��W X
;
��X Y
if
�� 
(
�� 
!
�� 
validatorResult
��  
.
��  !
IsValid
��! (
)
��( )
{
�� 
return
�� 

BadRequest
�� !
(
��! "
validatorResult
��" 1
.
��1 2
Errors
��2 8
)
��8 9
;
��9 :
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
��$ %
Response
�� 
.
�� 
Headers
�� 
.
�� 
Add
��  
(
��  !
$str
��! ?
,
��? @
$str
��A a
)
��a b
;
��b c
Response
�� 
.
�� 
Headers
�� 
.
�� 
Add
��  
(
��  !
$str
��! ?
,
��? @
$str
��A b
)
��b c
;
��c d
Response
�� 
.
�� 
Headers
�� 
.
�� 
Add
��  
(
��  !
$str
��! >
,
��> ?
$str
��@ X
)
��X Y
;
��Y Z
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
}�� �S
WC:\Users\Leonard\Desktop\Clean VetApp\VetAppointment.API\Controllers\DrugsController.cs
	namespace		 	
VetAppointment		
 
.		 
API		 
.		 
Controllers		 (
{

 
[ 
Route 

(
 
$str  
)  !
]! "
[ 
ApiController 
] 
public 

class 
DrugsController  
:! "
ControllerBase# 1
{ 
private 
readonly 
IRepository $
<$ %
Drug% )
>) *
drugRepository+ 9
;9 :
private 
readonly "
CreateDrugDtoValidator /"
createDrugDtoValidator0 F
=G H
newI L
(L M
)M N
;N O
public 
DrugsController 
( 
IRepository *
<* +
Drug+ /
>/ 0
drugRepository1 ?
)? @
=>A C
thisD H
.H I
drugRepositoryI W
=X Y
drugRepositoryZ h
;h i
[ 	
HttpGet	 
] 
public 
IActionResult 
Get  
(  !
)! "
{ 	
var 
drugs 
= 
drugRepository &
.& '
All' *
(* +
)+ ,
., -
Result- 3
.3 4
Select4 :
(: ;

DrugMapper; E
.E F
MapperF L
.L M
MapM P
<P Q
DrugDtoQ X
>X Y
)Y Z
;Z [
Response 
. 
Headers 
. 
Add  
(  !
$str! ?
,? @
$strA a
)a b
;b c
Response 
. 
Headers 
. 
Add  
(  !
$str! ?
,? @
$strA b
)b c
;c d
Response 
. 
Headers 
. 
Add  
(  !
$str! >
,> ?
$str@ X
)X Y
;Y Z
return 
Ok 
( 
drugs 
) 
; 
} 	
[ 	
HttpGet	 
( 
$str  
)  !
]! "
public   
IActionResult   
Get    
(    !
Guid  ! %
drugId  & ,
)  , -
{!! 	
var"" 
drug"" 
="" 
drugRepository"" %
.""% &
Get""& )
("") *
drugId""* 0
)""0 1
.""1 2
Result""2 8
;""8 9
if$$ 
($$ 
drug$$ 
==$$ 
null$$ 
)$$ 
{%% 
return&& 
NotFound&& 
(&&  
)&&  !
;&&! "
}'' 
var)) 
drugDto)) 
=)) 

DrugMapper)) $
.))$ %
Mapper))% +
.))+ ,
Map)), /
<))/ 0
DrugDto))0 7
>))7 8
())8 9
drug))9 =
)))= >
;))> ?
Response++ 
.++ 
Headers++ 
.++ 
Add++  
(++  !
$str++! ?
,++? @
$str++A a
)++a b
;++b c
Response,, 
.,, 
Headers,, 
.,, 
Add,,  
(,,  !
$str,,! ?
,,,? @
$str,,A b
),,b c
;,,c d
Response-- 
.-- 
Headers-- 
.-- 
Add--  
(--  !
$str--! >
,--> ?
$str--@ X
)--X Y
;--Y Z
return.. 
Ok.. 
(.. 
drugDto.. 
).. 
;.. 
}// 	
[11 	
HttpPost11	 
]11 
public22 
IActionResult22 
Create22 #
(22# $
[22$ %
FromBody22% -
]22- .
CreateDrugDto22/ <
drugDto22= D
)22D E
{33 	
var44 
validatorResult44 
=44  !"
createDrugDtoValidator44" 8
.448 9
Validate449 A
(44A B
drugDto44B I
)44I J
;44J K
if55 
(55 
!55 
validatorResult55  
.55  !
IsValid55! (
)55( )
{66 
return77 

BadRequest77 !
(77! "
validatorResult77" 1
.771 2
Errors772 8
)778 9
;779 :
}88 
var:: 
drug:: 
=:: 

DrugMapper:: !
.::! "
Mapper::" (
.::( )
Map::) ,
<::, -
Drug::- 1
>::1 2
(::2 3
drugDto::3 :
)::: ;
;::; <
if<< 
(<< 
drug<< 
==<< 
null<< 
)<< 
{== 
return>> 

BadRequest>> !
(>>! "
)>>" #
;>># $
}?? 
drugRepositoryAA 
.AA 
AddAA 
(AA 
drugAA #
)AA# $
;AA$ %
drugRepositoryBB 
.BB 
SaveChangesBB &
(BB& '
)BB' (
;BB( )
ResponseDD 
.DD 
HeadersDD 
.DD 
AddDD  
(DD  !
$strDD! ?
,DD? @
$strDDA a
)DDa b
;DDb c
ResponseEE 
.EE 
HeadersEE 
.EE 
AddEE  
(EE  !
$strEE! ?
,EE? @
$strEEA b
)EEb c
;EEc d
ResponseFF 
.FF 
HeadersFF 
.FF 
AddFF  
(FF  !
$strFF! >
,FF> ?
$strFF@ X
)FFX Y
;FFY Z
returnGG 
CreatedGG 
(GG 
nameofGG !
(GG! "
GetGG" %
)GG% &
,GG& '

DrugMapperGG( 2
.GG2 3
MapperGG3 9
.GG9 :
MapGG: =
<GG= >
DrugDtoGG> E
>GGE F
(GGF G
drugGGG K
)GGK L
)GGL M
;GGM N
}HH 	
[JJ 	

HttpDeleteJJ	 
(JJ 
$strJJ #
)JJ# $
]JJ$ %
publicKK 
IActionResultKK 
DeleteKK #
(KK# $
GuidKK$ (
drugIdKK) /
)KK/ 0
{LL 	
varMM 
drugMM 
=MM 
drugRepositoryMM %
.MM% &
GetMM& )
(MM) *
drugIdMM* 0
)MM0 1
.MM1 2
ResultMM2 8
;MM8 9
ifNN 
(NN 
drugNN 
==NN 
nullNN 
)NN 
{OO 
returnPP 
NotFoundPP 
(PP  
)PP  !
;PP! "
}QQ 
drugRepositorySS 
.SS 
DeleteSS !
(SS! "
drugSS" &
)SS& '
;SS' (
drugRepositoryTT 
.TT 
SaveChangesTT &
(TT& '
)TT' (
;TT( )
ResponseVV 
.VV 
HeadersVV 
.VV 
AddVV  
(VV  !
$strVV! ?
,VV? @
$strVVA a
)VVa b
;VVb c
ResponseWW 
.WW 
HeadersWW 
.WW 
AddWW  
(WW  !
$strWW! ?
,WW? @
$strWWA b
)WWb c
;WWc d
ResponseXX 
.XX 
HeadersXX 
.XX 
AddXX  
(XX  !
$strXX! >
,XX> ?
$strXX@ X
)XXX Y
;XXY Z
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
]]]: ;
CreateDrugDto]]< I
drugDto]]J Q
)]]Q R
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
.__1 2
Result__2 8
;__8 9
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
}cc 
varee 
validatorResultee 
=ee  !"
createDrugDtoValidatoree" 8
.ee8 9
Validateee9 A
(eeA B
drugDtoeeB I
)eeI J
;eeJ K
ifff 
(ff 
!ff 
validatorResultff  
.ff  !
IsValidff! (
)ff( )
{gg 
returnhh 

BadRequesthh !
(hh! "
validatorResulthh" 1
.hh1 2
Errorshh2 8
)hh8 9
;hh9 :
}ii 
drugkk 
.kk 
Updatekk 
(kk 
drugDtokk 
.kk  
Namekk  $
,kk$ %
drugDtokk& -
.kk- .
Quantitykk. 6
,kk6 7
drugDtokk8 ?
.kk? @
	UnitPricekk@ I
)kkI J
;kkJ K
drugRepositorymm 
.mm 
Updatemm !
(mm! "
drugmm" &
)mm& '
;mm' (
drugRepositorynn 
.nn 
SaveChangesnn &
(nn& '
)nn' (
;nn( )
Responsepp 
.pp 
Headerspp 
.pp 
Addpp  
(pp  !
$strpp! ?
,pp? @
$strppA a
)ppa b
;ppb c
Responseqq 
.qq 
Headersqq 
.qq 
Addqq  
(qq  !
$strqq! ?
,qq? @
$strqqA b
)qqb c
;qqc d
Responserr 
.rr 
Headersrr 
.rr 
Addrr  
(rr  !
$strrr! >
,rr> ?
$strrr@ X
)rrX Y
;rrY Z
returnss 
Okss 
(ss 

DrugMapperss  
.ss  !
Mapperss! '
.ss' (
Mapss( +
<ss+ ,
DrugDtoss, 3
>ss3 4
(ss4 5
drugss5 9
)ss9 :
)ss: ;
;ss; <
}tt 	
}uu 
}vv �J
bC:\Users\Leonard\Desktop\Clean VetApp\VetAppointment.API\Controllers\MedicalHistoriesController.cs
	namespace		 	
VetAppointment		
 
.		 
API		 
.		 
Controllers		 (
{

 
[ 
Route 

(
 
$str  
)  !
]! "
[ 
ApiController 
] 
public 

class &
MedicalHistoriesController +
:, -
ControllerBase. <
{ 
private 
readonly 
IUnitOfWork $

unitOfWork% /
;/ 0
private 
readonly )
CreateAppointmentDtoValidator 6)
createAppointmentDtoValidator7 T
=U V
newW Z
(Z [
)[ \
;\ ]
public &
MedicalHistoriesController )
() *
IUnitOfWork* 5

unitOfWork6 @
)@ A
=>B D
thisE I
.I J

unitOfWorkJ T
=U V

unitOfWorkW a
;a b
[ 	
HttpGet	 
] 
public 
IActionResult 
Get  
(  !
)! "
{ 	
var 
medicalHistories  
=! "

unitOfWork# -
.- .$
MedicalHistoryRepository. F
. 
All 
( 
) 
. 
Result 
. 
Select $
($ % 
MedicalHistoryMapper% 9
.9 :
Mapper: @
.@ A
MapA D
<D E
MedicalHistoryDtoE V
>V W
)W X
;X Y
Response 
. 
Headers 
. 
Add  
(  !
$str! ?
,? @
$strA a
)a b
;b c
Response 
. 
Headers 
. 
Add  
(  !
$str! ?
,? @
$strA b
)b c
;c d
Response 
. 
Headers 
. 
Add  
(  !
$str! >
,> ?
$str@ X
)X Y
;Y Z
return 
Ok 
( 
medicalHistories &
)& '
;' (
} 	
[!! 	
HttpGet!!	 
(!! 
$str!! "
)!!" #
]!!# $
public"" 
IActionResult"" 
GetByClinicId"" *
(""* +
Guid""+ /
clinicId""0 8
)""8 9
{## 	
var$$ 
clinic$$ 
=$$ 

unitOfWork$$ #
.$$# $
VetClinicRepository$$$ 7
.$$7 8
Get$$8 ;
($$; <
clinicId$$< D
)$$D E
.$$E F
Result$$F L
;$$L M
if%% 
(%% 
clinic%% 
==%% 
null%% 
)%% 
{&& 
return'' 
NotFound'' 
(''  
)''  !
;''! "
}(( 
var)) 
medicalHistory)) 
=))   
MedicalHistoryMapper))! 5
.))5 6
Mapper))6 <
.** 
Map** 
<** 
MedicalHistoryDto** &
>**& '
(**' (

unitOfWork**( 2
.**2 3$
MedicalHistoryRepository**3 K
.++ 
Find++ 
(++ 
md++ 
=>++ 
md++ 
.++ 
ClinicId++ '
==++( *
clinicId+++ 3
)++3 4
)++4 5
;++5 6
if,, 
(,, 
medicalHistory,, 
==,, !
null,," &
),,& '
{-- 
return.. 
NotFound.. 
(..  
)..  !
;..! "
}// 
Response11 
.11 
Headers11 
.11 
Add11  
(11  !
$str11! ?
,11? @
$str11A a
)11a b
;11b c
Response22 
.22 
Headers22 
.22 
Add22  
(22  !
$str22! ?
,22? @
$str22A b
)22b c
;22c d
Response33 
.33 
Headers33 
.33 
Add33  
(33  !
$str33! >
,33> ?
$str33@ X
)33X Y
;33Y Z
return55 
Ok55 
(55 
medicalHistory55 $
)55$ %
;55% &
}66 	
[88 	
HttpPost88	 
(88 
$str88 7
)887 8
]888 9
public99 
IActionResult99 
Post99 !
(99! "
Guid99" &
medicalHistoryId99' 7
,997 8
[999 :
FromBody99: B
]99B C 
CreateAppointmentDto99D X
appointmentDto99Y g
)99g h
{:: 	
var;; 
validatorResult;; 
=;;  !)
createAppointmentDtoValidator;;" ?
.;;? @
Validate;;@ H
(;;H I
appointmentDto;;I W
);;W X
;;;X Y
if<< 
(<< 
!<< 
validatorResult<<  
.<<  !
IsValid<<! (
)<<( )
{== 
return>> 

BadRequest>> !
(>>! "
validatorResult>>" 1
.>>1 2
Errors>>2 8
)>>8 9
;>>9 :
}?? 
var@@ 
medicalHistory@@ 
=@@  

unitOfWork@@! +
.@@+ ,$
MedicalHistoryRepository@@, D
.@@D E
Get@@E H
(@@H I
medicalHistoryId@@I Y
)@@Y Z
.@@Z [
Result@@[ a
;@@a b
ifAA 
(AA 
medicalHistoryAA 
==AA !
nullAA" &
)AA& '
{BB 
returnCC 
NotFoundCC 
(CC  
)CC  !
;CC! "
}DD 
varFF 
petFF 
=FF 

unitOfWorkFF  
.FF  !
PetRepositoryFF! .
.FF. /
GetFF/ 2
(FF2 3
appointmentDtoFF3 A
.FFA B
PetIdFFB G
)FFG H
.FFH I
ResultFFI O
;FFO P
ifGG 
(GG 
petGG 
==GG 
nullGG 
)GG 
{HH 
returnII 
NotFoundII 
(II  
)II  !
;II! "
}JJ 
varLL 
vetLL 
=LL 

unitOfWorkLL  
.LL  !
VetRepositoryLL! .
.LL. /
GetLL/ 2
(LL2 3
appointmentDtoLL3 A
.LLA B
VetIdLLB G
)LLG H
.LLH I
ResultLLI O
;LLO P
ifMM 
(MM 
vetMM 
==MM 
nullMM 
)MM 
{NN 
returnOO 
NotFoundOO 
(OO  
)OO  !
;OO! "
}PP 
varRR 
appointmentRR 
=RR 
AppointmentRR )
.RR) *
SettleAppointmentRR* ;
(RR; <
vetSS 
,SS 
petTT 
,TT 
appointmentDtoUU 
.UU 
ScheduledDateUU ,
,UU, -
appointmentDtoVV 
.VV &
EstimatedDurationInMinutesVV 9
)WW 
;WW 
ifXX 
(XX 
appointmentXX 
.XX 
	IsFailureXX %
)XX% &
{YY 
returnZZ 

BadRequestZZ !
(ZZ! "
appointmentZZ" -
.ZZ- .
ErrorZZ. 3
)ZZ3 4
;ZZ4 5
}[[ 
var]] 
result]] 
=]] 
medicalHistory]] '
.]]' ((
RegisterAppointmentToHistory]]( D
(]]D E
appointment]]E P
.]]P Q
Entity]]Q W
)]]W X
;]]X Y
if^^ 
(^^ 
result^^ 
.^^ 
	IsFailure^^  
)^^  !
{__ 
return`` 

BadRequest`` !
(``! "
result``" (
.``( )
Error``) .
)``. /
;``/ 0
}aa 

unitOfWorkcc 
.cc !
AppointmentRepositorycc ,
.cc, -
Addcc- 0
(cc0 1
appointmentcc1 <
.cc< =
Entitycc= C
)ccC D
;ccD E

unitOfWorkdd 
.dd 
SaveChangesdd "
(dd" #
)dd# $
;dd$ %
Responseff 
.ff 
Headersff 
.ff 
Addff  
(ff  !
$strff! ?
,ff? @
$strffA a
)ffa b
;ffb c
Responsegg 
.gg 
Headersgg 
.gg 
Addgg  
(gg  !
$strgg! ?
,gg? @
$strggA b
)ggb c
;ggc d
Responsehh 
.hh 
Headershh 
.hh 
Addhh  
(hh  !
$strhh! >
,hh> ?
$strhh@ X
)hhX Y
;hhY Z
returnii 
Createdii 
(ii 
nameofii !
(ii! "
Postii" &
)ii& '
,ii' (
AppointmentMapperii) :
.ii: ;
Mapperii; A
.iiA B
MapiiB E
<iiE F
AppointmentDtoiiF T
>iiT U
(iiU V
appointmentiiV a
.iia b
Entityiib h
)iih i
)iii j
;iij k
}jj 	
}kk 
}ll �J
[C:\Users\Leonard\Desktop\Clean VetApp\VetAppointment.API\Controllers\PetOwnersController.cs
	namespace		 	
VetAppointment		
 
.		 
API		 
.		 
Controllers		 (
{

 
[ 
Route 

(
 
$str  
)  !
]! "
[ 
ApiController 
] 
public 

class 
PetOwnersController $
:% &
ControllerBase' 5
{ 
private 
readonly 
IRepository $
<$ %
PetOwner% -
>- .
petOwnerRepository/ A
;A B
private 
readonly 
IRepository $
<$ %
Pet% (
>( )
petRepository* 7
;7 8
private 
readonly &
CreatePetOwnerDtoValidator 3&
createPetOwnerDtoValidator4 N
=O P
newQ T
(T U
)U V
;V W
private 
readonly !
CreatePetDtoValidator .!
createPetDtoValidator/ D
=E F
newG J
(J K
)K L
;L M
public 
PetOwnersController "
(" #
IRepository# .
<. /
PetOwner/ 7
>7 8
petOwnerRepository9 K
,K L
IRepositoryM X
<X Y
PetY \
>\ ]
petRepository^ k
)k l
{ 	
this 
. 
petOwnerRepository #
=$ %
petOwnerRepository& 8
;8 9
this 
. 
petRepository 
=  
petRepository! .
;. /
} 	
[ 	
HttpGet	 
] 
public 
IActionResult 
Get  
(  !
)! "
{ 	
var 
	petOwners 
= 
petOwnerRepository .
.. /
All/ 2
(2 3
)3 4
.4 5
Result5 ;
.; <
Select< B
(B C
PetOwnerMapperC Q
.Q R
MapperR X
.X Y
MapY \
<\ ]
PetOwnerDto] h
>h i
)i j
;j k
Response 
. 
Headers 
. 
Add  
(  !
$str! ?
,? @
$strA g
)g h
;h i
Response   
.   
Headers   
.   
Add    
(    !
$str  ! ?
,  ? @
$str  A b
)  b c
;  c d
Response!! 
.!! 
Headers!! 
.!! 
Add!!  
(!!  !
$str!!! >
,!!> ?
$str!!@ X
)!!X Y
;!!Y Z
return"" 
Ok"" 
("" 
	petOwners"" 
)""  
;""  !
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
]&&- .
CreatePetOwnerDto&&/ @
petOwnerDto&&A L
)&&L M
{'' 	
var(( 
validatorResult(( 
=((  !&
createPetOwnerDtoValidator((" <
.((< =
Validate((= E
(((E F
petOwnerDto((F Q
)((Q R
;((R S
if)) 
()) 
!)) 
validatorResult))  
.))  !
IsValid))! (
)))( )
{** 
return++ 

BadRequest++ !
(++! "
validatorResult++" 1
.++1 2
Errors++2 8
)++8 9
;++9 :
},, 
var-- 
petOwner-- 
=-- 
PetOwnerMapper-- )
.--) *
Mapper--* 0
.--0 1
Map--1 4
<--4 5
PetOwner--5 =
>--= >
(--> ?
petOwnerDto--? J
)--J K
;--K L
if// 
(// 
petOwner// 
==// 
null//  
)//  !
{00 
return11 

BadRequest11 !
(11! "
)11" #
;11# $
}22 
petOwnerRepository44 
.44 
Add44 "
(44" #
petOwner44# +
)44+ ,
;44, -
petOwnerRepository55 
.55 
SaveChanges55 *
(55* +
)55+ ,
;55, -
Response77 
.77 
Headers77 
.77 
Add77  
(77  !
$str77! ?
,77? @
$str77A g
)77g h
;77h i
Response88 
.88 
Headers88 
.88 
Add88  
(88  !
$str88! ?
,88? @
$str88A b
)88b c
;88c d
Response99 
.99 
Headers99 
.99 
Add99  
(99  !
$str99! >
,99> ?
$str99@ X
)99X Y
;99Y Z
return:: 
Created:: 
(:: 
nameof:: !
(::! "
Get::" %
)::% &
,::& '
PetOwnerMapper::( 6
.::6 7
Mapper::7 =
.::= >
Map::> A
<::A B
PetOwnerDto::B M
>::M N
(::N O
petOwner::O W
)::W X
)::X Y
;::Y Z
}<< 	
[>> 	
HttpPost>>	 
(>> 
$str>> (
)>>( )
]>>) *
public?? 
IActionResult?? 
RegisterPetsToOwner?? 0
(??0 1
Guid??1 5
ownerId??6 =
,??= >
[??? @
FromBody??@ H
]??H I
List??J N
<??N O
CreatePetDto??O [
>??[ \
petsDtos??] e
)??e f
{@@ 	
varAA 
ownerAA 
=AA 
petOwnerRepositoryAA *
.AA* +
GetAA+ .
(AA. /
ownerIdAA/ 6
)AA6 7
.AA7 8
ResultAA8 >
;AA> ?
ifBB 
(BB 
ownerBB 
==BB 
nullBB 
)BB 
{CC 
returnDD 
NotFoundDD 
(DD  
)DD  !
;DD! "
}EE 
foreachGG 
(GG 
varGG 
petDtoGG 
inGG  "
petsDtosGG# +
)GG+ ,
{HH 
varII 
validatorResultII #
=II$ %!
createPetDtoValidatorII& ;
.II; <
ValidateII< D
(IID E
petDtoIIE K
)IIK L
;IIL M
ifJJ 
(JJ 
!JJ 
validatorResultJJ $
.JJ$ %
IsValidJJ% ,
)JJ, -
{KK 
returnLL 

BadRequestLL %
(LL% &
validatorResultLL& 5
.LL5 6
ErrorsLL6 <
)LL< =
;LL= >
}MM 
}NN 
varPP 
petsPP 
=PP 
petsDtosPP 
.PP  
SelectPP  &
(PP& '
	PetMapperPP' 0
.PP0 1
MapperPP1 7
.PP7 8
MapPP8 ;
<PP; <
PetPP< ?
>PP? @
)PP@ A
.PPA B
ToListPPB H
(PPH I
)PPI J
;PPJ K
ifQQ 
(QQ 
petsQQ 
.QQ 
AnyQQ 
(QQ 
pQQ 
=>QQ 
pQQ 
==QQ !
nullQQ" &
)QQ& '
)QQ' (
{RR 
returnSS 

BadRequestSS !
(SS! "
)SS" #
;SS# $
}TT 
varVV 
resultVV 
=VV 
ownerVV 
.VV 
RegisterPetsToOwnerVV 2
(VV2 3
petsVV3 7
)VV7 8
;VV8 9
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
}[[ 
pets]] 
.]] 
ForEach]] 
(]] 
p]] 
=>]] 
petRepository]] +
.]]+ ,
Add]], /
(]]/ 0
p]]0 1
)]]1 2
)]]2 3
;]]3 4
petOwnerRepository^^ 
.^^ 
SaveChanges^^ *
(^^* +
)^^+ ,
;^^, -
Response`` 
.`` 
Headers`` 
.`` 
Add``  
(``  !
$str``! ?
,``? @
$str``A a
)``a b
;``b c
Responseaa 
.aa 
Headersaa 
.aa 
Addaa  
(aa  !
$straa! ?
,aa? @
$straaA b
)aab c
;aac d
Responsebb 
.bb 
Headersbb 
.bb 
Addbb  
(bb  !
$strbb! >
,bb> ?
$strbb@ X
)bbX Y
;bbY Z
returncc 
Createdcc 
(cc 
nameofcc !
(cc! "
Getcc" %
)cc% &
,cc& '
PetOwnerMappercc( 6
.cc6 7
Mappercc7 =
.cc= >
Mapcc> A
<ccA B
PetOwnerDtoccB M
>ccM N
(ccN O
ownerccO T
)ccT U
)ccU V
;ccV W
}dd 	
}ee 
}ff �
VC:\Users\Leonard\Desktop\Clean VetApp\VetAppointment.API\Controllers\PetsController.cs
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
PetsController 
:  !
ControllerBase" 0
{ 
private 
readonly 
IRepository $
<$ %
Pet% (
>( )
petRepository* 7
;7 8
public 
PetsController 
( 
IRepository )
<) *
Pet* -
>- .
petRepository/ <
)< =
=>> @
thisA E
.E F
petRepositoryF S
=T U
petRepositoryV c
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
pets 
= 
petRepository $
.$ %
All% (
(( )
)) *
.* +
Result+ 1
.1 2
Select2 8
(8 9
	PetMapper9 B
.B C
MapperC I
.I J
MapJ M
<M N
PetDtoN T
>T U
)U V
;V W
Response 
. 
Headers 
. 
Add  
(  !
$str! ?
,? @
$strA a
)a b
;b c
Response 
. 
Headers 
. 
Add  
(  !
$str! ?
,? @
$strA b
)b c
;c d
Response 
. 
Headers 
. 
Add  
(  !
$str! >
,> ?
$str@ X
)X Y
;Y Z
return 
Ok 
( 
pets 
) 
; 
} 	
} 
} �.
aC:\Users\Leonard\Desktop\Clean VetApp\VetAppointment.API\Controllers\PrescribedDrugsController.cs
	namespace		 	
VetAppointment		
 
.		 
API		 
.		 
Controllers		 (
{

 
[ 
Route 

(
 
$str  
)  !
]! "
[ 
ApiController 
] 
public 

class %
PrescribedDrugsController *
:+ ,
ControllerBase- ;
{ 
private 
readonly 
IRepository $
<$ %
PrescribedDrug% 3
>3 4$
prescribedDrugRepository5 M
;M N
private 
readonly 
IRepository $
<$ %
Drug% )
>) *
drugRepository+ 9
;9 :
private 
readonly ,
 CreatePrescribedDrugDtoValidator 9,
 createPrescribedDrugDtoValidator: Z
=[ \
new] `
(` a
)a b
;b c
public %
PrescribedDrugsController (
(( )
IRepository) 4
<4 5
PrescribedDrug5 C
>C D$
prescribedDrugRepositoryE ]
,] ^
IRepository_ j
<j k
Drugk o
>o p
drugRepositoryq 
)	 �
{ 	
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
var 
drugs 
= $
prescribedDrugRepository 0
.0 1
All1 4
(4 5
)5 6
.6 7
Result7 =
.= >
Select> D
(D E 
PrescribedDrugMapperE Y
.Y Z
MapperZ `
.` a
Mapa d
<d e
PrescribedDrugDtoe v
>v w
)w x
;x y
Response 
. 
Headers 
. 
Add  
(  !
$str! ?
,? @
$strA a
)a b
;b c
Response 
. 
Headers 
. 
Add  
(  !
$str! ?
,? @
$strA b
)b c
;c d
Response   
.   
Headers   
.   
Add    
(    !
$str  ! >
,  > ?
$str  @ X
)  X Y
;  Y Z
return!! 
Ok!! 
(!! 
drugs!! 
)!! 
;!! 
}"" 	
[$$ 	
HttpPost$$	 
]$$ 
public%% 
IActionResult%% 
Create%% #
(%%# $
[%%$ %
FromBody%%% -
]%%- .#
CreatePrescribedDrugDto%%/ F
drugDto%%G N
)%%N O
{&& 	
var'' 
validatorResult'' 
=''  !,
 createPrescribedDrugDtoValidator''" B
.''B C
Validate''C K
(''K L
drugDto''L S
)''S T
;''T U
if(( 
((( 
!(( 
validatorResult((  
.((  !
IsValid((! (
)((( )
{)) 
return** 

BadRequest** !
(**! "
validatorResult**" 1
.**1 2
Errors**2 8
)**8 9
;**9 :
}++ 
var-- 
drug-- 
=-- 
drugRepository-- %
.--% &
Get--& )
(--) *
drugDto--* 1
.--1 2
DrugId--2 8
)--8 9
.--9 :
Result--: @
;--@ A
if.. 
(.. 
drug.. 
==.. 
null.. 
).. 
{// 
return00 
NotFound00 
(00  
)00  !
;00! "
}11 
var33 
prescribedDrug33 
=33   
PrescribedDrugMapper33! 5
.335 6
Mapper336 <
.33< =
Map33= @
<33@ A
PrescribedDrug33A O
>33O P
(33P Q
drugDto33Q X
)33X Y
;33Y Z
if44 
(44 
prescribedDrug44 
==44 !
null44" &
)44& '
{55 
return66 

BadRequest66 !
(66! "
)66" #
;66# $
}77 $
prescribedDrugRepository99 $
.99$ %
Add99% (
(99( )
prescribedDrug99) 7
)997 8
;998 9$
prescribedDrugRepository:: $
.::$ %
SaveChanges::% 0
(::0 1
)::1 2
;::2 3
Response<< 
.<< 
Headers<< 
.<< 
Add<<  
(<<  !
$str<<! ?
,<<? @
$str<<A a
)<<a b
;<<b c
Response== 
.== 
Headers== 
.== 
Add==  
(==  !
$str==! ?
,==? @
$str==A b
)==b c
;==c d
Response>> 
.>> 
Headers>> 
.>> 
Add>>  
(>>  !
$str>>! >
,>>> ?
$str>>@ X
)>>X Y
;>>Y Z
return?? 
Created?? 
(?? 
nameof?? !
(??! "
Get??" %
)??% &
,??& ' 
PrescribedDrugMapper??( <
.??< =
Mapper??= C
.??C D
Map??D G
<??G H
PrescribedDrugDto??H Y
>??Y Z
(??Z [
prescribedDrug??[ i
)??i j
)??j k
;??k l
}@@ 	
}AA 
}BB �
\C:\Users\Leonard\Desktop\Clean VetApp\VetAppointment.API\Controllers\TreatmentsController.cs
	namespace		 	
VetAppointment		
 
.		 
API		 
.		 
Controllers		 (
{

 
[ 
Route 

(
 
$str  
)  !
]! "
[ 
ApiController 
] 
public 

class  
TreatmentsController %
:& '
ControllerBase( 6
{ 
private 
readonly 
IUnitOfWork $

unitOfWork% /
;/ 0
private 
readonly '
CreateTreatmentDtoValidator 4'
createTreatmentDtoValidator5 P
=Q R
newS V
(V W
)W X
;X Y
private 
readonly ,
 CreatePrescribedDrugDtoValidator 9,
 createPrescribedDrugDtoValidator: Z
=[ \
new] `
(` a
)a b
;b c
public  
TreatmentsController #
(# $
IUnitOfWork$ /

unitOfWork0 :
): ;
=>< >
this? C
.C D

unitOfWorkD N
=O P

unitOfWorkQ [
;[ \
[ 	
HttpGet	 
] 
public 
IActionResult 
Get  
(  !
)! "
{ 	
var 

treatments 
= 

unitOfWork '
.' (
TreatmentRepository( ;
.; <
All< ?
(? @
)@ A
.A B
ResultB H
.H I
SelectI O
(P Q
TreatmentMapperQ `
.` a
Mappera g
.g h
Maph k
<k l
TreatmentDtol x
>x y
)y z
;z {
Response 
. 
Headers 
. 
Add  
(  !
$str! ?
,? @
$strA a
)a b
;b c
Response 
. 
Headers 
. 
Add  
(  !
$str! ?
,? @
$strA b
)b c
;c d
Response 
. 
Headers 
. 
Add  
(  !
$str! >
,> ?
$str@ X
)X Y
;Y Z
return 
Ok 
( 

treatments  
)  !
;! "
} 	
[   	
HttpPost  	 
]   
public!! 
IActionResult!! 
Create!! #
(!!# $
[!!$ %
FromBody!!% -
]!!- .
CreateTreatmentDto!!/ A
treatmentDto!!B N
)!!N O
{"" 	
var## 
validatorResult## 
=##  !'
createTreatmentDtoValidator##" =
.##= >
Validate##> F
(##F G
treatmentDto##G S
)##S T
;##T U
if$$ 
($$ 
!$$ 
validatorResult$$  
.$$  !
IsValid$$! (
)$$( )
{%% 
return&& 

BadRequest&& !
(&&! "
validatorResult&&" 1
.&&1 2
Errors&&2 8
)&&8 9
;&&9 :
}'' 
var(( 
treat(( 
=(( 
TreatmentMapper(( '
.((' (
Mapper((( .
.((. /
Map((/ 2
<((2 3
	Treatment((3 <
>((< =
(((= >
treatmentDto((> J
)((J K
;((K L
if)) 
()) 
treat)) 
==)) 
null)) 
))) 
{** 
return++ 

BadRequest++ !
(++! "
)++" #
;++# $
},, 

unitOfWork.. 
... 
TreatmentRepository.. *
...* +
Add..+ .
(... /
treat../ 4
)..4 5
;..5 6

unitOfWork// 
.// 
SaveChanges// "
(//" #
)//# $
;//$ %
Response11 
.11 
Headers11 
.11 
Add11  
(11  !
$str11! ?
,11? @
$str11A a
)11a b
;11b c
Response22 
.22 
Headers22 
.22 
Add22  
(22  !
$str22! ?
,22? @
$str22A b
)22b c
;22c d
Response33 
.33 
Headers33 
.33 
Add33  
(33  !
$str33! >
,33> ?
$str33@ X
)33X Y
;33Y Z
return44 
Created44 
(44 
nameof44 !
(44! "
Get44" %
)44% &
,44& '
TreatmentMapper44( 7
.447 8
Mapper448 >
.44> ?
Map44? B
<44B C
TreatmentDto44C O
>44O P
(44P Q
treat44Q V
)44V W
)44W X
;44X Y
}55 	
[77 	
HttpPost77	 
(77 
$str77 6
)776 7
]777 8
public88 
IActionResult88 
AddDrugsToTreatment88 0
(880 1
Guid881 5
treatmentId886 A
,88A B
[88C D
FromBody88D L
]88L M
List88N R
<88R S
PrescribedDrugDto88S d
>88d e
prescribedDrugDtos88f x
)88x y
{99 	
var:: 
	treatment:: 
=:: 

unitOfWork:: &
.::& '
TreatmentRepository::' :
.::: ;
Get::; >
(::> ?
treatmentId::? J
)::J K
.::K L
Result::L R
;::R S
if;; 
(;; 
	treatment;; 
==;; 
null;; !
);;! "
{<< 
return== 
NotFound== 
(==  
)==  !
;==! "
}>> 
foreach@@ 
(@@ 
var@@ 
prescribedDrug@@ '
in@@( *
prescribedDrugDtos@@+ =
)@@= >
{AA 
varBB 
validatorResultBB #
=BB$ %,
 createPrescribedDrugDtoValidatorBB& F
.BBF G
ValidateBBG O
(BBO P
prescribedDrugBBP ^
)BB^ _
;BB_ `
ifCC 
(CC 
!CC 
validatorResultCC $
.CC$ %
IsValidCC% ,
)CC, -
{DD 
returnEE 

BadRequestEE %
(EE% &
validatorResultEE& 5
.EE5 6
ErrorsEE6 <
)EE< =
;EE= >
}FF 
}GG 
varII 
drugsII 
=II 
prescribedDrugDtosII *
.II* +
SelectII+ 1
(II1 2 
PrescribedDrugMapperII2 F
.IIF G
MapperIIG M
.IIM N
MapIIN Q
<IIQ R
PrescribedDrugIIR `
>II` a
)IIa b
.IIb c
ToListIIc i
(IIi j
)IIj k
;IIk l
ifJJ 
(JJ 
drugsJJ 
.JJ 
AnyJJ 
(JJ 
pJJ 
=>JJ 
pJJ  
==JJ! #
nullJJ$ (
)JJ( )
)JJ) *
{KK 
returnLL 

BadRequestLL !
(LL! "
)LL" #
;LL# $
}MM 
varOO 
resultOO 
=OO 
	treatmentOO "
.OO" #"
AppendDrugsToTreatmentOO# 9
(OO9 :
drugsOO: ?
)OO? @
;OO@ A
ifPP 
(PP 
resultPP 
.PP 
	IsFailurePP  
)PP  !
{QQ 
returnRR 

BadRequestRR !
(RR! "
resultRR" (
.RR( )
ErrorRR) .
)RR. /
;RR/ 0
}SS 
drugsUU 
.UU 
ForEachUU 
(UU 
pUU 
=>UU 

unitOfWorkUU )
.UU) *$
PrescribedDrugRepositoryUU* B
.UUB C
AddUUC F
(UUF G
pUUG H
)UUH I
)UUI J
;UUJ K

unitOfWorkVV 
.VV 
SaveChangesVV "
(VV" #
)VV# $
;VV$ %
ResponseXX 
.XX 
HeadersXX 
.XX 
AddXX  
(XX  !
$strXX! ?
,XX? @
$strXXA a
)XXa b
;XXb c
ResponseYY 
.YY 
HeadersYY 
.YY 
AddYY  
(YY  !
$strYY! ?
,YY? @
$strYYA b
)YYb c
;YYc d
ResponseZZ 
.ZZ 
HeadersZZ 
.ZZ 
AddZZ  
(ZZ  !
$strZZ! >
,ZZ> ?
$strZZ@ X
)ZZX Y
;ZZY Z
return[[ 
	NoContent[[ 
([[ 
)[[ 
;[[ 
}\\ 	
[^^ 	
HttpPut^^	 
(^^ 
$str^^ %
)^^% &
]^^& '
public__ 
IActionResult__ 
UpdateTreatment__ ,
(__, -
Guid__- 1
treatmentId__2 =
,__= >
[__? @
FromBody__@ H
]__H I
CreateTreatmentDto__J \
treatmentDto__] i
)__i j
{`` 	
varaa 
	treatmentaa 
=aa 

unitOfWorkaa &
.aa& '
TreatmentRepositoryaa' :
.aa: ;
Getaa; >
(aa> ?
treatmentIdaa? J
)aaJ K
.aaK L
ResultaaL R
;aaR S
ifbb 
(bb 
	treatmentbb 
==bb 
nullbb !
)bb! "
{cc 
returndd 
NotFounddd 
(dd  
)dd  !
;dd! "
}ee 
vargg 
validatorResultgg 
=gg  !'
createTreatmentDtoValidatorgg" =
.gg= >
Validategg> F
(ggF G
treatmentDtoggG S
)ggS T
;ggT U
ifhh 
(hh 
!hh 
validatorResulthh  
.hh  !
IsValidhh! (
)hh( )
{ii 
returnjj 

BadRequestjj !
(jj! "
validatorResultjj" 1
.jj1 2
Errorsjj2 8
)jj8 9
;jj9 :
}kk 
varmm 
resultmm 
=mm 
	treatmentmm "
.mm" #
UpdateDescriptionmm# 4
(mm4 5
treatmentDtomm5 A
.mmA B
DescriptionmmB M
)mmM N
;mmN O
ifnn 
(nn 
resultnn 
.nn 
	IsFailurenn  
)nn  !
{oo 
returnpp 

BadRequestpp !
(pp! "
resultpp" (
.pp( )
Errorpp) .
)pp. /
;pp/ 0
}qq 

unitOfWorkss 
.ss 
TreatmentRepositoryss *
.ss* +
Updatess+ 1
(ss1 2
	treatmentss2 ;
)ss; <
;ss< =

unitOfWorktt 
.tt 
SaveChangestt "
(tt" #
)tt# $
;tt$ %
Responsevv 
.vv 
Headersvv 
.vv 
Addvv  
(vv  !
$strvv! ?
,vv? @
$strvvA a
)vva b
;vvb c
Responseww 
.ww 
Headersww 
.ww 
Addww  
(ww  !
$strww! ?
,ww? @
$strwwA b
)wwb c
;wwc d
Responsexx 
.xx 
Headersxx 
.xx 
Addxx  
(xx  !
$strxx! >
,xx> ?
$strxx@ X
)xxX Y
;xxY Z
returnyy 
	NoContentyy 
(yy 
)yy 
;yy 
}zz 	
[|| 	
HttpPut||	 
(|| 
$str|| L
)||L M
]||M N
public}} 
IActionResult}} !
UpdateDrugInTreatment}} 2
(}}2 3
Guid}}3 7
treatmentId}}8 C
,}}C D
Guid}}E I
prescribedDrugId}}J Z
,}}Z [
[~~ 
FromBody~~ 
]~~ 
PrescribedDrugDto~~ (
prescribedDrugDto~~) :
)~~: ;
{ 	
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
.
��K L
Result
��L R
;
��R S
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
�� 
drugPrescribed
�� 
=
��  

unitOfWork
��! +
.
��+ ,&
PrescribedDrugRepository
��, D
.
��D E
Get
��E H
(
��H I
prescribedDrugId
��I Y
)
��Y Z
.
��Z [
Result
��[ a
;
��a b
if
�� 
(
�� 
drugPrescribed
�� 
==
�� !
null
��" &
)
��& '
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
validatorResult
�� 
=
��  !.
 createPrescribedDrugDtoValidator
��" B
.
��B C
Validate
��C K
(
��K L
prescribedDrugDto
��L ]
)
��] ^
;
��^ _
if
�� 
(
�� 
!
�� 
validatorResult
��  
.
��  !
IsValid
��! (
)
��( )
{
�� 
return
�� 

BadRequest
�� !
(
��! "
validatorResult
��" 1
.
��1 2
Errors
��2 8
)
��8 9
;
��9 :
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
��! "
DrugRepository
��" 0
.
��0 1
Get
��1 4
(
��4 5
prescribedDrugDto
��5 F
.
��F G
DrugId
��G M
)
��M N
.
��N O
Result
��O U
;
��U V
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
�� 
drugPrescribed
�� '
.
��' (
Update
��( .
(
��. /
prescribedDrugDto
��/ @
.
��@ A
Quantity
��A I
,
��I J
drug
��K O
)
��O P
;
��P Q
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
��$ %
Response
�� 
.
�� 
Headers
�� 
.
�� 
Add
��  
(
��  !
$str
��! ?
,
��? @
$str
��A a
)
��a b
;
��b c
Response
�� 
.
�� 
Headers
�� 
.
�� 
Add
��  
(
��  !
$str
��! ?
,
��? @
$str
��A b
)
��b c
;
��c d
Response
�� 
.
�� 
Headers
�� 
.
�� 
Add
��  
(
��  !
$str
��! >
,
��> ?
$str
��@ X
)
��X Y
;
��Y Z
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
.
��K L
Result
��L R
;
��R S
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
.
��P Q
Result
��Q W
;
��W X
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
��$ %
Response
�� 
.
�� 
Headers
�� 
.
�� 
Add
��  
(
��  !
$str
��! ?
,
��? @
$str
��A a
)
��a b
;
��b c
Response
�� 
.
�� 
Headers
�� 
.
�� 
Add
��  
(
��  !
$str
��! ?
,
��? @
$str
��A b
)
��b c
;
��c d
Response
�� 
.
�� 
Headers
�� 
.
�� 
Add
��  
(
��  !
$str
��! >
,
��> ?
$str
��@ X
)
��X Y
;
��Y Z
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
.
��K L
Result
��L R
;
��R S
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
��$ %
Response
�� 
.
�� 
Headers
�� 
.
�� 
Add
��  
(
��  !
$str
��! ?
,
��? @
$str
��A a
)
��a b
;
��b c
Response
�� 
.
�� 
Headers
�� 
.
�� 
Add
��  
(
��  !
$str
��! ?
,
��? @
$str
��A b
)
��b c
;
��c d
Response
�� 
.
�� 
Headers
�� 
.
�� 
Add
��  
(
��  !
$str
��! >
,
��> ?
$str
��@ X
)
��X Y
;
��Y Z
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
\C:\Users\Leonard\Desktop\Clean VetApp\VetAppointment.API\Controllers\VetClinicsController.cs
	namespace		 	
VetAppointment		
 
.		 
API		 
.		 
Controllers		 (
{

 
[ 
Route 

(
 
$str  
)  !
]! "
[ 
ApiController 
] 
public 

class  
VetClinicsController %
:& '
ControllerBase( 6
{ 
private 
readonly 
IUnitOfWork $

unitOfWork% /
;/ 0
private 
readonly '
CreateVetClinicDtoValidator 4'
createVetClinicDtoValidator5 P
=Q R
newS V
(V W
)W X
;X Y
private 
readonly !
CreatePetDtoValidator .!
createPetDtoValidator/ D
=E F
newG J
(J K
)K L
;L M
private 
readonly !
CreateVetDtoValidator .!
createVetDtoValidator/ D
=E F
newG J
(J K
)K L
;L M
private 
readonly )
CreateAppointmentDtoValidator 6)
createAppointmentDtoValidator7 T
=U V
newW Z
(Z [
)[ \
;\ ]
public  
VetClinicsController #
(# $
IUnitOfWork$ /

unitOfWork0 :
): ;
=>< >
this? C
.C D

unitOfWorkD N
=O P

unitOfWorkQ [
;[ \
[ 	
HttpPost	 
] 
public 
IActionResult 
Create #
(# $
[$ %
FromBody% -
]- .
CreateVetClinicDto/ A
vetClinicDtoB N
)N O
{ 	
var 
history 
= 
MedicalHistory (
.( )
Create) /
(/ 0
)0 1
;1 2
var 
validatorResult 
=  !'
createVetClinicDtoValidator" =
.= >
Validate> F
(F G
vetClinicDtoG S
)S T
;T U
if 
( 
! 
validatorResult  
.  !
IsValid! (
)( )
{ 
return 

BadRequest !
(! "
validatorResult" 1
.1 2
Errors2 8
)8 9
;9 :
}   
var!! 
	vetClinic!! 
=!! 
VetClinicMapper!! +
.!!+ ,
Mapper!!, 2
.!!2 3
Map!!3 6
<!!6 7
	VetClinic!!7 @
>!!@ A
(!!A B
vetClinicDto!!B N
)!!N O
;!!O P
if## 
(## 
	vetClinic## 
==## 
null## !
)##! "
{$$ 
return%% 

BadRequest%% !
(%%! "
)%%" #
;%%# $
}&& 
history(( 
.(( 
Entity(( 
.(( 
AtachToClinic(( (
(((( )
	vetClinic(() 2
.((2 3
Id((3 5
)((5 6
;((6 7
	vetClinic)) 
.))  
AttachMedicalHistory)) *
())* +
history))+ 2
.))2 3
Entity))3 9
.))9 :
Id)): <
)))< =
;))= >

unitOfWork++ 
.++ $
MedicalHistoryRepository++ /
.++/ 0
Add++0 3
(++3 4
history++4 ;
.++; <
Entity++< B
)++B C
;++C D

unitOfWork,, 
.,, 
SaveChanges,, "
(,," #
),,# $
;,,$ %

unitOfWork.. 
... 
VetClinicRepository.. *
...* +
Add..+ .
(... /
	vetClinic../ 8
)..8 9
;..9 :

unitOfWork// 
.// 
SaveChanges// "
(//" #
)//# $
;//$ %
Response11 
.11 
Headers11 
.11 
Add11  
(11  !
$str11! ?
,11? @
$str11A a
)11a b
;11b c
Response22 
.22 
Headers22 
.22 
Add22  
(22  !
$str22! ?
,22? @
$str22A b
)22b c
;22c d
Response33 
.33 
Headers33 
.33 
Add33  
(33  !
$str33! >
,33> ?
$str33@ X
)33X Y
;33Y Z
return44 
Created44 
(44 
nameof44 !
(44! "
GetAllVetClinics44" 2
)442 3
,443 4
VetClinicMapper445 D
.44D E
Mapper44E K
.44K L
Map44L O
<44O P
VetClinicDto44P \
>44\ ]
(44] ^
	vetClinic44^ g
)44g h
)44h i
;44i j
}55 	
[88 	
HttpGet88	 
]88 
public99 
IActionResult99 
GetAllVetClinics99 -
(99- .
)99. /
{:: 	
var;; 

vetClinics;; 
=;; 

unitOfWork;; '
.;;' (
VetClinicRepository;;( ;
.;;; <
All;;< ?
(;;? @
);;@ A
.;;A B
Result;;B H
.;;H I
Select;;I O
(;;O P
VetClinicMapper;;P _
.;;_ `
Mapper;;` f
.;;f g
Map;;g j
<;;j k
VetClinicDto;;k w
>;;w x
);;x y
;;;y z
Response== 
.== 
Headers== 
.== 
Add==  
(==  !
$str==! ?
,==? @
$str==A a
)==a b
;==b c
Response>> 
.>> 
Headers>> 
.>> 
Add>>  
(>>  !
$str>>! ?
,>>? @
$str>>A b
)>>b c
;>>c d
Response?? 
.?? 
Headers?? 
.?? 
Add??  
(??  !
$str??! >
,??> ?
$str??@ X
)??X Y
;??Y Z
return@@ 
Ok@@ 
(@@ 

vetClinics@@  
)@@  !
;@@! "
}AA 	
[CC 	
HttpGetCC	 
(CC 
$strCC %
)CC% &
]CC& '
publicDD 
IActionResultDD 
GetByIdDD $
(DD$ %
GuidDD% )
vetClinicIdDD* 5
)DD5 6
{EE 	
varFF 
clinicFF 
=FF 

unitOfWorkFF #
.FF# $
VetClinicRepositoryFF$ 7
.FF7 8
GetFF8 ;
(FF; <
vetClinicIdFF< G
)FFG H
.FFH I
ResultFFI O
;FFO P
ifGG 
(GG 
clinicGG 
==GG 
nullGG 
)GG 
{HH 
returnII 
NotFoundII 
(II  
)II  !
;II! "
}JJ 
ResponseLL 
.LL 
HeadersLL 
.LL 
AddLL  
(LL  !
$strLL! ?
,LL? @
$strLLA a
)LLa b
;LLb c
ResponseMM 
.MM 
HeadersMM 
.MM 
AddMM  
(MM  !
$strMM! ?
,MM? @
$strMMA b
)MMb c
;MMc d
ResponseNN 
.NN 
HeadersNN 
.NN 
AddNN  
(NN  !
$strNN! >
,NN> ?
$strNN@ X
)NNX Y
;NNY Z
returnOO 
OkOO 
(OO 
clinicOO 
)OO 
;OO 
}PP 	
[RR 	
HttpGetRR	 
(RR 
$strRR *
)RR* +
]RR+ ,
publicSS 
IActionResultSS 
GetVetsByClinicIdSS .
(SS. /
GuidSS/ 3
vetClinicIdSS4 ?
)SS? @
{TT 	
varUU 
clinicUU 
=UU 

unitOfWorkUU #
.UU# $
VetClinicRepositoryUU$ 7
.UU7 8
GetUU8 ;
(UU; <
vetClinicIdUU< G
)UUG H
.UUH I
ResultUUI O
;UUO P
ifVV 
(VV 
clinicVV 
==VV 
nullVV 
)VV 
{WW 
returnXX 
NotFoundXX 
(XX  
)XX  !
;XX! "
}YY 
var[[ 
vets[[ 
=[[ 
clinic[[ 
.[[ 
Vets[[ "
.[[" #
Select[[# )
([[) *
	VetMapper[[* 3
.[[3 4
Mapper[[4 :
.[[: ;
Map[[; >
<[[> ?
VetDto[[? E
>[[E F
)[[F G
;[[G H
Response]] 
.]] 
Headers]] 
.]] 
Add]]  
(]]  !
$str]]! ?
,]]? @
$str]]A a
)]]a b
;]]b c
Response^^ 
.^^ 
Headers^^ 
.^^ 
Add^^  
(^^  !
$str^^! ?
,^^? @
$str^^A b
)^^b c
;^^c d
Response__ 
.__ 
Headers__ 
.__ 
Add__  
(__  !
$str__! >
,__> ?
$str__@ X
)__X Y
;__Y Z
return`` 
Ok`` 
(`` 
vets`` 
)`` 
;`` 
}aa 	
[cc 	
HttpGetcc	 
(cc 
$strcc *
)cc* +
]cc+ ,
publicdd 
IActionResultdd 
GetPetsByClinicIddd .
(dd. /
Guiddd/ 3
vetClinicIddd4 ?
)dd? @
{ee 	
varff 
clinicff 
=ff 

unitOfWorkff #
.ff# $
VetClinicRepositoryff$ 7
.ff7 8
Getff8 ;
(ff; <
vetClinicIdff< G
)ffG H
.ffH I
ResultffI O
;ffO P
ifgg 
(gg 
clinicgg 
==gg 
nullgg 
)gg 
{hh 
returnii 
NotFoundii 
(ii  
)ii  !
;ii! "
}jj 
varll 
petsll 
=ll 
clinicll 
.ll 
Petsll "
.ll" #
Selectll# )
(ll) *
	PetMapperll* 3
.ll3 4
Mapperll4 :
.ll: ;
Mapll; >
<ll> ?
PetDtoll? E
>llE F
)llF G
;llG H
Responsenn 
.nn 
Headersnn 
.nn 
Addnn  
(nn  !
$strnn! ?
,nn? @
$strnnA a
)nna b
;nnb c
Responseoo 
.oo 
Headersoo 
.oo 
Addoo  
(oo  !
$stroo! ?
,oo? @
$strooA b
)oob c
;ooc d
Responsepp 
.pp 
Headerspp 
.pp 
Addpp  
(pp  !
$strpp! >
,pp> ?
$strpp@ X
)ppX Y
;ppY Z
returnqq 
Okqq 
(qq 
petsqq 
)qq 
;qq 
}rr 	
[tt 	
HttpGettt	 
(tt 
$strtt 2
)tt2 3
]tt3 4
publicuu 
IActionResultuu %
GetAppointmentsByClinicIduu 6
(uu6 7
Guiduu7 ;
vetClinicIduu< G
)uuG H
{vv 	
varww 
clinicww 
=ww 

unitOfWorkww #
.ww# $
VetClinicRepositoryww$ 7
.ww7 8
Getww8 ;
(ww; <
vetClinicIdww< G
)wwG H
.wwH I
ResultwwI O
;wwO P
ifxx 
(xx 
clinicxx 
==xx 
nullxx 
)xx 
{yy 
returnzz 
NotFoundzz 
(zz  
)zz  !
;zz! "
}{{ 
var}} 
medicalHistory}} 
=}}  

unitOfWork}}! +
.}}+ ,$
MedicalHistoryRepository}}, D
.}}D E
Get}}E H
(}}H I
clinic}}I O
.}}O P
MedicalHistoryId}}P `
)}}` a
.}}a b
Result}}b h
;}}h i
var~~ 
appointments~~ 
=~~ 
medicalHistory~~ -
.~~- .
Appointments~~. :
.~~: ;
Select~~; A
(~~A B
AppointmentMapper~~B S
.~~S T
Mapper~~T Z
.~~Z [
Map~~[ ^
<~~^ _
AppointmentDto~~_ m
>~~m n
)~~n o
;~~o p
Response
�� 
.
�� 
Headers
�� 
.
�� 
Add
��  
(
��  !
$str
��! ?
,
��? @
$str
��A a
)
��a b
;
��b c
Response
�� 
.
�� 
Headers
�� 
.
�� 
Add
��  
(
��  !
$str
��! ?
,
��? @
$str
��A b
)
��b c
;
��c d
Response
�� 
.
�� 
Headers
�� 
.
�� 
Add
��  
(
��  !
$str
��! >
,
��> ?
$str
��@ X
)
��X Y
;
��Y Z
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
.
��H I
Result
��I O
;
��O P
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
�� 
foreach
�� 
(
�� 
var
�� 
dto
�� 
in
�� 
petsDtos
��  (
)
��( )
{
�� 
var
�� 
validatorResult
�� #
=
��$ %#
createPetDtoValidator
��& ;
.
��; <
Validate
��< D
(
��D E
dto
��E H
)
��H I
;
��I J
if
�� 
(
�� 
!
�� 
validatorResult
�� $
.
��$ %
IsValid
��% ,
)
��, -
{
�� 
return
�� 

BadRequest
�� %
(
��% &
validatorResult
��& 5
.
��5 6
Errors
��6 <
)
��< =
;
��= >
}
�� 
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
��& '
	PetMapper
��' 0
.
��0 1
Mapper
��1 7
.
��7 8
Map
��8 ;
<
��; <
Pet
��< ?
>
��? @
)
��@ A
.
��A B
ToList
��B H
(
��H I
)
��I J
;
��J K
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
�� 
==
��  "
null
��# '
)
��' (
)
��( )
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
ToList
��@ F
(
��F G
)
��G H
)
��H I
;
��I J
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
)
��< =
)
��= >
;
��> ?
Response
�� 
.
�� 
Headers
�� 
.
�� 
Add
��  
(
��  !
$str
��! ?
,
��? @
$str
��A a
)
��a b
;
��b c
Response
�� 
.
�� 
Headers
�� 
.
�� 
Add
��  
(
��  !
$str
��! ?
,
��? @
$str
��A b
)
��b c
;
��c d
Response
�� 
.
�� 
Headers
�� 
.
�� 
Add
��  
(
��  !
$str
��! >
,
��> ?
$str
��@ X
)
��X Y
;
��Y Z
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
��4 5
pets
��6 :
.
��: ;
Select
��; A
(
��A B
	PetMapper
��B K
.
��K L
Mapper
��L R
.
��R S
Map
��S V
<
��V W
PetDto
��W ]
>
��] ^
)
��^ _
)
��_ `
;
��` a
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
.
��H I
Result
��I O
;
��O P
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
validatorResult
�� 
=
��  !#
createVetDtoValidator
��" 7
.
��7 8
Validate
��8 @
(
��@ A
vetDto
��A G
)
��G H
;
��H I
if
�� 
(
�� 
!
�� 
validatorResult
��  
.
��  !
IsValid
��! (
)
��( )
{
�� 
return
�� 

BadRequest
�� !
(
��! "
validatorResult
��" 1
.
��1 2
Errors
��2 8
)
��8 9
;
��9 :
}
�� 
var
�� 
doctor
�� 
=
�� 
	VetMapper
�� "
.
��" #
Mapper
��# )
.
��) *
Map
��* -
<
��- .
Vet
��. 1
>
��1 2
(
��2 3
vetDto
��3 9
)
��9 :
;
��: ;
if
�� 
(
�� 
doctor
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
)
��: ;
;
��; <
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
)
��/ 0
;
��0 1
Response
�� 
.
�� 
Headers
�� 
.
�� 
Add
��  
(
��  !
$str
��! ?
,
��? @
$str
��A a
)
��a b
;
��b c
Response
�� 
.
�� 
Headers
�� 
.
�� 
Add
��  
(
��  !
$str
��! ?
,
��? @
$str
��A b
)
��b c
;
��c d
Response
�� 
.
�� 
Headers
�� 
.
�� 
Add
��  
(
��  !
$str
��! >
,
��> ?
$str
��@ X
)
��X Y
;
��Y Z
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
	VetMapper
��0 9
.
��9 :
Mapper
��: @
.
��@ A
Map
��A D
<
��D E
VetDto
��E K
>
��K L
(
��L M
doctor
��M S
)
��S T
)
��T U
;
��U V
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
.
��H I
Result
��I O
;
��O P
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
validatorResult
�� 
=
��  !+
createAppointmentDtoValidator
��" ?
.
��? @
Validate
��@ H
(
��H I
appointmentDto
��I W
)
��W X
;
��X Y
if
�� 
(
�� 
!
�� 
validatorResult
��  
.
��  !
IsValid
��! (
)
��( )
{
�� 
return
�� 

BadRequest
�� !
(
��! "
validatorResult
��" 1
.
��1 2
Errors
��2 8
)
��8 9
;
��9 :
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
.
��a b
Result
��b h
;
��h i
var
�� 
pet
�� 
=
�� 

unitOfWork
��  
.
��  !
PetRepository
��! .
.
��. /
Get
��/ 2
(
��2 3
appointmentDto
��3 A
.
��A B
PetId
��B G
)
��G H
.
��H I
Result
��I O
;
��O P
if
�� 
(
�� 
pet
�� 
==
�� 
null
�� 
)
�� 
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
�� 
vet
�� 
=
�� 

unitOfWork
��  
.
��  !
VetRepository
��! .
.
��. /
Get
��/ 2
(
��2 3
appointmentDto
��3 A
.
��A B
VetId
��B G
)
��G H
.
��H I
Result
��I O
;
��O P
if
�� 
(
�� 
vet
�� 
==
�� 
null
�� 
)
�� 
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
�� 
appointment
�� 
=
�� 
AppointmentMapper
�� /
.
��/ 0
Mapper
��0 6
.
��6 7
Map
��7 :
<
��: ;
Appointment
��; F
>
��F G
(
��G H
appointmentDto
��H V
)
��V W
;
��W X
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
�� 
medicalHistory
�� '
.
��' (*
RegisterAppointmentToHistory
��( D
(
��D E
appointment
��E P
)
��P Q
;
��Q R
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
MedicalHistoryRepository
�� /
.
��/ 0
Update
��0 6
(
��6 7
medicalHistory
��7 E
)
��E F
;
��F G

unitOfWork
�� 
.
�� #
AppointmentRepository
�� ,
.
��, -
Add
��- 0
(
��0 1
appointment
��1 <
)
��< =
;
��= >

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
��$ %
Response
�� 
.
�� 
Headers
�� 
.
�� 
Add
��  
(
��  !
$str
��! ?
,
��? @
$str
��A g
)
��g h
;
��h i
Response
�� 
.
�� 
Headers
�� 
.
�� 
Add
��  
(
��  !
$str
��! ?
,
��? @
$str
��A b
)
��b c
;
��c d
Response
�� 
.
�� 
Headers
�� 
.
�� 
Add
��  
(
��  !
$str
��! >
,
��> ?
$str
��@ X
)
��X Y
;
��Y Z
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
AppointmentMapper
��8 I
.
��I J
Mapper
��J P
.
��P Q
Map
��Q T
<
��T U
AppointmentDto
��U c
>
��c d
(
��d e
appointment
��e p
)
��p q
)
��q r
;
��r s
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
.
��H I
Result
��I O
;
��O P
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
validatorResult
�� 
=
��  !)
createVetClinicDtoValidator
��" =
.
��= >
Validate
��> F
(
��F G
vetClinicDto
��G S
)
��S T
;
��T U
if
�� 
(
�� 
!
�� 
validatorResult
��  
.
��  !
IsValid
��! (
)
��( )
{
�� 
return
�� 

BadRequest
�� !
(
��! "
validatorResult
��" 1
.
��1 2
Errors
��2 8
)
��8 9
;
��9 :
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
��$ %
Response
�� 
.
�� 
Headers
�� 
.
�� 
Add
��  
(
��  !
$str
��! ?
,
��? @
$str
��A g
)
��g h
;
��h i
Response
�� 
.
�� 
Headers
�� 
.
�� 
Add
��  
(
��  !
$str
��! ?
,
��? @
$str
��A b
)
��b c
;
��c d
Response
�� 
.
�� 
Headers
�� 
.
�� 
Add
��  
(
��  !
$str
��! >
,
��> ?
$str
��@ X
)
��X Y
;
��Y Z
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
��N O
CreateVetDto
��P \
vetDto
��] c
)
��c d
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
.
��H I
Result
��I O
;
��O P
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
.
��9 :
Result
��: @
;
��@ A
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
�� 
validatorResult
�� 
=
��  !#
createVetDtoValidator
��" 7
.
��7 8
Validate
��8 @
(
��@ A
vetDto
��A G
)
��G H
;
��H I
if
�� 
(
�� 
!
�� 
validatorResult
��  
.
��  !
IsValid
��! (
)
��( )
{
�� 
return
�� 

BadRequest
�� !
(
��! "
validatorResult
��" 1
.
��1 2
Errors
��2 8
)
��8 9
;
��9 :
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
��$ %
Response
�� 
.
�� 
Headers
�� 
.
�� 
Add
��  
(
��  !
$str
��! ?
,
��? @
$str
��A g
)
��g h
;
��h i
Response
�� 
.
�� 
Headers
�� 
.
�� 
Add
��  
(
��  !
$str
��! ?
,
��? @
$str
��A b
)
��b c
;
��c d
Response
�� 
.
�� 
Headers
�� 
.
�� 
Add
��  
(
��  !
$str
��! >
,
��> ?
$str
��@ X
)
��X Y
;
��Y Z
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
��N O
CreatePetDto
��P \
petDto
��] c
)
��c d
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
.
��H I
Result
��I O
;
��O P
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
.
��9 :
Result
��: @
;
��@ A
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
�� 
validatorResult
�� 
=
��  !#
createPetDtoValidator
��" 7
.
��7 8
Validate
��8 @
(
��@ A
petDto
��A G
)
��G H
;
��H I
if
�� 
(
�� 
!
�� 
validatorResult
��  
.
��  !
IsValid
��! (
)
��( )
{
�� 
return
�� 

BadRequest
�� !
(
��! "
validatorResult
��" 1
.
��1 2
Errors
��2 8
)
��8 9
;
��9 :
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
��$ %
Response
�� 
.
�� 
Headers
�� 
.
�� 
Add
��  
(
��  !
$str
��! ?
,
��? @
$str
��A a
)
��a b
;
��b c
Response
�� 
.
�� 
Headers
�� 
.
�� 
Add
��  
(
��  !
$str
��! ?
,
��? @
$str
��A b
)
��b c
;
��c d
Response
�� 
.
�� 
Headers
�� 
.
�� 
Add
��  
(
��  !
$str
��! >
,
��> ?
$str
��@ X
)
��X Y
;
��Y Z
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
�� 

unitOfWork
�� &
.
��& '!
VetClinicRepository
��' :
.
��: ;
Get
��; >
(
��> ?
vetClinicId
��? J
)
��J K
.
��K L
Result
��L R
;
��R S
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
�� 
var
�� 
medicalHistorys
�� 
=
��  !

unitOfWork
��" ,
.
��, -&
MedicalHistoryRepository
��- E
.
��E F
All
��F I
(
��I J
)
��J K
.
��K L
Result
��L R
.
��R S
Where
��S X
(
��X Y
m
��Y Z
=>
��[ ]
m
��^ _
.
��_ `
ClinicId
��` h
==
��i k
vetClinicId
��l w
)
��w x
;
��x y
if
�� 
(
�� 
medicalHistorys
�� 
!=
��  "
null
��# '
)
��' (
{
�� 
foreach
�� 
(
�� 
var
�� 
item
�� !
in
��" $
medicalHistorys
��% 4
)
��4 5
{
�� 

unitOfWork
�� 
.
�� &
MedicalHistoryRepository
�� 7
.
��7 8
Delete
��8 >
(
��> ?
item
��? C
)
��C D
;
��D E
}
�� 
}
�� 
var
�� 
vets
�� 
=
�� 

unitOfWork
�� !
.
��! "
VetRepository
��" /
.
��/ 0
All
��0 3
(
��3 4
)
��4 5
.
��5 6
Result
��6 <
.
��< =
Where
��= B
(
��B C
v
��C D
=>
��E G
v
��H I
.
��I J
ClinicId
��J R
==
��S U
vetClinicId
��V a
)
��a b
;
��b c
if
�� 
(
�� 
vets
�� 
!=
�� 
null
�� 
)
�� 
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
��5 6
Result
��6 <
.
��< =
Where
��= B
(
��B C
p
��C D
=>
��E G
p
��H I
.
��I J
ClinicId
��J R
==
��S U
vetClinicId
��V a
)
��a b
;
��b c
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
��$ %
Response
�� 
.
�� 
Headers
�� 
.
�� 
Add
��  
(
��  !
$str
��! ?
,
��? @
$str
��A a
)
��a b
;
��b c
Response
�� 
.
�� 
Headers
�� 
.
�� 
Add
��  
(
��  !
$str
��! >
,
��> ?
$str
��@ X
)
��X Y
;
��Y Z
Response
�� 
.
�� 
Headers
�� 
.
�� 
Add
��  
(
��  !
$str
��! ?
,
��? @
$str
��A b
)
��b c
;
��c d
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
.
��H I
Result
��I O
;
��O P
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
.
��9 :
Result
��: @
;
��@ A
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
��$ %
Response
�� 
.
�� 
Headers
�� 
.
�� 
Add
��  
(
��  !
$str
��! ?
,
��? @
$str
��A a
)
��a b
;
��b c
Response
�� 
.
�� 
Headers
�� 
.
�� 
Add
��  
(
��  !
$str
��! ?
,
��? @
$str
��A b
)
��b c
;
��c d
Response
�� 
.
�� 
Headers
�� 
.
�� 
Add
��  
(
��  !
$str
��! >
,
��> ?
$str
��@ X
)
��X Y
;
��Y Z
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
.
��H I
Result
��I O
;
��O P
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
.
��9 :
Result
��: @
;
��@ A
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
��$ %
Response
�� 
.
�� 
Headers
�� 
.
�� 
Add
��  
(
��  !
$str
��! ?
,
��? @
$str
��A a
)
��a b
;
��b c
Response
�� 
.
�� 
Headers
�� 
.
�� 
Add
��  
(
��  !
$str
��! ?
,
��? @
$str
��A b
)
��b c
;
��c d
Response
�� 
.
�� 
Headers
�� 
.
�� 
Add
��  
(
��  !
$str
��! >
,
��> ?
$str
��@ X
)
��X Y
;
��Y Z
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
}�� �
VC:\Users\Leonard\Desktop\Clean VetApp\VetAppointment.API\Controllers\VetsController.cs
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
.$ %
All% (
(( )
)) *
.* +
Result+ 1
.1 2
Select2 8
(8 9
	VetMapper9 B
.B C
MapperC I
.I J
MapJ M
<M N
VetDtoN T
>T U
)U V
;V W
Response 
. 
Headers 
. 
Add  
(  !
$str! ?
,? @
$strA a
)a b
;b c
Response 
. 
Headers 
. 
Add  
(  !
$str! ?
,? @
$strA b
)b c
;c d
Response 
. 
Headers 
. 
Add  
(  !
$str! >
,> ?
$str@ X
)X Y
;Y Z
return 
Ok 
( 
vets 
) 
; 
} 	
} 
} �
OC:\Users\Leonard\Desktop\Clean VetApp\VetAppointment.API\Dtos\AppointmentDto.cs
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

\C:\Users\Leonard\Desktop\Clean VetApp\VetAppointment.API\Dtos\Create\CreateAppointmentDto.cs
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
string 
? 
ScheduledDate $
{% &
get' *
;* +
set, /
;/ 0
}1 2
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
UC:\Users\Leonard\Desktop\Clean VetApp\VetAppointment.API\Dtos\Create\CreateDrugDto.cs
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
 �
TC:\Users\Leonard\Desktop\Clean VetApp\VetAppointment.API\Dtos\Create\CreatePetDto.cs
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
YC:\Users\Leonard\Desktop\Clean VetApp\VetAppointment.API\Dtos\Create\CreatePetOwnerDto.cs
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
} �
_C:\Users\Leonard\Desktop\Clean VetApp\VetAppointment.API\Dtos\Create\CreatePrescribedDrugDto.cs
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
ZC:\Users\Leonard\Desktop\Clean VetApp\VetAppointment.API\Dtos\Create\CreateTreatmentDto.cs
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
ZC:\Users\Leonard\Desktop\Clean VetApp\VetAppointment.API\Dtos\Create\CreateVetClinicDto.cs
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
TC:\Users\Leonard\Desktop\Clean VetApp\VetAppointment.API\Dtos\Create\CreateVetDto.cs
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
} �
HC:\Users\Leonard\Desktop\Clean VetApp\VetAppointment.API\Dtos\DrugDto.cs
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
 �
RC:\Users\Leonard\Desktop\Clean VetApp\VetAppointment.API\Dtos\MedicalHistoryDto.cs
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
} �
GC:\Users\Leonard\Desktop\Clean VetApp\VetAppointment.API\Dtos\PetDto.cs
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
}		 �
LC:\Users\Leonard\Desktop\Clean VetApp\VetAppointment.API\Dtos\PetOwnerDto.cs
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
RC:\Users\Leonard\Desktop\Clean VetApp\VetAppointment.API\Dtos\PrescribedDrugDto.cs
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
}		 �
MC:\Users\Leonard\Desktop\Clean VetApp\VetAppointment.API\Dtos\TreatmentDto.cs
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
}		 �
MC:\Users\Leonard\Desktop\Clean VetApp\VetAppointment.API\Dtos\VetClinicDto.cs
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
GC:\Users\Leonard\Desktop\Clean VetApp\VetAppointment.API\Dtos\VetDto.cs
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
} �
UC:\Users\Leonard\Desktop\Clean VetApp\VetAppointment.API\Mappers\AppointmentMapper.cs
	namespace 	
VetAppointment
 
. 
API 
. 
Mappers $
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
p 
. 
	GetMethod 
.  
IsPublic  (
||) +
p 
. 
	GetMethod 
.  

IsAssembly  *
;* +
cfg 
. 

AddProfile "
<" #$
AppointmentMapperProfile# ;
>; <
(< =
)= >
;> ?
} 
) 
; 
var 
mapper 
= 
config #
.# $
CreateMapper$ 0
(0 1
)1 2
;2 3
return 
mapper 
; 
} 
) 
; 
public 
static 
IMapper 
Mapper $
=>% '
Lazy( ,
., -
Value- 2
;2 3
} 
} �
\C:\Users\Leonard\Desktop\Clean VetApp\VetAppointment.API\Mappers\AppointmentMapperProfile.cs
	namespace 	
VetAppointment
 
. 
API 
. 
Mappers $
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
,! "
AppointmentDto# 1
>1 2
(2 3
)3 4
;4 5
	CreateMap 
<  
CreateAppointmentDto *
,* +
Appointment, 7
>7 8
(8 9
)9 :
;: ;
} 	
} 
} �
NC:\Users\Leonard\Desktop\Clean VetApp\VetAppointment.API\Mappers\DrugMapper.cs
	namespace 	
VetAppointment
 
. 
API 
. 
Mappers $
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
p 
. 
	GetMethod 
.  
IsPublic  (
||) +
p 
. 
	GetMethod 
.  

IsAssembly  *
;* +
cfg 
. 

AddProfile "
<" #
DrugMapperProfile# 4
>4 5
(5 6
)6 7
;7 8
} 
) 
; 
var 
mapper 
= 
config #
.# $
CreateMapper$ 0
(0 1
)1 2
;2 3
return 
mapper 
; 
} 
) 
; 
public 
static 
IMapper 
Mapper $
=>% '
Lazy( ,
., -
Value- 2
;2 3
} 
} �
UC:\Users\Leonard\Desktop\Clean VetApp\VetAppointment.API\Mappers\DrugMapperProfile.cs
	namespace 	
VetAppointment
 
. 
API 
. 
Mappers $
{ 
public 

class 
DrugMapperProfile "
:# $
Profile% ,
{		 
public

 
DrugMapperProfile
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
< 
Drug 
, 
DrugDto #
># $
($ %
)% &
;& '
	CreateMap 
< 
CreateDrugDto #
,# $
Drug% )
>) *
(* +
)+ ,
;, -
} 	
} 
} �
XC:\Users\Leonard\Desktop\Clean VetApp\VetAppointment.API\Mappers\MedicalHistoryMapper.cs
	namespace 	
VetAppointment
 
. 
API 
. 
Mappers $
{ 
public 

static 
class  
MedicalHistoryMapper ,
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
p 
. 
	GetMethod 
.  
IsPublic  (
||) +
p 
. 
	GetMethod 
.  

IsAssembly  *
;* +
cfg 
. 

AddProfile "
<" #'
MedicalHistoryMapperProfile# >
>> ?
(? @
)@ A
;A B
} 
) 
; 
var 
mapper 
= 
config #
.# $
CreateMapper$ 0
(0 1
)1 2
;2 3
return 
mapper 
; 
} 
) 
; 
public 
static 
IMapper 
Mapper $
=>% '
Lazy( ,
., -
Value- 2
;2 3
} 
} �
_C:\Users\Leonard\Desktop\Clean VetApp\VetAppointment.API\Mappers\MedicalHistoryMapperProfile.cs
	namespace 	
VetAppointment
 
. 
API 
. 
Mappers $
{ 
public 

class '
MedicalHistoryMapperProfile ,
:- .
Profile/ 6
{ 
public		 '
MedicalHistoryMapperProfile		 *
(		* +
)		+ ,
{

 	
	CreateMap 
< 
MedicalHistory $
,$ %
MedicalHistoryDto& 7
>7 8
(8 9
)9 :
;: ;
	CreateMap 
< 
MedicalHistoryDto '
,' (
MedicalHistory) 7
>7 8
(8 9
)9 :
;: ;
} 	
} 
} �
MC:\Users\Leonard\Desktop\Clean VetApp\VetAppointment.API\Mappers\PetMapper.cs
	namespace 	
VetAppointment
 
. 
API 
. 
Mappers $
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
p 
. 
	GetMethod 
.  
IsPublic  (
||) +
p 
. 
	GetMethod 
.  

IsAssembly  *
;* +
cfg 
. 

AddProfile "
<" #
PetMappingProfile# 4
>4 5
(5 6
)6 7
;7 8
} 
) 
; 
var 
mapper 
= 
config #
.# $
CreateMapper$ 0
(0 1
)1 2
;2 3
return 
mapper 
; 
} 
) 
; 
public 
static 
IMapper 
Mapper $
=>% '
Lazy( ,
., -
Value- 2
;2 3
} 
} �
UC:\Users\Leonard\Desktop\Clean VetApp\VetAppointment.API\Mappers\PetMappingProfile.cs
	namespace 	
VetAppointment
 
. 
API 
. 
Mappers $
{ 
public 

class 
PetMappingProfile "
:# $
Profile% ,
{		 
public

 
PetMappingProfile
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
Pet 
, 
PetDto !
>! "
(" #
)# $
;$ %
	CreateMap 
< 
CreatePetDto "
," #
Pet$ '
>' (
(( )
)) *
;* +
} 	
} 
} �
RC:\Users\Leonard\Desktop\Clean VetApp\VetAppointment.API\Mappers\PetOwnerMapper.cs
	namespace 	
VetAppointment
 
. 
API 
. 
Mappers $
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
p 
. 
	GetMethod 
.  
IsPublic  (
||) +
p 
. 
	GetMethod 
.  

IsAssembly  *
;* +
cfg 
. 

AddProfile "
<" #!
PetOwnerMapperProfile# 8
>8 9
(9 :
): ;
;; <
} 
) 
; 
var 
mapper 
= 
config #
.# $
CreateMapper$ 0
(0 1
)1 2
;2 3
return 
mapper 
; 
} 
) 
; 
public 
static 
IMapper 
Mapper $
=>% '
Lazy( ,
., -
Value- 2
;2 3
} 
} �
YC:\Users\Leonard\Desktop\Clean VetApp\VetAppointment.API\Mappers\PetOwnerMapperProfile.cs
	namespace 	
VetAppointment
 
. 
API 
. 
Mappers $
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
, 
PetOwnerDto  +
>+ ,
(, -
)- .
;. /
	CreateMap 
< 
CreatePetOwnerDto '
,' (
PetOwner) 1
>1 2
(2 3
)3 4
;4 5
} 	
} 
} �
XC:\Users\Leonard\Desktop\Clean VetApp\VetAppointment.API\Mappers\PrescribedDrugMapper.cs
	namespace 	
VetAppointment
 
. 
API 
. 
Mappers $
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
p 
. 
	GetMethod 
.  
IsPublic  (
||) +
p 
. 
	GetMethod 
.  

IsAssembly  *
;* +
cfg 
. 

AddProfile "
<" #'
PrescribedDrugMapperProfile# >
>> ?
(? @
)@ A
;A B
} 
) 
; 
var 
mapper 
= 
config #
.# $
CreateMapper$ 0
(0 1
)1 2
;2 3
return 
mapper 
; 
} 
) 
; 
public 
static 
IMapper 
Mapper $
=>% '
Lazy( ,
., -
Value- 2
;2 3
} 
} �
_C:\Users\Leonard\Desktop\Clean VetApp\VetAppointment.API\Mappers\PrescribedDrugMapperProfile.cs
	namespace 	
VetAppointment
 
. 
API 
. 
Mappers $
{ 
public 

class '
PrescribedDrugMapperProfile ,
:- .
Profile/ 6
{		 
public

 '
PrescribedDrugMapperProfile

 *
(

* +
)

+ ,
{ 	
	CreateMap 
< 
PrescribedDrug $
,$ %
PrescribedDrugDto& 7
>7 8
(8 9
)9 :
;: ;
	CreateMap 
< #
CreatePrescribedDrugDto -
,- .
PrescribedDrug/ =
>= >
(> ?
)? @
;@ A
} 	
} 
} �
SC:\Users\Leonard\Desktop\Clean VetApp\VetAppointment.API\Mappers\TreatmentMapper.cs
	namespace 	
VetAppointment
 
. 
API 
. 
Mappers $
{ 
public 

static 
class 
TreatmentMapper '
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
p 
. 
	GetMethod 
.  
IsPublic  (
||) +
p 
. 
	GetMethod 
.  

IsAssembly  *
;* +
cfg 
. 

AddProfile "
<" #"
TreatmentMapperProfile# 9
>9 :
(: ;
); <
;< =
} 
) 
; 
var 
mapper 
= 
config #
.# $
CreateMapper$ 0
(0 1
)1 2
;2 3
return 
mapper 
; 
} 
) 
; 
public 
static 
IMapper 
Mapper $
=>% '
Lazy( ,
., -
Value- 2
;2 3
} 
} �
ZC:\Users\Leonard\Desktop\Clean VetApp\VetAppointment.API\Mappers\TreatmentMapperProfile.cs
	namespace 	
VetAppointment
 
. 
API 
. 
Mappers $
{ 
public 

class "
TreatmentMapperProfile '
:( )
Profile* 1
{		 
public

 "
TreatmentMapperProfile
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
	Treatment 
,  
TreatmentDto! -
>- .
(. /
)/ 0
;0 1
	CreateMap 
< 
CreateTreatmentDto (
,( )
	Treatment* 3
>3 4
(4 5
)5 6
;6 7
} 	
} 
} �
SC:\Users\Leonard\Desktop\Clean VetApp\VetAppointment.API\Mappers\VetClinicMapper.cs
	namespace 	
VetAppointment
 
. 
API 
. 
Mappers $
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
p 
. 
	GetMethod 
.  
IsPublic  (
||) +
p 
. 
	GetMethod 
.  

IsAssembly  *
;* +
cfg 
. 

AddProfile "
<" #"
VetClinicMapperProfile# 9
>9 :
(: ;
); <
;< =
} 
) 
; 
var 
mapper 
= 
config #
.# $
CreateMapper$ 0
(0 1
)1 2
;2 3
return 
mapper 
; 
} 
) 
; 
public 
static 
IMapper 
Mapper $
=>% '
Lazy( ,
., -
Value- 2
;2 3
} 
} �
ZC:\Users\Leonard\Desktop\Clean VetApp\VetAppointment.API\Mappers\VetClinicMapperProfile.cs
	namespace 	
VetAppointment
 
. 
API 
. 
Mappers $
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
,  
VetClinicDto! -
>- .
(. /
)/ 0
;0 1
	CreateMap 
< 
CreateVetClinicDto (
,( )
	VetClinic* 3
>3 4
(4 5
)5 6
;6 7
} 	
} 
} �
MC:\Users\Leonard\Desktop\Clean VetApp\VetAppointment.API\Mappers\VetMapper.cs
	namespace 	
VetAppointment
 
. 
API 
. 
Mappers $
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
p 
. 
	GetMethod 
.  
IsPublic  (
||) +
p 
. 
	GetMethod 
.  

IsAssembly  *
;* +
cfg 
. 

AddProfile "
<" #
VetMappingProfile# 4
>4 5
(5 6
)6 7
;7 8
} 
) 
; 
var 
mapper 
= 
config #
.# $
CreateMapper$ 0
(0 1
)1 2
;2 3
return 
mapper 
; 
} 
) 
; 
public 
static 
IMapper 
Mapper $
=>% '
Lazy( ,
., -
Value- 2
;2 3
} 
} �
UC:\Users\Leonard\Desktop\Clean VetApp\VetAppointment.API\Mappers\VetMappingProfile.cs
	namespace 	
VetAppointment
 
. 
API 
. 
Mappers $
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
, 
VetDto !
>! "
(" #
)# $
;$ %
	CreateMap 
< 
CreateVetDto "
," #
Vet$ '
>' (
(( )
)) *
;* +
} 	
} 
} �0
CC:\Users\Leonard\Desktop\Clean VetApp\VetAppointment.API\Program.cs
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
builder 
. 
Services 
. 
AddTransient 
< 
IUnitOfWork )
,) *

UnitOfWork+ 5
>5 6
(6 7
)7 8
;8 9
builder 
. 
Services 
. 
	AddScoped 
< 
IRepository &
<& '
Appointment' 2
>2 3
,3 4!
AppointmentRepository5 J
>J K
(K L
)L M
;M N
builder 
. 
Services 
. 
	AddScoped 
< 
IRepository &
<& '
PetOwner' /
>/ 0
,0 1
PetOwnerRepository2 D
>D E
(E F
)F G
;G H
builder 
. 
Services 
. 
	AddScoped 
< 
IRepository &
<& '
Pet' *
>* +
,+ ,
PetRepository- :
>: ;
(; <
)< =
;= >
builder 
. 
Services 
. 
	AddScoped 
< 
IRepository &
<& '
	VetClinic' 0
>0 1
,1 2
VetClinicRepository3 F
>F G
(G H
)H I
;I J
builder 
. 
Services 
. 
	AddScoped 
< 
IRepository &
<& '
Vet' *
>* +
,+ ,
VetRepository- :
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
<& '
Drug' +
>+ ,
,, -
DrugRepository. <
>< =
(= >
)> ?
;? @
builder   
.   
Services   
.   
	AddScoped   
<   
IRepository   &
<  & '
MedicalHistory  ' 5
>  5 6
,  6 7$
MedicalHistoryRepository  8 P
>  P Q
(  Q R
)  R S
;  S T
builder!! 
.!! 
Services!! 
.!! 
	AddScoped!! 
<!! 
IRepository!! &
<!!& '
PrescribedDrug!!' 5
>!!5 6
,!!6 7$
PrescribedDrugRepository!!8 P
>!!P Q
(!!Q R
)!!R S
;!!S T
builder"" 
."" 
Services"" 
."" 
	AddScoped"" 
<"" 
IRepository"" &
<""& '
	Treatment""' 0
>""0 1
,""1 2
TreatmentRepository""3 F
>""F G
(""G H
)""H I
;""I J
builder$$ 
.$$ 
Services$$ 
.$$ 
AddCors$$ 
($$ 
options$$  
=>$$! #
{%% 
options&& 
.&& 
AddDefaultPolicy&& 
(&& 
builder&& $
=>&&% '
{'' 
builder(( 
.(( 
WithOrigins(( 
((( 
$str(( 4
)((4 5
.((5 6
WithMethods)) 
()) 
$str)) 
,)) 
$str)) !
,))! "
$str))# (
,))( )
$str))* 2
)))2 3
.))3 4
WithHeaders))4 ?
())? @
$str))@ N
,))N O
$str))P b
)))b c
;))c d
}** 
)** 
;** 
options,, 
.,, 
	AddPolicy,, 
(,, 
name,, 
:,, 
$str,, )
,,,) *
builder,,+ 2
=>,,3 5
{-- 
builder.. 
... 
WithOrigins.. 
(.. 
$str.. 4
)..4 5
...5 6
WithMethods// 
(// 
$str// 
,// 
$str// !
,//! "
$str//# (
,//( )
$str//* 2
)//2 3
.//3 4
WithHeaders//4 ?
(//? @
$str//@ N
,//N O
$str//P b
)//b c
;//c d
}00 
)00 
;00 
}11 
)11 
;11 
builder33 
.33 
Services33 
.33 
AddControllers33 
(33  
)33  !
;33! "
var55 
app55 
=55 	
builder55
 
.55 
Build55 
(55 
)55 
;55 
if88 
(88 
app88 
.88 
Environment88 
.88 
IsDevelopment88 !
(88! "
)88" #
)88# $
{99 
app:: 
.:: 

UseSwagger:: 
(:: 
):: 
;:: 
app;; 
.;; 
UseSwaggerUI;; 
(;; 
);; 
;;; 
}<< 
app>> 
.>> 
UseHttpsRedirection>> 
(>> 
)>> 
;>> 
app?? 
.?? 
UseCors?? 
(?? 
$str?? 
)?? 
;?? 
appAA 
.AA 
UseAuthorizationAA 
(AA 
)AA 
;AA 
appCC 
.CC 
MapControllersCC 
(CC 
)CC 
;CC 
appEE 
.EE 
RunEE 
(EE 
)EE 	
;EE	 
�
dC:\Users\Leonard\Desktop\Clean VetApp\VetAppointment.API\Validators\CreateAppointmentDtoValidator.cs
	namespace 	
VetAppointment
 
. 
API 
. 

Validators '
{ 
public 

class )
CreateAppointmentDtoValidator .
:/ 0
AbstractValidator1 B
<B C 
CreateAppointmentDtoC W
>W X
{ 
public		 )
CreateAppointmentDtoValidator		 ,
(		, -
)		- .
{

 	
RuleFor 
( 
dto 
=> 
dto 
. 
ScheduledDate ,
), -
.- .
NotNull. 5
(5 6
)6 7
.7 8
NotEmpty8 @
(@ A
)A B
.B C
MustC G
(G H
newH K
ValidationsL W
(W X
)X Y
.Y Z
BeValidDateZ e
)e f
;f g
RuleFor 
( 
dto 
=> 
dto 
. &
EstimatedDurationInMinutes 9
)9 :
.: ;
NotNull; B
(B C
)C D
.D E
NotEmptyE M
(M N
)N O
.O P
GreaterThanP [
([ \
$num\ ]
)] ^
;^ _
RuleFor 
( 
dto 
=> 
dto 
. 
VetId $
)$ %
.% &
NotNull& -
(- .
). /
./ 0
NotEmpty0 8
(8 9
)9 :
;: ;
RuleFor 
( 
dto 
=> 
dto 
. 
PetId $
)$ %
.% &
NotNull& -
(- .
). /
./ 0
NotEmpty0 8
(8 9
)9 :
;: ;
RuleFor 
( 
dto 
=> 
dto 
. 
TreatmentId *
)* +
.+ ,
NotNull, 3
(3 4
)4 5
.5 6
NotEmpty6 >
(> ?
)? @
;@ A
RuleFor 
( 
dto 
=> 
dto 
. 
MedicalHistoryId /
)/ 0
.0 1
NotNull1 8
(8 9
)9 :
.: ;
NotEmpty; C
(C D
)D E
;E F
} 	
} 
} �
]C:\Users\Leonard\Desktop\Clean VetApp\VetAppointment.API\Validators\CreateDrugDtoValidator.cs
	namespace 	
VetAppointment
 
. 
API 
. 

Validators '
{ 
public 

class "
CreateDrugDtoValidator '
:( )
AbstractValidator* ;
<; <
CreateDrugDto< I
>I J
{ 
public "
CreateDrugDtoValidator %
(% &
)& '
{		 	
RuleFor

 
(

 
dto

 
=>

 
dto

 
.

 
Name

 #
)

# $
.

$ %
NotNull

% ,
(

, -
)

- .
.

. /
NotEmpty

/ 7
(

7 8
)

8 9
.

9 :
Length

: @
(

@ A
$num

A B
,

B C
$num

D G
)

G H
;

H I
RuleFor 
( 
dto 
=> 
dto 
. 
Quantity '
)' (
.( )
NotNull) 0
(0 1
)1 2
.2 3
NotEmpty3 ;
(; <
)< =
;= >
RuleFor 
( 
dto 
=> 
dto 
. 
	UnitPrice (
)( )
.) *
NotNull* 1
(1 2
)2 3
.3 4
NotEmpty4 <
(< =
)= >
;> ?
} 	
} 
} �
\C:\Users\Leonard\Desktop\Clean VetApp\VetAppointment.API\Validators\CreatePetDtoValidator.cs
	namespace 	
VetAppointment
 
. 
API 
. 

Validators '
{ 
public 

class !
CreatePetDtoValidator &
:' (
AbstractValidator) :
<: ;
CreatePetDto; G
>G H
{ 
public !
CreatePetDtoValidator $
($ %
)% &
{		 	
RuleFor

 
(

 
dto

 
=>

 
dto

 
.

 
Name

 #
)

# $
.

$ %
NotNull

% ,
(

, -
)

- .
.

. /
NotEmpty

/ 7
(

7 8
)

8 9
.

9 :
Length

: @
(

@ A
$num

A B
,

B C
$num

D G
)

G H
;

H I
RuleFor 
( 
dto 
=> 
dto 
. 
	Birthdate (
)( )
.) *
NotNull* 1
(1 2
)2 3
.3 4
NotEmpty4 <
(< =
)= >
.> ?
Must? C
(C D
newD G
ValidationsH S
(S T
)T U
.U V
BeValidDateV a
)a b
;b c
RuleFor 
( 
dto 
=> 
dto 
. 
Race #
)# $
.$ %
NotNull% ,
(, -
)- .
.. /
NotEmpty/ 7
(7 8
)8 9
.9 :
Must: >
(> ?
new? B
ValidationsC N
(N O
)O P
.P Q
BeInAnimalRaceEnumQ c
)c d
;d e
RuleFor 
( 
dto 
=> 
dto 
. 
Gender %
)% &
.& '
NotNull' .
(. /
)/ 0
.0 1
NotEmpty1 9
(9 :
): ;
.; <
Must< @
(@ A
newA D
ValidationsE P
(P Q
)Q R
.R S 
BeInAnimalGenderEnumS g
)g h
;h i
} 	
} 
} �
aC:\Users\Leonard\Desktop\Clean VetApp\VetAppointment.API\Validators\CreatePetOwnerDtoValidator.cs
	namespace 	
VetAppointment
 
. 
API 
. 

Validators '
{ 
public 

class &
CreatePetOwnerDtoValidator +
:, -
AbstractValidator. ?
<? @
CreatePetOwnerDto@ Q
>Q R
{ 
public &
CreatePetOwnerDtoValidator )
() *
)* +
{		 	
RuleFor

 
(

 
dto

 
=>

 
dto

 
.

 
Name

 #
)

# $
.

$ %
NotNull

% ,
(

, -
)

- .
.

. /
NotEmpty

/ 7
(

7 8
)

8 9
.

9 :
Length

: @
(

@ A
$num

A B
,

B C
$num

D G
)

G H
;

H I
RuleFor 
( 
dto 
=> 
dto 
. 
Surname &
)& '
.' (
NotNull( /
(/ 0
)0 1
.1 2
NotEmpty2 :
(: ;
); <
.< =
Length= C
(C D
$numD E
,E F
$numG J
)J K
;K L
RuleFor 
( 
dto 
=> 
dto 
. 
	Birthdate (
)( )
.) *
NotNull* 1
(1 2
)2 3
.3 4
NotEmpty4 <
(< =
)= >
.> ?
Must? C
(C D
newD G
ValidationsH S
(S T
)T U
.U V
BeValidDateV a
)a b
;b c
RuleFor 
( 
dto 
=> 
dto 
. 
Gender %
)% &
.& '
NotNull' .
(. /
)/ 0
.0 1
NotEmpty1 9
(9 :
): ;
.; <
Must< @
(@ A
newA D
ValidationsE P
(P Q
)Q R
.R S 
BeInPersonGenderEnumS g
)g h
;h i
RuleFor 
( 
dto 
=> 
dto 
. 
Address &
)& '
.' (
NotNull( /
(/ 0
)0 1
.1 2
NotEmpty2 :
(: ;
); <
.< =
Length= C
(C D
$numD E
,E F
$numG J
)J K
;K L
RuleFor 
( 
dto 
=> 
dto 
. 
Email $
)$ %
.% &
NotNull& -
(- .
). /
./ 0
NotEmpty0 8
(8 9
)9 :
.: ;
EmailAddress; G
(G H
)H I
;I J
RuleFor 
( 
dto 
=> 
dto 
. 
Phone $
)$ %
.% &
NotNull& -
(- .
). /
./ 0
NotEmpty0 8
(8 9
)9 :
.: ;
Matches; B
(B C
$strC R
)R S
;S T
} 	
} 
} �	
gC:\Users\Leonard\Desktop\Clean VetApp\VetAppointment.API\Validators\CreatePrescribedDrugDtoValidator.cs
	namespace 	
VetAppointment
 
. 
API 
. 

Validators '
{ 
public 

class ,
 CreatePrescribedDrugDtoValidator 1
:2 3
AbstractValidator4 E
<E F#
CreatePrescribedDrugDtoF ]
>] ^
{ 
public ,
 CreatePrescribedDrugDtoValidator /
(/ 0
)0 1
{		 	
RuleFor

 
(

 
dto

 
=>

 
dto

 
.

 
Quantity

 '
)

' (
.

( )
NotNull

) 0
(

0 1
)

1 2
.

2 3
NotEmpty

3 ;
(

; <
)

< =
;

= >
RuleFor 
( 
dto 
=> 
dto 
. 
DrugId %
)% &
.& '
NotNull' .
(. /
)/ 0
.0 1
NotEmpty1 9
(9 :
): ;
;; <
} 	
} 
} �
bC:\Users\Leonard\Desktop\Clean VetApp\VetAppointment.API\Validators\CreateTreatmentDtoValidator.cs
	namespace 	
VetAppointment
 
. 
API 
. 

Validators '
{ 
public 

class '
CreateTreatmentDtoValidator ,
:- .
AbstractValidator/ @
<@ A
CreateTreatmentDtoA S
>S T
{ 
public '
CreateTreatmentDtoValidator *
(* +
)+ ,
{		 	
RuleFor

 
(

 
dto

 
=>

 
dto

 
.

 
Description

 *
)

* +
.

+ ,
NotNull

, 3
(

3 4
)

4 5
.

5 6
NotEmpty

6 >
(

> ?
)

? @
.

@ A
Length

A G
(

G H
$num

H I
,

I J
$num

K O
)

O P
;

P Q
} 	
} 
} �
bC:\Users\Leonard\Desktop\Clean VetApp\VetAppointment.API\Validators\CreateVetClinicDtoValidator.cs
	namespace 	
VetAppointment
 
. 
API 
. 

Validators '
{ 
public 

class '
CreateVetClinicDtoValidator ,
:- .
AbstractValidator/ @
<@ A
CreateVetClinicDtoA S
>S T
{ 
public '
CreateVetClinicDtoValidator *
(* +
)+ ,
{		 	
RuleFor

 
(

 
dto

 
=>

 
dto

 
.

 
Name

 #
)

# $
.

$ %
NotNull

% ,
(

, -
)

- .
.

. /
NotEmpty

/ 7
(

7 8
)

8 9
.

9 :
Length

: @
(

@ A
$num

A B
,

B C
$num

D F
)

F G
;

G H
RuleFor 
( 
dto 
=> 
dto 
. 
Address &
)& '
.' (
NotNull( /
(/ 0
)0 1
.1 2
NotEmpty2 :
(: ;
); <
.< =
Length= C
(C D
$numD E
,E F
$numG J
)J K
;K L
RuleFor 
( 
dto 
=> 
dto 
. 
NumberOfPlaces -
)- .
.. /
NotNull/ 6
(6 7
)7 8
.8 9
NotEmpty9 A
(A B
)B C
.C D
GreaterThanD O
(O P
$numP Q
)Q R
;R S
RuleFor 
( 
dto 
=> 
dto 
. 
ContactEmail +
)+ ,
., -
NotNull- 4
(4 5
)5 6
.6 7
NotEmpty7 ?
(? @
)@ A
.A B
EmailAddressB N
(N O
)O P
;P Q
RuleFor 
( 
dto 
=> 
dto 
. 
ContactPhone +
)+ ,
., -
NotNull- 4
(4 5
)5 6
.6 7
NotEmpty7 ?
(? @
)@ A
.A B
MatchesB I
(I J
$strJ Y
)Y Z
;Z [
} 	
} 
} �
\C:\Users\Leonard\Desktop\Clean VetApp\VetAppointment.API\Validators\CreateVetDtoValidator.cs
	namespace 	
VetAppointment
 
. 
API 
. 

Validators '
{ 
public 

class !
CreateVetDtoValidator &
:' (
AbstractValidator) :
<: ;
CreateVetDto; G
>G H
{ 
public !
CreateVetDtoValidator $
($ %
)% &
{		 	
RuleFor

 
(

 
dto

 
=>

 
dto

 
.

 
Name

 #
)

# $
.

$ %
NotNull

% ,
(

, -
)

- .
.

. /
NotEmpty

/ 7
(

7 8
)

8 9
.

9 :
Length

: @
(

@ A
$num

A B
,

B C
$num

D G
)

G H
;

H I
RuleFor 
( 
dto 
=> 
dto 
. 
Surname &
)& '
.' (
NotNull( /
(/ 0
)0 1
.1 2
NotEmpty2 :
(: ;
); <
.< =
Length= C
(C D
$numD E
,E F
$numG J
)J K
;K L
RuleFor 
( 
dto 
=> 
dto 
. 
	Birthdate (
)( )
.) *
NotNull* 1
(1 2
)2 3
.3 4
NotEmpty4 <
(< =
)= >
.> ?
Must? C
(C D
newD G
ValidationsH S
(S T
)T U
.U V
BeValidDateV a
)a b
;b c
RuleFor 
( 
dto 
=> 
dto 
. 
Gender %
)% &
.& '
NotNull' .
(. /
)/ 0
.0 1
NotEmpty1 9
(9 :
): ;
.; <
Must< @
(@ A
newA D
ValidationsE P
(P Q
)Q R
.R S 
BeInPersonGenderEnumS g
)g h
;h i
RuleFor 
( 
dto 
=> 
dto 
. 
Email $
)$ %
.% &
NotNull& -
(- .
). /
./ 0
NotEmpty0 8
(8 9
)9 :
.: ;
EmailAddress; G
(G H
)H I
;I J
RuleFor 
( 
dto 
=> 
dto 
. 
Phone $
)$ %
.% &
NotNull& -
(- .
). /
./ 0
NotEmpty0 8
(8 9
)9 :
.: ;
Matches; B
(B C
$strC R
)R S
;S T
RuleFor 
( 
dto 
=> 
dto 
. 
Specialisation -
)- .
.. /
NotNull/ 6
(6 7
)7 8
.8 9
NotEmpty9 A
(A B
)B C
.C D
MustD H
(H I
newI L
ValidationsM X
(X Y
)Y Z
.Z ["
BeInSpecialisationEnum[ q
)q r
;r s
} 	
} 
} �
RC:\Users\Leonard\Desktop\Clean VetApp\VetAppointment.API\Validators\Validations.cs
	namespace 	
VetAppointment
 
. 
API 
. 

Validators '
{ 
public 

class 
Validations 
{ 
public 
bool 
BeValidDate 
(  
string  &
value' ,
), -
{ 	
return		 
DateTime		 
.		 
TryParse		 $
(		$ %
value		% *
,		* +
out		, /
var		0 3
_		4 5
)		5 6
;		6 7
}

 	
public 
bool  
BeInPersonGenderEnum (
(( )
string) /
value0 5
)5 6
{ 	
return 
Enum 
. 
TryParse  
<  !
PersonGender! -
>- .
(. /
value/ 4
,4 5
out6 9
_: ;
); <
;< =
} 	
public 
bool "
BeInSpecialisationEnum *
(* +
string+ 1
value2 7
)7 8
{ 	
return 
Enum 
. 
TryParse  
<  !
VetSpecialisation! 2
>2 3
(3 4
value4 9
,9 :
out; >
_? @
)@ A
;A B
} 	
public 
bool 
BeInAnimalRaceEnum &
(& '
string' -
value. 3
)3 4
{ 	
return 
Enum 
. 
TryParse  
<  !

AnimalRace! +
>+ ,
(, -
value- 2
,2 3
out4 7
_8 9
)9 :
;: ;
} 	
public 
bool  
BeInAnimalGenderEnum (
(( )
string) /
value0 5
)5 6
{ 	
return 
Enum 
. 
TryParse  
<  !
AnimalGender! -
>- .
(. /
value/ 4
,4 5
out6 9
var: =
_> ?
)? @
;@ A
} 	
} 
}   