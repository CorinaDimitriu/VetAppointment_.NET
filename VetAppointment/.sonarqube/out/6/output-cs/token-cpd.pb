¿à
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
ÄÄ 
.
ÄÄ 
Headers
ÄÄ 
.
ÄÄ 
Add
ÄÄ  
(
ÄÄ  !
$str
ÄÄ! ?
,
ÄÄ? @
$str
ÄÄA a
)
ÄÄa b
;
ÄÄb c
Response
ÅÅ 
.
ÅÅ 
Headers
ÅÅ 
.
ÅÅ 
Add
ÅÅ  
(
ÅÅ  !
$str
ÅÅ! ?
,
ÅÅ? @
$str
ÅÅA b
)
ÅÅb c
;
ÅÅc d
Response
ÇÇ 
.
ÇÇ 
Headers
ÇÇ 
.
ÇÇ 
Add
ÇÇ  
(
ÇÇ  !
$str
ÇÇ! >
,
ÇÇ> ?
$str
ÇÇ@ X
)
ÇÇX Y
;
ÇÇY Z
return
ÉÉ 
Ok
ÉÉ 
(
ÉÉ 
appointmentDto
ÉÉ $
)
ÉÉ$ %
;
ÉÉ% &
}
ÑÑ 	
[
ÜÜ 	

HttpDelete
ÜÜ	 
(
ÜÜ 
$str
ÜÜ 
)
ÜÜ 
]
ÜÜ 
public
áá 
IActionResult
áá 
DeleteAppointment
áá .
(
áá. /
Guid
áá/ 3
id
áá4 6
)
áá6 7
{
àà 	
var
ââ 
appointment
ââ 
=
ââ 

unitOfWork
ââ (
.
ââ( )#
AppointmentRepository
ââ) >
.
ââ> ?
Get
ââ? B
(
ââB C
id
ââC E
)
ââE F
.
ââF G
Result
ââG M
;
ââM N
if
ää 
(
ää 
appointment
ää 
==
ää 
null
ää #
)
ää# $
{
ãã 
return
åå 
NotFound
åå 
(
åå  
)
åå  !
;
åå! "
}
çç 

unitOfWork
èè 
.
èè #
AppointmentRepository
èè ,
.
èè, -
Delete
èè- 3
(
èè3 4
appointment
èè4 ?
)
èè? @
;
èè@ A

unitOfWork
êê 
.
êê 
SaveChanges
êê "
(
êê" #
)
êê# $
;
êê$ %
Response
íí 
.
íí 
Headers
íí 
.
íí 
Add
íí  
(
íí  !
$str
íí! ?
,
íí? @
$str
ííA a
)
íía b
;
ííb c
Response
ìì 
.
ìì 
Headers
ìì 
.
ìì 
Add
ìì  
(
ìì  !
$str
ìì! ?
,
ìì? @
$str
ììA b
)
ììb c
;
ììc d
Response
îî 
.
îî 
Headers
îî 
.
îî 
Add
îî  
(
îî  !
$str
îî! >
,
îî> ?
$str
îî@ X
)
îîX Y
;
îîY Z
return
ïï 
	NoContent
ïï 
(
ïï 
)
ïï 
;
ïï 
}
ññ 	
[
òò 	
HttpPut
òò	 
(
òò 
$str
òò 
)
òò 
]
òò 
public
ôô 
IActionResult
ôô 
UpdateAppointment
ôô .
(
ôô. /
Guid
ôô/ 3
id
ôô4 6
,
ôô6 7
[
ôô8 9
FromBody
ôô9 A
]
ôôA B
AppointmentDto
ôôC Q
appointmentDto
ôôR `
)
ôô` a
{
öö 	
var
õõ 
appointment
õõ 
=
õõ 

unitOfWork
õõ (
.
õõ( )#
AppointmentRepository
õõ) >
.
õõ> ?
Get
õõ? B
(
õõB C
id
õõC E
)
õõE F
.
õõF G
Result
õõG M
;
õõM N
if
úú 
(
úú 
appointment
úú 
==
úú 
null
úú #
)
úú# $
{
ùù 
return
ûû 
NotFound
ûû 
(
ûû  
)
ûû  !
;
ûû! "
}
üü 
var
°° 
validatorResult
°° 
=
°°  !+
createAppointmentDtoValidator
°°" ?
.
°°? @
Validate
°°@ H
(
°°H I
appointmentDto
°°I W
)
°°W X
;
°°X Y
if
¢¢ 
(
¢¢ 
!
¢¢ 
validatorResult
¢¢  
.
¢¢  !
IsValid
¢¢! (
)
¢¢( )
{
££ 
return
§§ 

BadRequest
§§ !
(
§§! "
validatorResult
§§" 1
.
§§1 2
Errors
§§2 8
)
§§8 9
;
§§9 :
}
•• 
appointment
ßß 
.
ßß 
Update
ßß 
(
ßß 
appointment
ßß *
.
ßß* +
VetId
ßß+ 0
,
ßß0 1
appointmentDto
ßß2 @
.
ßß@ A
PetId
ßßA F
,
ßßF G
appointmentDto
ßßH V
.
ßßV W
ScheduledDate
ßßW d
,
ßßd e
appointmentDto
®® 
.
®® (
EstimatedDurationInMinutes
®® 9
,
®®9 :
appointmentDto
®®; I
.
®®I J
TreatmentId
®®J U
,
®®U V
appointmentDto
®®W e
.
®®e f
MedicalHistoryId
®®f v
)
®®v w
;
®®w x

unitOfWork
™™ 
.
™™ #
AppointmentRepository
™™ ,
.
™™, -
Update
™™- 3
(
™™3 4
appointment
™™4 ?
)
™™? @
;
™™@ A

unitOfWork
´´ 
.
´´ 
SaveChanges
´´ "
(
´´" #
)
´´# $
;
´´$ %
Response
≠≠ 
.
≠≠ 
Headers
≠≠ 
.
≠≠ 
Add
≠≠  
(
≠≠  !
$str
≠≠! ?
,
≠≠? @
$str
≠≠A a
)
≠≠a b
;
≠≠b c
Response
ÆÆ 
.
ÆÆ 
Headers
ÆÆ 
.
ÆÆ 
Add
ÆÆ  
(
ÆÆ  !
$str
ÆÆ! ?
,
ÆÆ? @
$str
ÆÆA b
)
ÆÆb c
;
ÆÆc d
Response
ØØ 
.
ØØ 
Headers
ØØ 
.
ØØ 
Add
ØØ  
(
ØØ  !
$str
ØØ! >
,
ØØ> ?
$str
ØØ@ X
)
ØØX Y
;
ØØY Z
return
∞∞ 
	NoContent
∞∞ 
(
∞∞ 
)
∞∞ 
;
∞∞ 
}
±± 	
}
≤≤ 
}≥≥ ∆S
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
}vv €J
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
}ll £J
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
}ff Æ
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
} “.
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
)	 Ä
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
}BB Ë§
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
ÄÄ 
	treatment
ÄÄ 
=
ÄÄ 

unitOfWork
ÄÄ &
.
ÄÄ& '!
TreatmentRepository
ÄÄ' :
.
ÄÄ: ;
Get
ÄÄ; >
(
ÄÄ> ?
treatmentId
ÄÄ? J
)
ÄÄJ K
.
ÄÄK L
Result
ÄÄL R
;
ÄÄR S
if
ÅÅ 
(
ÅÅ 
	treatment
ÅÅ 
==
ÅÅ 
null
ÅÅ !
)
ÅÅ! "
{
ÇÇ 
return
ÉÉ 
NotFound
ÉÉ 
(
ÉÉ  
)
ÉÉ  !
;
ÉÉ! "
}
ÑÑ 
var
ÜÜ 
drugPrescribed
ÜÜ 
=
ÜÜ  

unitOfWork
ÜÜ! +
.
ÜÜ+ ,&
PrescribedDrugRepository
ÜÜ, D
.
ÜÜD E
Get
ÜÜE H
(
ÜÜH I
prescribedDrugId
ÜÜI Y
)
ÜÜY Z
.
ÜÜZ [
Result
ÜÜ[ a
;
ÜÜa b
if
áá 
(
áá 
drugPrescribed
áá 
==
áá !
null
áá" &
)
áá& '
{
àà 
return
ââ 
NotFound
ââ 
(
ââ  
)
ââ  !
;
ââ! "
}
ää 
var
åå 
validatorResult
åå 
=
åå  !.
 createPrescribedDrugDtoValidator
åå" B
.
ååB C
Validate
ååC K
(
ååK L
prescribedDrugDto
ååL ]
)
åå] ^
;
åå^ _
if
çç 
(
çç 
!
çç 
validatorResult
çç  
.
çç  !
IsValid
çç! (
)
çç( )
{
éé 
return
èè 

BadRequest
èè !
(
èè! "
validatorResult
èè" 1
.
èè1 2
Errors
èè2 8
)
èè8 9
;
èè9 :
}
êê 
var
íí 
drug
íí 
=
íí 

unitOfWork
íí !
.
íí! "
DrugRepository
íí" 0
.
íí0 1
Get
íí1 4
(
íí4 5
prescribedDrugDto
íí5 F
.
ííF G
DrugId
ííG M
)
ííM N
.
ííN O
Result
ííO U
;
ííU V
if
ìì 
(
ìì 
drug
ìì 
==
ìì 
null
ìì 
)
ìì 
{
îî 
return
ïï 
NotFound
ïï 
(
ïï  
)
ïï  !
;
ïï! "
}
ññ 
var
òò 
result
òò 
=
òò 
drugPrescribed
òò '
.
òò' (
Update
òò( .
(
òò. /
prescribedDrugDto
òò/ @
.
òò@ A
Quantity
òòA I
,
òòI J
drug
òòK O
)
òòO P
;
òòP Q
if
öö 
(
öö 
result
öö 
.
öö 
	IsFailure
öö  
)
öö  !
{
õõ 
return
úú 

BadRequest
úú !
(
úú! "
result
úú" (
.
úú( )
Error
úú) .
)
úú. /
;
úú/ 0
}
ùù 

unitOfWork
üü 
.
üü &
PrescribedDrugRepository
üü /
.
üü/ 0
Update
üü0 6
(
üü6 7
drugPrescribed
üü7 E
)
üüE F
;
üüF G

unitOfWork
†† 
.
†† 
SaveChanges
†† "
(
††" #
)
††# $
;
††$ %
Response
¢¢ 
.
¢¢ 
Headers
¢¢ 
.
¢¢ 
Add
¢¢  
(
¢¢  !
$str
¢¢! ?
,
¢¢? @
$str
¢¢A a
)
¢¢a b
;
¢¢b c
Response
££ 
.
££ 
Headers
££ 
.
££ 
Add
££  
(
££  !
$str
££! ?
,
££? @
$str
££A b
)
££b c
;
££c d
Response
§§ 
.
§§ 
Headers
§§ 
.
§§ 
Add
§§  
(
§§  !
$str
§§! >
,
§§> ?
$str
§§@ X
)
§§X Y
;
§§Y Z
return
•• 
	NoContent
•• 
(
•• 
)
•• 
;
•• 
}
¶¶ 	
[
®® 	

HttpDelete
®®	 
(
®® 
$str
®® O
)
®®O P
]
®®P Q
public
©© 
IActionResult
©© %
RemoveDrugFromTreatment
©© 4
(
©©4 5
Guid
©©5 9
treatmentId
©©: E
,
©©E F
Guid
©©G K
prescribedDrugId
©©L \
)
©©\ ]
{
™™ 	
var
´´ 
	treatment
´´ 
=
´´ 

unitOfWork
´´ &
.
´´& '!
TreatmentRepository
´´' :
.
´´: ;
Get
´´; >
(
´´> ?
treatmentId
´´? J
)
´´J K
.
´´K L
Result
´´L R
;
´´R S
if
¨¨ 
(
¨¨ 
	treatment
¨¨ 
==
¨¨ 
null
¨¨ !
)
¨¨! "
{
≠≠ 
return
ÆÆ 
NotFound
ÆÆ 
(
ÆÆ  
)
ÆÆ  !
;
ÆÆ! "
}
ØØ 
var
±± 
drug
±± 
=
±± 

unitOfWork
±± !
.
±±! "&
PrescribedDrugRepository
±±" :
.
±±: ;
Get
±±; >
(
±±> ?
prescribedDrugId
±±? O
)
±±O P
.
±±P Q
Result
±±Q W
;
±±W X
if
≤≤ 
(
≤≤ 
drug
≤≤ 
==
≤≤ 
null
≤≤ 
)
≤≤ 
{
≥≥ 
return
¥¥ 
NotFound
¥¥ 
(
¥¥  
)
¥¥  !
;
¥¥! "
}
µµ 
var
∑∑ 
result
∑∑ 
=
∑∑ 
	treatment
∑∑ "
.
∑∑" #%
RemoveDrugFromTreatment
∑∑# :
(
∑∑: ;
drug
∑∑; ?
)
∑∑? @
;
∑∑@ A
if
∏∏ 
(
∏∏ 
result
∏∏ 
.
∏∏ 
	IsFailure
∏∏  
)
∏∏  !
{
ππ 
return
∫∫ 

BadRequest
∫∫ !
(
∫∫! "
result
∫∫" (
.
∫∫( )
Error
∫∫) .
)
∫∫. /
;
∫∫/ 0
}
ªª 

unitOfWork
ΩΩ 
.
ΩΩ &
PrescribedDrugRepository
ΩΩ /
.
ΩΩ/ 0
Delete
ΩΩ0 6
(
ΩΩ6 7
drug
ΩΩ7 ;
)
ΩΩ; <
;
ΩΩ< =

unitOfWork
ææ 
.
ææ 
SaveChanges
ææ "
(
ææ" #
)
ææ# $
;
ææ$ %
Response
¿¿ 
.
¿¿ 
Headers
¿¿ 
.
¿¿ 
Add
¿¿  
(
¿¿  !
$str
¿¿! ?
,
¿¿? @
$str
¿¿A a
)
¿¿a b
;
¿¿b c
Response
¡¡ 
.
¡¡ 
Headers
¡¡ 
.
¡¡ 
Add
¡¡  
(
¡¡  !
$str
¡¡! ?
,
¡¡? @
$str
¡¡A b
)
¡¡b c
;
¡¡c d
Response
¬¬ 
.
¬¬ 
Headers
¬¬ 
.
¬¬ 
Add
¬¬  
(
¬¬  !
$str
¬¬! >
,
¬¬> ?
$str
¬¬@ X
)
¬¬X Y
;
¬¬Y Z
return
√√ 
	NoContent
√√ 
(
√√ 
)
√√ 
;
√√ 
}
ƒƒ 	
[
∆∆ 	

HttpDelete
∆∆	 
(
∆∆ 
$str
∆∆ (
)
∆∆( )
]
∆∆) *
public
«« 
IActionResult
«« 
Delete
«« #
(
««# $
Guid
««$ (
treatmentId
««) 4
)
««4 5
{
»» 	
var
…… 
	treatment
…… 
=
…… 

unitOfWork
…… &
.
……& '!
TreatmentRepository
……' :
.
……: ;
Get
……; >
(
……> ?
treatmentId
……? J
)
……J K
.
……K L
Result
……L R
;
……R S
if
   
(
   
	treatment
   
==
   
null
   !
)
  ! "
{
ÀÀ 
return
ÃÃ 
NotFound
ÃÃ 
(
ÃÃ  
)
ÃÃ  !
;
ÃÃ! "
}
ÕÕ 

unitOfWork
œœ 
.
œœ !
TreatmentRepository
œœ *
.
œœ* +
Delete
œœ+ 1
(
œœ1 2
	treatment
œœ2 ;
)
œœ; <
;
œœ< =

unitOfWork
–– 
.
–– 
SaveChanges
–– "
(
––" #
)
––# $
;
––$ %
Response
““ 
.
““ 
Headers
““ 
.
““ 
Add
““  
(
““  !
$str
““! ?
,
““? @
$str
““A a
)
““a b
;
““b c
Response
”” 
.
”” 
Headers
”” 
.
”” 
Add
””  
(
””  !
$str
””! ?
,
””? @
$str
””A b
)
””b c
;
””c d
Response
‘‘ 
.
‘‘ 
Headers
‘‘ 
.
‘‘ 
Add
‘‘  
(
‘‘  !
$str
‘‘! >
,
‘‘> ?
$str
‘‘@ X
)
‘‘X Y
;
‘‘Y Z
return
’’ 
	NoContent
’’ 
(
’’ 
)
’’ 
;
’’ 
}
÷÷ 	
}
ÿÿ 
}ŸŸ ◊˝
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
ÄÄ 
.
ÄÄ 
Headers
ÄÄ 
.
ÄÄ 
Add
ÄÄ  
(
ÄÄ  !
$str
ÄÄ! ?
,
ÄÄ? @
$str
ÄÄA a
)
ÄÄa b
;
ÄÄb c
Response
ÅÅ 
.
ÅÅ 
Headers
ÅÅ 
.
ÅÅ 
Add
ÅÅ  
(
ÅÅ  !
$str
ÅÅ! ?
,
ÅÅ? @
$str
ÅÅA b
)
ÅÅb c
;
ÅÅc d
Response
ÇÇ 
.
ÇÇ 
Headers
ÇÇ 
.
ÇÇ 
Add
ÇÇ  
(
ÇÇ  !
$str
ÇÇ! >
,
ÇÇ> ?
$str
ÇÇ@ X
)
ÇÇX Y
;
ÇÇY Z
return
ÉÉ 
Ok
ÉÉ 
(
ÉÉ 
appointments
ÉÉ "
)
ÉÉ" #
;
ÉÉ# $
}
ÑÑ 	
[
áá 	
HttpPost
áá	 
(
áá 
$str
áá +
)
áá+ ,
]
áá, -
public
àà 
IActionResult
àà  
RegisterPetsFamily
àà /
(
àà/ 0
Guid
àà0 4
vetClinicId
àà5 @
,
àà@ A
[
ààB C
FromBody
ààC K
]
ààK L
List
ààM Q
<
ààQ R
CreatePetDto
ààR ^
>
àà^ _
petsDtos
àà` h
)
ààh i
{
ââ 	
var
ää 
clinic
ää 
=
ää 

unitOfWork
ää #
.
ää# $!
VetClinicRepository
ää$ 7
.
ää7 8
Get
ää8 ;
(
ää; <
vetClinicId
ää< G
)
ääG H
.
ääH I
Result
ääI O
;
ääO P
if
ãã 
(
ãã 
clinic
ãã 
==
ãã 
null
ãã 
)
ãã 
{
åå 
return
çç 
NotFound
çç 
(
çç  
)
çç  !
;
çç! "
}
éé 
foreach
êê 
(
êê 
var
êê 
dto
êê 
in
êê 
petsDtos
êê  (
)
êê( )
{
ëë 
var
íí 
validatorResult
íí #
=
íí$ %#
createPetDtoValidator
íí& ;
.
íí; <
Validate
íí< D
(
ííD E
dto
ííE H
)
ííH I
;
ííI J
if
ìì 
(
ìì 
!
ìì 
validatorResult
ìì $
.
ìì$ %
IsValid
ìì% ,
)
ìì, -
{
îî 
return
ïï 

BadRequest
ïï %
(
ïï% &
validatorResult
ïï& 5
.
ïï5 6
Errors
ïï6 <
)
ïï< =
;
ïï= >
}
ññ 
}
óó 
var
ôô 
pets
ôô 
=
ôô 
petsDtos
ôô 
.
ôô  
Select
ôô  &
(
ôô& '
	PetMapper
ôô' 0
.
ôô0 1
Mapper
ôô1 7
.
ôô7 8
Map
ôô8 ;
<
ôô; <
Pet
ôô< ?
>
ôô? @
)
ôô@ A
.
ôôA B
ToList
ôôB H
(
ôôH I
)
ôôI J
;
ôôJ K
if
öö 
(
öö 
pets
öö 
.
öö 
Any
öö 
(
öö 
p
öö 
=>
öö 
p
öö 
==
öö  "
null
öö# '
)
öö' (
)
öö( )
{
õõ 
return
úú 

BadRequest
úú !
(
úú! "
)
úú" #
;
úú# $
}
ùù 
var
üü 
result
üü 
=
üü 
clinic
üü 
.
üü  (
RegisterPetsFamilyToClinic
üü  :
(
üü: ;
pets
üü; ?
.
üü? @
ToList
üü@ F
(
üüF G
)
üüG H
)
üüH I
;
üüI J
if
†† 
(
†† 
result
†† 
.
†† 
	IsFailure
††  
)
††  !
{
°° 
return
¢¢ 

BadRequest
¢¢ !
(
¢¢! "
result
¢¢" (
.
¢¢( )
Error
¢¢) .
)
¢¢. /
;
¢¢/ 0
}
££ 
pets
•• 
.
•• 
ForEach
•• 
(
•• 
p
•• 
=>
•• 

unitOfWork
•• (
.
••( )
PetRepository
••) 6
.
••6 7
Add
••7 :
(
••: ;
p
••; <
)
••< =
)
••= >
;
••> ?
Response
ßß 
.
ßß 
Headers
ßß 
.
ßß 
Add
ßß  
(
ßß  !
$str
ßß! ?
,
ßß? @
$str
ßßA a
)
ßßa b
;
ßßb c
Response
®® 
.
®® 
Headers
®® 
.
®® 
Add
®®  
(
®®  !
$str
®®! ?
,
®®? @
$str
®®A b
)
®®b c
;
®®c d
Response
©© 
.
©© 
Headers
©© 
.
©© 
Add
©©  
(
©©  !
$str
©©! >
,
©©> ?
$str
©©@ X
)
©©X Y
;
©©Y Z
return
™™ 
Created
™™ 
(
™™ 
nameof
™™ !
(
™™! "
GetPetsByClinicId
™™" 3
)
™™3 4
,
™™4 5
pets
™™6 :
.
™™: ;
Select
™™; A
(
™™A B
	PetMapper
™™B K
.
™™K L
Mapper
™™L R
.
™™R S
Map
™™S V
<
™™V W
PetDto
™™W ]
>
™™] ^
)
™™^ _
)
™™_ `
;
™™` a
}
´´ 	
[
≠≠ 	
HttpPost
≠≠	 
(
≠≠ 
$str
≠≠ *
)
≠≠* +
]
≠≠+ ,
public
ÆÆ 
IActionResult
ÆÆ 
RegisterVet
ÆÆ (
(
ÆÆ( )
Guid
ÆÆ) -
vetClinicId
ÆÆ. 9
,
ÆÆ9 :
[
ÆÆ; <
FromBody
ÆÆ< D
]
ÆÆD E
CreateVetDto
ÆÆF R
vetDto
ÆÆS Y
)
ÆÆY Z
{
ØØ 	
var
∞∞ 
clinic
∞∞ 
=
∞∞ 

unitOfWork
∞∞ #
.
∞∞# $!
VetClinicRepository
∞∞$ 7
.
∞∞7 8
Get
∞∞8 ;
(
∞∞; <
vetClinicId
∞∞< G
)
∞∞G H
.
∞∞H I
Result
∞∞I O
;
∞∞O P
if
±± 
(
±± 
clinic
±± 
==
±± 
null
±± 
)
±± 
{
≤≤ 
return
≥≥ 
NotFound
≥≥ 
(
≥≥  
)
≥≥  !
;
≥≥! "
}
¥¥ 
var
∂∂ 
validatorResult
∂∂ 
=
∂∂  !#
createVetDtoValidator
∂∂" 7
.
∂∂7 8
Validate
∂∂8 @
(
∂∂@ A
vetDto
∂∂A G
)
∂∂G H
;
∂∂H I
if
∑∑ 
(
∑∑ 
!
∑∑ 
validatorResult
∑∑  
.
∑∑  !
IsValid
∑∑! (
)
∑∑( )
{
∏∏ 
return
ππ 

BadRequest
ππ !
(
ππ! "
validatorResult
ππ" 1
.
ππ1 2
Errors
ππ2 8
)
ππ8 9
;
ππ9 :
}
∫∫ 
var
ºº 
doctor
ºº 
=
ºº 
	VetMapper
ºº "
.
ºº" #
Mapper
ºº# )
.
ºº) *
Map
ºº* -
<
ºº- .
Vet
ºº. 1
>
ºº1 2
(
ºº2 3
vetDto
ºº3 9
)
ºº9 :
;
ºº: ;
if
ΩΩ 
(
ΩΩ 
doctor
ΩΩ 
==
ΩΩ 
null
ΩΩ 
)
ΩΩ 
{
ææ 
return
øø 

BadRequest
øø !
(
øø! "
)
øø" #
;
øø# $
}
¿¿ 
var
¬¬ 
result
¬¬ 
=
¬¬ 
clinic
¬¬ 
.
¬¬  !
RegisterVetToClinic
¬¬  3
(
¬¬3 4
doctor
¬¬4 :
)
¬¬: ;
;
¬¬; <
if
√√ 
(
√√ 
result
√√ 
.
√√ 
	IsFailure
√√  
)
√√  !
{
ƒƒ 
return
≈≈ 

BadRequest
≈≈ !
(
≈≈! "
result
≈≈" (
.
≈≈( )
Error
≈≈) .
)
≈≈. /
;
≈≈/ 0
}
∆∆ 

unitOfWork
»» 
.
»» !
VetClinicRepository
»» *
.
»»* +
Update
»»+ 1
(
»»1 2
clinic
»»2 8
)
»»8 9
;
»»9 :

unitOfWork
…… 
.
…… 
VetRepository
…… $
.
……$ %
Add
……% (
(
……( )
doctor
……) /
)
……/ 0
;
……0 1
Response
ÀÀ 
.
ÀÀ 
Headers
ÀÀ 
.
ÀÀ 
Add
ÀÀ  
(
ÀÀ  !
$str
ÀÀ! ?
,
ÀÀ? @
$str
ÀÀA a
)
ÀÀa b
;
ÀÀb c
Response
ÃÃ 
.
ÃÃ 
Headers
ÃÃ 
.
ÃÃ 
Add
ÃÃ  
(
ÃÃ  !
$str
ÃÃ! ?
,
ÃÃ? @
$str
ÃÃA b
)
ÃÃb c
;
ÃÃc d
Response
ÕÕ 
.
ÕÕ 
Headers
ÕÕ 
.
ÕÕ 
Add
ÕÕ  
(
ÕÕ  !
$str
ÕÕ! >
,
ÕÕ> ?
$str
ÕÕ@ X
)
ÕÕX Y
;
ÕÕY Z
return
ŒŒ 
Created
ŒŒ 
(
ŒŒ 
nameof
ŒŒ !
(
ŒŒ! "
RegisterVet
ŒŒ" -
)
ŒŒ- .
,
ŒŒ. /
	VetMapper
ŒŒ0 9
.
ŒŒ9 :
Mapper
ŒŒ: @
.
ŒŒ@ A
Map
ŒŒA D
<
ŒŒD E
VetDto
ŒŒE K
>
ŒŒK L
(
ŒŒL M
doctor
ŒŒM S
)
ŒŒS T
)
ŒŒT U
;
ŒŒU V
}
œœ 	
[
—— 	
HttpPost
——	 
(
—— 
$str
—— 2
)
——2 3
]
——3 4
public
““ 
IActionResult
““ !
RegisterAppointment
““ 0
(
““0 1
Guid
““1 5
vetClinicId
““6 A
,
““A B
[
““C D
FromBody
““D L
]
““L M"
CreateAppointmentDto
““N b
appointmentDto
““c q
)
““q r
{
”” 	
var
‘‘ 
clinic
‘‘ 
=
‘‘ 

unitOfWork
‘‘ #
.
‘‘# $!
VetClinicRepository
‘‘$ 7
.
‘‘7 8
Get
‘‘8 ;
(
‘‘; <
vetClinicId
‘‘< G
)
‘‘G H
.
‘‘H I
Result
‘‘I O
;
‘‘O P
if
’’ 
(
’’ 
clinic
’’ 
==
’’ 
null
’’ 
)
’’ 
{
÷÷ 
return
◊◊ 
NotFound
◊◊ 
(
◊◊  
)
◊◊  !
;
◊◊! "
}
ÿÿ 
var
⁄⁄ 
validatorResult
⁄⁄ 
=
⁄⁄  !+
createAppointmentDtoValidator
⁄⁄" ?
.
⁄⁄? @
Validate
⁄⁄@ H
(
⁄⁄H I
appointmentDto
⁄⁄I W
)
⁄⁄W X
;
⁄⁄X Y
if
€€ 
(
€€ 
!
€€ 
validatorResult
€€  
.
€€  !
IsValid
€€! (
)
€€( )
{
‹‹ 
return
›› 

BadRequest
›› !
(
››! "
validatorResult
››" 1
.
››1 2
Errors
››2 8
)
››8 9
;
››9 :
}
ﬁﬁ 
var
‡‡ 
medicalHistory
‡‡ 
=
‡‡  

unitOfWork
‡‡! +
.
‡‡+ ,&
MedicalHistoryRepository
‡‡, D
.
‡‡D E
Get
‡‡E H
(
‡‡H I
clinic
‡‡I O
.
‡‡O P
MedicalHistoryId
‡‡P `
)
‡‡` a
.
‡‡a b
Result
‡‡b h
;
‡‡h i
var
‚‚ 
pet
‚‚ 
=
‚‚ 

unitOfWork
‚‚  
.
‚‚  !
PetRepository
‚‚! .
.
‚‚. /
Get
‚‚/ 2
(
‚‚2 3
appointmentDto
‚‚3 A
.
‚‚A B
PetId
‚‚B G
)
‚‚G H
.
‚‚H I
Result
‚‚I O
;
‚‚O P
if
„„ 
(
„„ 
pet
„„ 
==
„„ 
null
„„ 
)
„„ 
{
‰‰ 
return
ÂÂ 
NotFound
ÂÂ 
(
ÂÂ  
)
ÂÂ  !
;
ÂÂ! "
}
ÊÊ 
var
ËË 
vet
ËË 
=
ËË 

unitOfWork
ËË  
.
ËË  !
VetRepository
ËË! .
.
ËË. /
Get
ËË/ 2
(
ËË2 3
appointmentDto
ËË3 A
.
ËËA B
VetId
ËËB G
)
ËËG H
.
ËËH I
Result
ËËI O
;
ËËO P
if
ÈÈ 
(
ÈÈ 
vet
ÈÈ 
==
ÈÈ 
null
ÈÈ 
)
ÈÈ 
{
ÍÍ 
return
ÎÎ 
NotFound
ÎÎ 
(
ÎÎ  
)
ÎÎ  !
;
ÎÎ! "
}
ÏÏ 
var
ÓÓ 
appointment
ÓÓ 
=
ÓÓ 
AppointmentMapper
ÓÓ /
.
ÓÓ/ 0
Mapper
ÓÓ0 6
.
ÓÓ6 7
Map
ÓÓ7 :
<
ÓÓ: ;
Appointment
ÓÓ; F
>
ÓÓF G
(
ÓÓG H
appointmentDto
ÓÓH V
)
ÓÓV W
;
ÓÓW X
if
ÔÔ 
(
ÔÔ 
appointment
ÔÔ 
==
ÔÔ 
null
ÔÔ #
)
ÔÔ# $
{
 
return
ÒÒ 

BadRequest
ÒÒ !
(
ÒÒ! "
)
ÒÒ" #
;
ÒÒ# $
}
ÚÚ 
var
ÙÙ 
result
ÙÙ 
=
ÙÙ 
medicalHistory
ÙÙ '
.
ÙÙ' (*
RegisterAppointmentToHistory
ÙÙ( D
(
ÙÙD E
appointment
ÙÙE P
)
ÙÙP Q
;
ÙÙQ R
if
ıı 
(
ıı 
result
ıı 
.
ıı 
	IsFailure
ıı  
)
ıı  !
{
ˆˆ 
return
˜˜ 

BadRequest
˜˜ !
(
˜˜! "
result
˜˜" (
.
˜˜( )
Error
˜˜) .
)
˜˜. /
;
˜˜/ 0
}
¯¯ 

unitOfWork
˙˙ 
.
˙˙ &
MedicalHistoryRepository
˙˙ /
.
˙˙/ 0
Update
˙˙0 6
(
˙˙6 7
medicalHistory
˙˙7 E
)
˙˙E F
;
˙˙F G

unitOfWork
˚˚ 
.
˚˚ #
AppointmentRepository
˚˚ ,
.
˚˚, -
Add
˚˚- 0
(
˚˚0 1
appointment
˚˚1 <
)
˚˚< =
;
˚˚= >

unitOfWork
¸¸ 
.
¸¸ 
SaveChanges
¸¸ "
(
¸¸" #
)
¸¸# $
;
¸¸$ %
Response
˛˛ 
.
˛˛ 
Headers
˛˛ 
.
˛˛ 
Add
˛˛  
(
˛˛  !
$str
˛˛! ?
,
˛˛? @
$str
˛˛A g
)
˛˛g h
;
˛˛h i
Response
ˇˇ 
.
ˇˇ 
Headers
ˇˇ 
.
ˇˇ 
Add
ˇˇ  
(
ˇˇ  !
$str
ˇˇ! ?
,
ˇˇ? @
$str
ˇˇA b
)
ˇˇb c
;
ˇˇc d
Response
ÄÄ 
.
ÄÄ 
Headers
ÄÄ 
.
ÄÄ 
Add
ÄÄ  
(
ÄÄ  !
$str
ÄÄ! >
,
ÄÄ> ?
$str
ÄÄ@ X
)
ÄÄX Y
;
ÄÄY Z
return
ÅÅ 
Created
ÅÅ 
(
ÅÅ 
nameof
ÅÅ !
(
ÅÅ! "!
RegisterAppointment
ÅÅ" 5
)
ÅÅ5 6
,
ÅÅ6 7
AppointmentMapper
ÅÅ8 I
.
ÅÅI J
Mapper
ÅÅJ P
.
ÅÅP Q
Map
ÅÅQ T
<
ÅÅT U
AppointmentDto
ÅÅU c
>
ÅÅc d
(
ÅÅd e
appointment
ÅÅe p
)
ÅÅp q
)
ÅÅq r
;
ÅÅr s
}
ÇÇ 	
[
ÑÑ 	
HttpPut
ÑÑ	 
(
ÑÑ 
$str
ÑÑ %
)
ÑÑ% &
]
ÑÑ& '
public
ÖÖ 
IActionResult
ÖÖ 
Update
ÖÖ #
(
ÖÖ# $
Guid
ÖÖ$ (
vetClinicId
ÖÖ) 4
,
ÖÖ4 5
[
ÖÖ6 7
FromBody
ÖÖ7 ?
]
ÖÖ? @ 
CreateVetClinicDto
ÖÖA S
vetClinicDto
ÖÖT `
)
ÖÖ` a
{
ÜÜ 	
var
áá 
clinic
áá 
=
áá 

unitOfWork
áá #
.
áá# $!
VetClinicRepository
áá$ 7
.
áá7 8
Get
áá8 ;
(
áá; <
vetClinicId
áá< G
)
ááG H
.
ááH I
Result
ááI O
;
ááO P
if
àà 
(
àà 
clinic
àà 
==
àà 
null
àà 
)
àà 
{
ââ 
return
ää 
NotFound
ää 
(
ää  
)
ää  !
;
ää! "
}
ãã 
var
çç 
validatorResult
çç 
=
çç  !)
createVetClinicDtoValidator
çç" =
.
çç= >
Validate
çç> F
(
ççF G
vetClinicDto
ççG S
)
ççS T
;
ççT U
if
éé 
(
éé 
!
éé 
validatorResult
éé  
.
éé  !
IsValid
éé! (
)
éé( )
{
èè 
return
êê 

BadRequest
êê !
(
êê! "
validatorResult
êê" 1
.
êê1 2
Errors
êê2 8
)
êê8 9
;
êê9 :
}
ëë 
var
ìì 
result
ìì 
=
ìì 
clinic
ìì 
.
ìì  
Update
ìì  &
(
ìì& '
vetClinicDto
ìì' 3
.
ìì3 4
Name
ìì4 8
,
ìì8 9
vetClinicDto
ìì: F
.
ììF G
Address
ììG N
,
ììN O
vetClinicDto
ììP \
.
ìì\ ]
NumberOfPlaces
ìì] k
,
ììk l
vetClinicDto
îî 
.
îî 
ContactEmail
îî )
,
îî) *
vetClinicDto
îî+ 7
.
îî7 8
ContactPhone
îî8 D
)
îîD E
;
îîE F
if
ïï 
(
ïï 
result
ïï 
.
ïï 
	IsFailure
ïï  
)
ïï  !
{
ññ 
return
óó 

BadRequest
óó !
(
óó! "
result
óó" (
.
óó( )
Error
óó) .
)
óó. /
;
óó/ 0
}
òò 

unitOfWork
öö 
.
öö !
VetClinicRepository
öö *
.
öö* +
Update
öö+ 1
(
öö1 2
result
öö2 8
.
öö8 9
Entity
öö9 ?
)
öö? @
;
öö@ A

unitOfWork
õõ 
.
õõ 
SaveChanges
õõ "
(
õõ" #
)
õõ# $
;
õõ$ %
Response
ùù 
.
ùù 
Headers
ùù 
.
ùù 
Add
ùù  
(
ùù  !
$str
ùù! ?
,
ùù? @
$str
ùùA g
)
ùùg h
;
ùùh i
Response
ûû 
.
ûû 
Headers
ûû 
.
ûû 
Add
ûû  
(
ûû  !
$str
ûû! ?
,
ûû? @
$str
ûûA b
)
ûûb c
;
ûûc d
Response
üü 
.
üü 
Headers
üü 
.
üü 
Add
üü  
(
üü  !
$str
üü! >
,
üü> ?
$str
üü@ X
)
üüX Y
;
üüY Z
return
†† 
	NoContent
†† 
(
†† 
)
†† 
;
†† 
}
°° 	
[
££ 	
HttpPut
££	 
(
££ 
$str
££ 6
)
££6 7
]
££7 8
public
§§ 
IActionResult
§§ 
	UpdateVet
§§ &
(
§§& '
Guid
§§' +
vetClinicId
§§, 7
,
§§7 8
Guid
§§9 =
vetId
§§> C
,
§§C D
[
§§E F
FromBody
§§F N
]
§§N O
CreateVetDto
§§P \
vetDto
§§] c
)
§§c d
{
•• 	
var
¶¶ 
clinic
¶¶ 
=
¶¶ 

unitOfWork
¶¶ #
.
¶¶# $!
VetClinicRepository
¶¶$ 7
.
¶¶7 8
Get
¶¶8 ;
(
¶¶; <
vetClinicId
¶¶< G
)
¶¶G H
.
¶¶H I
Result
¶¶I O
;
¶¶O P
if
ßß 
(
ßß 
clinic
ßß 
==
ßß 
null
ßß 
)
ßß 
{
®® 
return
©© 
NotFound
©© 
(
©©  
)
©©  !
;
©©! "
}
™™ 
var
¨¨ 
vet
¨¨ 
=
¨¨ 

unitOfWork
¨¨  
.
¨¨  !
VetRepository
¨¨! .
.
¨¨. /
Get
¨¨/ 2
(
¨¨2 3
vetId
¨¨3 8
)
¨¨8 9
.
¨¨9 :
Result
¨¨: @
;
¨¨@ A
if
≠≠ 
(
≠≠ 
vet
≠≠ 
==
≠≠ 
null
≠≠ 
)
≠≠ 
{
ÆÆ 
return
ØØ 
NotFound
ØØ 
(
ØØ  
)
ØØ  !
;
ØØ! "
}
∞∞ 
var
≤≤ 
validatorResult
≤≤ 
=
≤≤  !#
createVetDtoValidator
≤≤" 7
.
≤≤7 8
Validate
≤≤8 @
(
≤≤@ A
vetDto
≤≤A G
)
≤≤G H
;
≤≤H I
if
≥≥ 
(
≥≥ 
!
≥≥ 
validatorResult
≥≥  
.
≥≥  !
IsValid
≥≥! (
)
≥≥( )
{
¥¥ 
return
µµ 

BadRequest
µµ !
(
µµ! "
validatorResult
µµ" 1
.
µµ1 2
Errors
µµ2 8
)
µµ8 9
;
µµ9 :
}
∂∂ 
var
∏∏ 
result
∏∏ 
=
∏∏ 
vet
∏∏ 
.
∏∏ 
Update
∏∏ #
(
∏∏# $
vetDto
∏∏$ *
.
∏∏* +
Name
∏∏+ /
,
∏∏/ 0
vetDto
∏∏1 7
.
∏∏7 8
Surname
∏∏8 ?
,
∏∏? @
vetDto
∏∏A G
.
∏∏G H
	Birthdate
∏∏H Q
,
∏∏Q R
vetDto
∏∏S Y
.
∏∏Y Z
Gender
∏∏Z `
,
∏∏` a
vetDto
∏∏b h
.
∏∏h i
Email
∏∏i n
,
∏∏n o
vetDto
ππ 
.
ππ 
Phone
ππ 
,
ππ 
vetDto
ππ $
.
ππ$ %
Specialisation
ππ% 3
)
ππ3 4
;
ππ4 5
if
∫∫ 
(
∫∫ 
result
∫∫ 
.
∫∫ 
	IsFailure
∫∫  
)
∫∫  !
{
ªª 
return
ºº 

BadRequest
ºº !
(
ºº! "
result
ºº" (
.
ºº( )
Error
ºº) .
)
ºº. /
;
ºº/ 0
}
ΩΩ 

unitOfWork
øø 
.
øø 
VetRepository
øø $
.
øø$ %
Update
øø% +
(
øø+ ,
vet
øø, /
)
øø/ 0
;
øø0 1

unitOfWork
¿¿ 
.
¿¿ 
SaveChanges
¿¿ "
(
¿¿" #
)
¿¿# $
;
¿¿$ %
Response
¬¬ 
.
¬¬ 
Headers
¬¬ 
.
¬¬ 
Add
¬¬  
(
¬¬  !
$str
¬¬! ?
,
¬¬? @
$str
¬¬A g
)
¬¬g h
;
¬¬h i
Response
√√ 
.
√√ 
Headers
√√ 
.
√√ 
Add
√√  
(
√√  !
$str
√√! ?
,
√√? @
$str
√√A b
)
√√b c
;
√√c d
Response
ƒƒ 
.
ƒƒ 
Headers
ƒƒ 
.
ƒƒ 
Add
ƒƒ  
(
ƒƒ  !
$str
ƒƒ! >
,
ƒƒ> ?
$str
ƒƒ@ X
)
ƒƒX Y
;
ƒƒY Z
return
≈≈ 
	NoContent
≈≈ 
(
≈≈ 
)
≈≈ 
;
≈≈ 
}
∆∆ 	
[
»» 	
HttpPut
»»	 
(
»» 
$str
»» 6
)
»»6 7
]
»»7 8
public
…… 
IActionResult
…… 
	UpdatePet
…… &
(
……& '
Guid
……' +
vetClinicId
……, 7
,
……7 8
Guid
……9 =
petId
……> C
,
……C D
[
……E F
FromBody
……F N
]
……N O
CreatePetDto
……P \
petDto
……] c
)
……c d
{
   	
var
ÀÀ 
clinic
ÀÀ 
=
ÀÀ 

unitOfWork
ÀÀ #
.
ÀÀ# $!
VetClinicRepository
ÀÀ$ 7
.
ÀÀ7 8
Get
ÀÀ8 ;
(
ÀÀ; <
vetClinicId
ÀÀ< G
)
ÀÀG H
.
ÀÀH I
Result
ÀÀI O
;
ÀÀO P
if
ÃÃ 
(
ÃÃ 
clinic
ÃÃ 
==
ÃÃ 
null
ÃÃ 
)
ÃÃ 
{
ÕÕ 
return
ŒŒ 
NotFound
ŒŒ 
(
ŒŒ  
)
ŒŒ  !
;
ŒŒ! "
}
œœ 
var
—— 
pet
—— 
=
—— 

unitOfWork
——  
.
——  !
PetRepository
——! .
.
——. /
Get
——/ 2
(
——2 3
petId
——3 8
)
——8 9
.
——9 :
Result
——: @
;
——@ A
if
““ 
(
““ 
pet
““ 
==
““ 
null
““ 
)
““ 
{
”” 
return
‘‘ 
NotFound
‘‘ 
(
‘‘  
)
‘‘  !
;
‘‘! "
}
’’ 
var
◊◊ 
validatorResult
◊◊ 
=
◊◊  !#
createPetDtoValidator
◊◊" 7
.
◊◊7 8
Validate
◊◊8 @
(
◊◊@ A
petDto
◊◊A G
)
◊◊G H
;
◊◊H I
if
ÿÿ 
(
ÿÿ 
!
ÿÿ 
validatorResult
ÿÿ  
.
ÿÿ  !
IsValid
ÿÿ! (
)
ÿÿ( )
{
ŸŸ 
return
⁄⁄ 

BadRequest
⁄⁄ !
(
⁄⁄! "
validatorResult
⁄⁄" 1
.
⁄⁄1 2
Errors
⁄⁄2 8
)
⁄⁄8 9
;
⁄⁄9 :
}
€€ 
var
›› 
result
›› 
=
›› 
pet
›› 
.
›› 
Update
›› #
(
››# $
petDto
››$ *
.
››* +
Name
››+ /
,
››/ 0
petDto
››1 7
.
››7 8
	Birthdate
››8 A
,
››A B
petDto
››C I
.
››I J
Race
››J N
,
››N O
petDto
››P V
.
››V W
Gender
››W ]
)
››] ^
;
››^ _
if
ﬁﬁ 
(
ﬁﬁ 
result
ﬁﬁ 
.
ﬁﬁ 
	IsFailure
ﬁﬁ  
)
ﬁﬁ  !
{
ﬂﬂ 
return
‡‡ 

BadRequest
‡‡ !
(
‡‡! "
result
‡‡" (
.
‡‡( )
Error
‡‡) .
)
‡‡. /
;
‡‡/ 0
}
·· 

unitOfWork
„„ 
.
„„ 
PetRepository
„„ $
.
„„$ %
Update
„„% +
(
„„+ ,
pet
„„, /
)
„„/ 0
;
„„0 1

unitOfWork
‰‰ 
.
‰‰ 
SaveChanges
‰‰ "
(
‰‰" #
)
‰‰# $
;
‰‰$ %
Response
ÊÊ 
.
ÊÊ 
Headers
ÊÊ 
.
ÊÊ 
Add
ÊÊ  
(
ÊÊ  !
$str
ÊÊ! ?
,
ÊÊ? @
$str
ÊÊA a
)
ÊÊa b
;
ÊÊb c
Response
ÁÁ 
.
ÁÁ 
Headers
ÁÁ 
.
ÁÁ 
Add
ÁÁ  
(
ÁÁ  !
$str
ÁÁ! ?
,
ÁÁ? @
$str
ÁÁA b
)
ÁÁb c
;
ÁÁc d
Response
ËË 
.
ËË 
Headers
ËË 
.
ËË 
Add
ËË  
(
ËË  !
$str
ËË! >
,
ËË> ?
$str
ËË@ X
)
ËËX Y
;
ËËY Z
return
ÈÈ 
	NoContent
ÈÈ 
(
ÈÈ 
)
ÈÈ 
;
ÈÈ 
}
ÍÍ 	
[
ÏÏ 	

HttpDelete
ÏÏ	 
(
ÏÏ 
$str
ÏÏ (
)
ÏÏ( )
]
ÏÏ) *
public
ÌÌ 
IActionResult
ÌÌ 
Delete
ÌÌ #
(
ÌÌ# $
Guid
ÌÌ$ (
vetClinicId
ÌÌ) 4
)
ÌÌ4 5
{
ÓÓ 	
var
ÔÔ 
	vetClinic
ÔÔ 
=
ÔÔ 

unitOfWork
ÔÔ &
.
ÔÔ& '!
VetClinicRepository
ÔÔ' :
.
ÔÔ: ;
Get
ÔÔ; >
(
ÔÔ> ?
vetClinicId
ÔÔ? J
)
ÔÔJ K
.
ÔÔK L
Result
ÔÔL R
;
ÔÔR S
if
 
(
 
	vetClinic
 
==
 
null
 !
)
! "
{
ÒÒ 
return
ÚÚ 
NotFound
ÚÚ 
(
ÚÚ  
)
ÚÚ  !
;
ÚÚ! "
}
ÛÛ 
var
ıı 
medicalHistorys
ıı 
=
ıı  !

unitOfWork
ıı" ,
.
ıı, -&
MedicalHistoryRepository
ıı- E
.
ııE F
All
ııF I
(
ııI J
)
ııJ K
.
ııK L
Result
ııL R
.
ııR S
Where
ııS X
(
ııX Y
m
ııY Z
=>
ıı[ ]
m
ıı^ _
.
ıı_ `
ClinicId
ıı` h
==
ııi k
vetClinicId
ııl w
)
ııw x
;
ııx y
if
ˆˆ 
(
ˆˆ 
medicalHistorys
ˆˆ 
!=
ˆˆ  "
null
ˆˆ# '
)
ˆˆ' (
{
˜˜ 
foreach
¯¯ 
(
¯¯ 
var
¯¯ 
item
¯¯ !
in
¯¯" $
medicalHistorys
¯¯% 4
)
¯¯4 5
{
˘˘ 

unitOfWork
˙˙ 
.
˙˙ &
MedicalHistoryRepository
˙˙ 7
.
˙˙7 8
Delete
˙˙8 >
(
˙˙> ?
item
˙˙? C
)
˙˙C D
;
˙˙D E
}
˚˚ 
}
¸¸ 
var
˛˛ 
vets
˛˛ 
=
˛˛ 

unitOfWork
˛˛ !
.
˛˛! "
VetRepository
˛˛" /
.
˛˛/ 0
All
˛˛0 3
(
˛˛3 4
)
˛˛4 5
.
˛˛5 6
Result
˛˛6 <
.
˛˛< =
Where
˛˛= B
(
˛˛B C
v
˛˛C D
=>
˛˛E G
v
˛˛H I
.
˛˛I J
ClinicId
˛˛J R
==
˛˛S U
vetClinicId
˛˛V a
)
˛˛a b
;
˛˛b c
if
ˇˇ 
(
ˇˇ 
vets
ˇˇ 
!=
ˇˇ 
null
ˇˇ 
)
ˇˇ 
{
ÄÄ 
foreach
ÅÅ 
(
ÅÅ 
var
ÅÅ 
item
ÅÅ !
in
ÅÅ" $
vets
ÅÅ% )
)
ÅÅ) *
{
ÇÇ 

unitOfWork
ÉÉ 
.
ÉÉ 
VetRepository
ÉÉ ,
.
ÉÉ, -
Delete
ÉÉ- 3
(
ÉÉ3 4
item
ÉÉ4 8
)
ÉÉ8 9
;
ÉÉ9 :
}
ÑÑ 
}
ÖÖ 
var
áá 
pets
áá 
=
áá 

unitOfWork
áá !
.
áá! "
PetRepository
áá" /
.
áá/ 0
All
áá0 3
(
áá3 4
)
áá4 5
.
áá5 6
Result
áá6 <
.
áá< =
Where
áá= B
(
ááB C
p
ááC D
=>
ááE G
p
ááH I
.
ááI J
ClinicId
ááJ R
==
ááS U
vetClinicId
ááV a
)
ááa b
;
ááb c
if
àà 
(
àà 
pets
àà 
!=
àà 
null
àà 
)
àà 
{
ââ 
foreach
ää 
(
ää 
var
ää 
item
ää !
in
ää" $
pets
ää% )
)
ää) *
{
ãã 

unitOfWork
åå 
.
åå 
PetRepository
åå ,
.
åå, -
Delete
åå- 3
(
åå3 4
item
åå4 8
)
åå8 9
;
åå9 :
}
çç 
}
éé 

unitOfWork
êê 
.
êê !
VetClinicRepository
êê *
.
êê* +
Delete
êê+ 1
(
êê1 2
	vetClinic
êê2 ;
)
êê; <
;
êê< =

unitOfWork
ëë 
.
ëë 
SaveChanges
ëë "
(
ëë" #
)
ëë# $
;
ëë$ %
Response
ìì 
.
ìì 
Headers
ìì 
.
ìì 
Add
ìì  
(
ìì  !
$str
ìì! ?
,
ìì? @
$str
ììA a
)
ììa b
;
ììb c
Response
îî 
.
îî 
Headers
îî 
.
îî 
Add
îî  
(
îî  !
$str
îî! >
,
îî> ?
$str
îî@ X
)
îîX Y
;
îîY Z
Response
ïï 
.
ïï 
Headers
ïï 
.
ïï 
Add
ïï  
(
ïï  !
$str
ïï! ?
,
ïï? @
$str
ïïA b
)
ïïb c
;
ïïc d
return
ññ 
	NoContent
ññ 
(
ññ 
)
ññ 
;
ññ 
}
óó 	
[
ôô 	

HttpDelete
ôô	 
(
ôô 
$str
ôô 9
)
ôô9 :
]
ôô: ;
public
öö 
IActionResult
öö 
	DeleteVet
öö &
(
öö& '
Guid
öö' +
vetClinicId
öö, 7
,
öö7 8
Guid
öö9 =
vetId
öö> C
)
ööC D
{
õõ 	
var
úú 
clinic
úú 
=
úú 

unitOfWork
úú #
.
úú# $!
VetClinicRepository
úú$ 7
.
úú7 8
Get
úú8 ;
(
úú; <
vetClinicId
úú< G
)
úúG H
.
úúH I
Result
úúI O
;
úúO P
if
ùù 
(
ùù 
clinic
ùù 
==
ùù 
null
ùù 
)
ùù 
{
ûû 
return
üü 
NotFound
üü 
(
üü  
)
üü  !
;
üü! "
}
†† 
var
¢¢ 
vet
¢¢ 
=
¢¢ 

unitOfWork
¢¢  
.
¢¢  !
VetRepository
¢¢! .
.
¢¢. /
Get
¢¢/ 2
(
¢¢2 3
vetId
¢¢3 8
)
¢¢8 9
.
¢¢9 :
Result
¢¢: @
;
¢¢@ A
if
££ 
(
££ 
vet
££ 
==
££ 
null
££ 
)
££ 
{
§§ 
return
•• 
NotFound
•• 
(
••  
)
••  !
;
••! "
}
¶¶ 

unitOfWork
®® 
.
®® 
VetRepository
®® $
.
®®$ %
Delete
®®% +
(
®®+ ,
vet
®®, /
)
®®/ 0
;
®®0 1

unitOfWork
©© 
.
©© 
SaveChanges
©© "
(
©©" #
)
©©# $
;
©©$ %
Response
´´ 
.
´´ 
Headers
´´ 
.
´´ 
Add
´´  
(
´´  !
$str
´´! ?
,
´´? @
$str
´´A a
)
´´a b
;
´´b c
Response
¨¨ 
.
¨¨ 
Headers
¨¨ 
.
¨¨ 
Add
¨¨  
(
¨¨  !
$str
¨¨! ?
,
¨¨? @
$str
¨¨A b
)
¨¨b c
;
¨¨c d
Response
≠≠ 
.
≠≠ 
Headers
≠≠ 
.
≠≠ 
Add
≠≠  
(
≠≠  !
$str
≠≠! >
,
≠≠> ?
$str
≠≠@ X
)
≠≠X Y
;
≠≠Y Z
return
ÆÆ 
	NoContent
ÆÆ 
(
ÆÆ 
)
ÆÆ 
;
ÆÆ 
}
ØØ 	
[
±± 	

HttpDelete
±±	 
(
±± 
$str
±± 9
)
±±9 :
]
±±: ;
public
≤≤ 
IActionResult
≤≤ 
	DeletePet
≤≤ &
(
≤≤& '
Guid
≤≤' +
vetClinicId
≤≤, 7
,
≤≤7 8
Guid
≤≤9 =
petId
≤≤> C
)
≤≤C D
{
≥≥ 	
var
¥¥ 
clinic
¥¥ 
=
¥¥ 

unitOfWork
¥¥ #
.
¥¥# $!
VetClinicRepository
¥¥$ 7
.
¥¥7 8
Get
¥¥8 ;
(
¥¥; <
vetClinicId
¥¥< G
)
¥¥G H
.
¥¥H I
Result
¥¥I O
;
¥¥O P
if
µµ 
(
µµ 
clinic
µµ 
==
µµ 
null
µµ 
)
µµ 
{
∂∂ 
return
∑∑ 
NotFound
∑∑ 
(
∑∑  
)
∑∑  !
;
∑∑! "
}
∏∏ 
var
∫∫ 
pet
∫∫ 
=
∫∫ 

unitOfWork
∫∫  
.
∫∫  !
PetRepository
∫∫! .
.
∫∫. /
Get
∫∫/ 2
(
∫∫2 3
petId
∫∫3 8
)
∫∫8 9
.
∫∫9 :
Result
∫∫: @
;
∫∫@ A
if
ªª 
(
ªª 
pet
ªª 
==
ªª 
null
ªª 
)
ªª 
{
ºº 
return
ΩΩ 
NotFound
ΩΩ 
(
ΩΩ  
)
ΩΩ  !
;
ΩΩ! "
}
ææ 

unitOfWork
¿¿ 
.
¿¿ 
PetRepository
¿¿ $
.
¿¿$ %
Delete
¿¿% +
(
¿¿+ ,
pet
¿¿, /
)
¿¿/ 0
;
¿¿0 1

unitOfWork
¡¡ 
.
¡¡ 
SaveChanges
¡¡ "
(
¡¡" #
)
¡¡# $
;
¡¡$ %
Response
√√ 
.
√√ 
Headers
√√ 
.
√√ 
Add
√√  
(
√√  !
$str
√√! ?
,
√√? @
$str
√√A a
)
√√a b
;
√√b c
Response
ƒƒ 
.
ƒƒ 
Headers
ƒƒ 
.
ƒƒ 
Add
ƒƒ  
(
ƒƒ  !
$str
ƒƒ! ?
,
ƒƒ? @
$str
ƒƒA b
)
ƒƒb c
;
ƒƒc d
Response
≈≈ 
.
≈≈ 
Headers
≈≈ 
.
≈≈ 
Add
≈≈  
(
≈≈  !
$str
≈≈! >
,
≈≈> ?
$str
≈≈@ X
)
≈≈X Y
;
≈≈Y Z
return
∆∆ 
	NoContent
∆∆ 
(
∆∆ 
)
∆∆ 
;
∆∆ 
}
«« 	
}
»» 
}…… Æ
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
} É
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
}		 º

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
} ∑
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
 À
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
} •
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
} À
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
}		 è
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
} Ç	
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
} ¢
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
} Ó
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
 Ú
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
} Î
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
}		 ˙
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
}		 å
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
}		 ˝
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
}		 ≈
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
} Ö
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
} √
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
} ƒ
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
} Æ
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
} ì
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
} Ã
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
} ”
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
} ¨
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
} è
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
} ∫
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
} Ø
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
} Ã
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
} Ÿ
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
} Ω
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
} ∂
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
} Ω
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
} ∂
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
} ¨
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
} è
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
} ˚0
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
®
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
} Ä
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
} ±
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
} Ë
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
} ó	
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
} ﬁ
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
} √
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
} °
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
} Ω
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