¥
OC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.API\ConfigureServices.cs
	namespace 	
VetAppointment
 
. 
API 
{ 
public 

static 
class 
ConfigureServices )
{ 
public		 
static		 
IServiceCollection		 (
AddAPIServices		) 7
(		8 9
this		9 =
IServiceCollection		> P
services		Q Y
)		Y Z
{

 	
services 
. -
!AddFluentValidationAutoValidation 6
(6 7
)7 8
;8 9
services 
. %
AddValidatorsFromAssembly .
(. /
Assembly/ 7
.7 8 
GetExecutingAssembly8 L
(L M
)M N
)N O
;O P
return 
services 
; 
} 	
} 
} æ~
`C:\Users\Leonard\Desktop\VetAppointment\VetAppointment.API\Controllers\AppointmentsController.cs
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
$str		 3
)		3 4
]		4 5
[

 
ApiController

 
]

 
[ 

ApiVersion 
( 
$str 
) 
] 
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
;/ 0
public "
AppointmentsController %
(% &
IUnitOfWork& 1

unitOfWork2 <
)< =
=>> @
thisA E
.E F

unitOfWorkF P
=Q R

unitOfWorkS ]
;] ^
[ 	
HttpPost	 
] 
public 
IActionResult 
Create #
(# $
[$ %
FromBody% -
]- . 
CreateAppointmentDto/ C
appointmentDtoD R
)R S
{ 	
var 
pet 
= 

unitOfWork  
.  !
PetRepository! .
.. /
Get/ 2
(2 3
appointmentDto3 A
.A B
PetIdB G
)G H
.H I
ResultI O
;O P
if 
( 
pet 
== 
null 
) 
{ 
return 
NotFound 
(  
)  !
;! "
} 
var 
vet 
= 

unitOfWork  
.  !
VetRepository! .
.. /
Get/ 2
(2 3
appointmentDto3 A
.A B
VetIdB G
)G H
.H I
ResultI O
;O P
if 
( 
vet 
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
var!! 
appointment!! 
=!! 
Appointment!! )
.!!) *
SettleAppointment!!* ;
(!!; <
vet"" 
,"" 
pet## 
,## 
appointmentDto$$ "
.$$" #
ScheduledDate$$# 0
,$$0 1
appointmentDto%% "
.%%" #&
EstimatedDurationInMinutes%%# =
)&& 
;&& 
var(( 

treatement(( 
=(( 

unitOfWork(( '
.((' (
TreatmentRepository((( ;
.((; <
Get((< ?
(((? @
appointmentDto((@ N
.((N O
TreatmentId((O Z
)((Z [
.(([ \
Result((\ b
;((b c
if)) 
()) 

treatement)) 
==)) 
null)) "
)))# $
{** 
return++ 
NotFound++ 
(++  
)++  !
;++! "
},, 
var.. 
history.. 
=.. 

unitOfWork.. $
...$ %$
MedicalHistoryRepository..% =
...= >
Get..> A
(..A B
appointmentDto..B P
...P Q
MedicalHistoryId..Q a
)..a b
...b c
Result..c i
;..i j
if// 
(// 
history// 
==// 
null// 
)//  
{00 
return11 
NotFound11 
(11  
)11  !
;11! "
}22 
history44 
.44 (
RegisterAppointmentToHistory44 0
(440 1
appointment441 <
.44< =
Entity44= C
)44C D
;44D E

unitOfWork55 
.55 $
MedicalHistoryRepository55 /
.55/ 0
Update550 6
(556 7
history557 >
)55> ?
;55? @

unitOfWork66 
.66 
SaveChanges66 "
(66" #
)66# $
;66$ %
appointment88 
.88 
Entity88 
.88 (
AttachTreatmentToAppointment88 ;
(88; <

treatement88< F
)88F G
;88G H
appointment99 
.99 
Entity99 
.99 -
!AttachAppointmentToMedicalHistory99 @
(99@ A
history99A H
)99H I
;99I J
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
}?? 

unitOfWorkAA 
.AA !
AppointmentRepositoryAA ,
.AA, -
AddAA- 0
(AA0 1
appointmentAA1 <
.AA< =
EntityAA= C
)AAC D
;AAD E

unitOfWorkBB 
.BB 
SaveChangesBB "
(BB" #
)BB# $
;BB$ %
varCC 
fullAppointmentCC 
=CC  !
newCC" %
AppointmentDtoCC& 4
{DD 
IdEE 
=EE 
appointmentEE  
.EE  !
EntityEE! '
.EE' (
IdEE( *
,EE* +
VetIdFF 
=FF 
appointmentFF #
.FF# $
EntityFF$ *
.FF* +
VetIdFF+ 0
,FF0 1
PetIdGG 
=GG 
appointmentGG #
.GG# $
EntityGG$ *
.GG* +
PetIdGG+ 0
,GG0 1
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
}JJ 
;JJ 
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
returnOO 
CreatedOO 
(OO 
nameofOO !
(OO! "
GetAllAppointmentsOO" 4
)OO4 5
,OO5 6
fullAppointmentOO7 F
)OOF G
;OOG H
}PP 	
[RR 	
HttpGetRR	 
]RR 
publicSS 
IActionResultSS 
GetAllAppointmentsSS /
(SS/ 0
)SS0 1
{TT 	
varUU 
appointmentsUU 
=UU 

unitOfWorkUU )
.UU) *!
AppointmentRepositoryUU* ?
.UU? @
AllUU@ C
(UUC D
)UUD E
.UUE F
ResultUUF L
.UUL M
SelectUUM S
(UUS T
appointmentUUT _
=>UU` b
newUUc f
AppointmentDtoUUg u
(UUu v
)UUv w
{VV 
IdWW 
=WW 
appointmentWW  
.WW  !
IdWW! #
,WW# $
VetIdXX 
=XX 
appointmentXX #
.XX# $
VetIdXX$ )
,XX) *
PetIdYY 
=YY 
appointmentYY #
.YY# $
PetIdYY$ )
,YY) *
ScheduledDateZZ 
=ZZ 
appointmentZZ  +
.ZZ+ ,
ScheduledDateZZ, 9
.ZZ9 :
ToStringZZ: B
(ZZB C
)ZZC D
,ZZD E&
EstimatedDurationInMinutes[[ *
=[[+ ,
appointment[[- 8
.[[8 9&
EstimatedDurationInMinutes[[9 S
,[[S T
TreatmentId\\ 
=\\ 
appointment\\ )
.\\) *
TreatmentId\\* 5
,\\5 6
MedicalHistoryId]]  
=]]! "
appointment]]# .
.]]. /
MedicalHistoryId]]/ ?
}^^ 
)^^ 
;^^ 
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
returncc 
Okcc 
(cc 
appointmentscc "
)cc" #
;cc# $
}dd 	
[ff 	
HttpGetff	 
(ff 
$strff 
)ff 
]ff 
publicgg 
IActionResultgg 
GetAppointmentByIdgg /
(gg/ 0
Guidgg0 4
idgg5 7
)gg7 8
{hh 	
varii 
appointmentii 
=ii 

unitOfWorkii (
.ii( )!
AppointmentRepositoryii) >
.ii> ?
Getii? B
(iiB C
idiiC E
)iiE F
.iiF G
ResultiiG M
;iiM N
ifjj 
(jj 
appointmentjj 
==jj 
nulljj #
)jj# $
{kk 
returnll 
NotFoundll 
(ll  
)ll  !
;ll! "
}mm 
varoo 
appointmentDtooo 
=oo  
newoo! $
AppointmentDtooo% 3
{pp 
Idqq 
=qq 
appointmentqq  
.qq  !
Idqq! #
,qq# $
VetIdrr 
=rr 
appointmentrr #
.rr# $
VetIdrr$ )
,rr) *
PetIdss 
=ss 
appointmentss #
.ss# $
PetIdss$ )
,ss) *
ScheduledDatett 
=tt 
appointmenttt  +
.tt+ ,
ScheduledDatett, 9
.tt9 :
ToStringtt: B
(ttB C
)ttC D
,ttD E&
EstimatedDurationInMinutesuu *
=uu+ ,
appointmentuu- 8
.uu8 9&
EstimatedDurationInMinutesuu9 S
,uuS T
TreatmentIdvv 
=vv 
appointmentvv )
.vv) *
TreatmentIdvv* 5
,vv5 6
MedicalHistoryIdww  
=ww! "
appointmentww# .
.ww. /
MedicalHistoryIdww/ ?
}xx 
;xx 
Responsezz 
.zz 
Headerszz 
.zz 
Addzz  
(zz  !
$strzz! ?
,zz? @
$strzzA a
)zza b
;zzb c
Response{{ 
.{{ 
Headers{{ 
.{{ 
Add{{  
({{  !
$str{{! ?
,{{? @
$str{{A b
){{b c
;{{c d
Response|| 
.|| 
Headers|| 
.|| 
Add||  
(||  !
$str||! >
,||> ?
$str||@ X
)||X Y
;||Y Z
return}} 
Ok}} 
(}} 
appointmentDto}} $
)}}$ %
;}}% &
}~~ 	
[
ÄÄ 	

HttpDelete
ÄÄ	 
(
ÄÄ 
$str
ÄÄ 
)
ÄÄ 
]
ÄÄ 
public
ÅÅ 
IActionResult
ÅÅ 
DeleteAppointment
ÅÅ .
(
ÅÅ. /
Guid
ÅÅ/ 3
id
ÅÅ4 6
)
ÅÅ6 7
{
ÇÇ 	
var
ÉÉ 
appointment
ÉÉ 
=
ÉÉ 

unitOfWork
ÉÉ (
.
ÉÉ( )#
AppointmentRepository
ÉÉ) >
.
ÉÉ> ?
Get
ÉÉ? B
(
ÉÉB C
id
ÉÉC E
)
ÉÉE F
.
ÉÉF G
Result
ÉÉG M
;
ÉÉM N
if
ÑÑ 
(
ÑÑ 
appointment
ÑÑ 
==
ÑÑ 
null
ÑÑ #
)
ÑÑ# $
{
ÖÖ 
return
ÜÜ 
NotFound
ÜÜ 
(
ÜÜ  
)
ÜÜ  !
;
ÜÜ! "
}
áá 

unitOfWork
ââ 
.
ââ #
AppointmentRepository
ââ ,
.
ââ, -
Delete
ââ- 3
(
ââ3 4
appointment
ââ4 ?
)
ââ? @
;
ââ@ A

unitOfWork
ää 
.
ää 
SaveChanges
ää "
(
ää" #
)
ää# $
;
ää$ %
Response
åå 
.
åå 
Headers
åå 
.
åå 
Add
åå  
(
åå  !
$str
åå! ?
,
åå? @
$str
ååA a
)
ååa b
;
ååb c
Response
çç 
.
çç 
Headers
çç 
.
çç 
Add
çç  
(
çç  !
$str
çç! ?
,
çç? @
$str
ççA b
)
ççb c
;
ççc d
Response
éé 
.
éé 
Headers
éé 
.
éé 
Add
éé  
(
éé  !
$str
éé! >
,
éé> ?
$str
éé@ X
)
ééX Y
;
ééY Z
return
èè 
	NoContent
èè 
(
èè 
)
èè 
;
èè 
}
êê 	
[
íí 	
HttpPut
íí	 
(
íí 
$str
íí 
)
íí 
]
íí 
public
ìì 
IActionResult
ìì 
UpdateAppointment
ìì .
(
ìì. /
Guid
ìì/ 3
id
ìì4 6
,
ìì6 7
[
ìì8 9
FromBody
ìì9 A
]
ììA B
AppointmentDto
ììC Q
appointmentDto
ììR `
)
ìì` a
{
îî 	
var
ïï 
appointment
ïï 
=
ïï 

unitOfWork
ïï (
.
ïï( )#
AppointmentRepository
ïï) >
.
ïï> ?
Get
ïï? B
(
ïïB C
id
ïïC E
)
ïïE F
.
ïïF G
Result
ïïG M
;
ïïM N
if
ññ 
(
ññ 
appointment
ññ 
==
ññ 
null
ññ #
)
ññ# $
{
óó 
return
òò 
NotFound
òò 
(
òò  
)
òò  !
;
òò! "
}
ôô 
appointment
õõ 
.
õõ 
Update
õõ 
(
õõ 
appointment
õõ *
.
õõ* +
VetId
õõ+ 0
,
õõ0 1
appointmentDto
õõ2 @
.
õõ@ A
PetId
õõA F
,
õõF G
appointmentDto
õõH V
.
õõV W
ScheduledDate
õõW d
,
õõd e
appointmentDto
úú 
.
úú (
EstimatedDurationInMinutes
úú 9
,
úú9 :
appointmentDto
úú; I
.
úúI J
TreatmentId
úúJ U
,
úúU V
appointmentDto
úúW e
.
úúe f
MedicalHistoryId
úúf v
)
úúv w
;
úúw x

unitOfWork
ûû 
.
ûû #
AppointmentRepository
ûû ,
.
ûû, -
Update
ûû- 3
(
ûû3 4
appointment
ûû4 ?
)
ûû? @
;
ûû@ A

unitOfWork
üü 
.
üü 
SaveChanges
üü "
(
üü" #
)
üü# $
;
üü$ %
Response
°° 
.
°° 
Headers
°° 
.
°° 
Add
°°  
(
°°  !
$str
°°! ?
,
°°? @
$str
°°A a
)
°°a b
;
°°b c
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
¢¢A b
)
¢¢b c
;
¢¢c d
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
££! >
,
££> ?
$str
££@ X
)
££X Y
;
££Y Z
return
§§ 
	NoContent
§§ 
(
§§ 
)
§§ 
;
§§ 
}
•• 	
}
¶¶ 
}ßß ÙJ
YC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.API\Controllers\DrugsController.cs
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
 2
)

2 3
]

3 4
[ 
ApiController 
] 
[ 

ApiVersion 
( 
$str 
) 
] 
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
;9 :
public 
DrugsController 
( 
IRepository *
<* +
Drug+ /
>/ 0
drugRepository1 ?
)? @
=>A C
thisD H
.H I
drugRepositoryI W
=X Y
drugRepositoryZ h
;h i
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
Result- 3
.3 4
Select4 :
(: ;

DrugMapper; E
.E F
MapperF L
.L M
MapM P
<P Q
DrugDtoQ X
>X Y
)Y Z
;Z [
Response 
. 
Headers 
. 
Add  
(  !
$str! ?
,? @
$strA a
)a b
;b c
Response 
. 
Headers 
. 
Add  
(  !
$str! ?
,? @
$strA b
)b c
;c d
Response 
. 
Headers 
. 
Add  
(  !
$str! >
,> ?
$str@ X
)X Y
;Y Z
return 
Ok 
( 
drugs 
) 
; 
} 	
[ 	
HttpGet	 
( 
$str  
)  !
]! "
public 
IActionResult 
Get  
(  !
Guid! %
drugId& ,
), -
{   	
var!! 
drug!! 
=!! 
drugRepository!! %
.!!% &
Get!!& )
(!!) *
drugId!!* 0
)!!0 1
.!!1 2
Result!!2 8
;!!8 9
if## 
(## 
drug## 
==## 
null## 
)## 
{$$ 
return%% 
NotFound%% 
(%%  
)%%  !
;%%! "
}&& 
var(( 
drugDto(( 
=(( 

DrugMapper(( $
.(($ %
Mapper((% +
.((+ ,
Map((, /
<((/ 0
DrugDto((0 7
>((7 8
(((8 9
drug((9 =
)((= >
;((> ?
Response** 
.** 
Headers** 
.** 
Add**  
(**  !
$str**! ?
,**? @
$str**A a
)**a b
;**b c
Response++ 
.++ 
Headers++ 
.++ 
Add++  
(++  !
$str++! ?
,++? @
$str++A b
)++b c
;++c d
Response,, 
.,, 
Headers,, 
.,, 
Add,,  
(,,  !
$str,,! >
,,,> ?
$str,,@ X
),,X Y
;,,Y Z
return-- 
Ok-- 
(-- 
drugDto-- 
)-- 
;-- 
}.. 	
[00 	
HttpPost00	 
]00 
public11 
IActionResult11 
Create11 #
(11# $
[11$ %
FromBody11% -
]11- .
CreateDrugDto11/ <
drugDto11= D
)11D E
{22 	
var33 
drug33 
=33 

DrugMapper33 !
.33! "
Mapper33" (
.33( )
Map33) ,
<33, -
Drug33- 1
>331 2
(332 3
drugDto333 :
)33: ;
;33; <
if55 
(55 
drug55 
==55 
null55 
)55 
{66 
return77 

BadRequest77 !
(77! "
)77" #
;77# $
}88 
drugRepository:: 
.:: 
Add:: 
(:: 
drug:: #
)::# $
;::$ %
drugRepository;; 
.;; 
SaveChanges;; &
(;;& '
);;' (
;;;( )
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
return@@ 
Created@@ 
(@@ 
nameof@@ !
(@@! "
Get@@" %
)@@% &
,@@& '

DrugMapper@@( 2
.@@2 3
Mapper@@3 9
.@@9 :
Map@@: =
<@@= >
DrugDto@@> E
>@@E F
(@@F G
drug@@G K
)@@K L
)@@L M
;@@M N
}AA 	
[CC 	

HttpDeleteCC	 
(CC 
$strCC #
)CC# $
]CC$ %
publicDD 
IActionResultDD 
DeleteDD #
(DD# $
GuidDD$ (
drugIdDD) /
)DD/ 0
{EE 	
varFF 
drugFF 
=FF 
drugRepositoryFF %
.FF% &
GetFF& )
(FF) *
drugIdFF* 0
)FF0 1
.FF1 2
ResultFF2 8
;FF8 9
ifGG 
(GG 
drugGG 
==GG 
nullGG 
)GG 
{HH 
returnII 
NotFoundII 
(II  
)II  !
;II! "
}JJ 
drugRepositoryLL 
.LL 
DeleteLL !
(LL! "
drugLL" &
)LL& '
;LL' (
drugRepositoryMM 
.MM 
SaveChangesMM &
(MM& '
)MM' (
;MM( )
ResponseOO 
.OO 
HeadersOO 
.OO 
AddOO  
(OO  !
$strOO! ?
,OO? @
$strOOA a
)OOa b
;OOb c
ResponsePP 
.PP 
HeadersPP 
.PP 
AddPP  
(PP  !
$strPP! ?
,PP? @
$strPPA b
)PPb c
;PPc d
ResponseQQ 
.QQ 
HeadersQQ 
.QQ 
AddQQ  
(QQ  !
$strQQ! >
,QQ> ?
$strQQ@ X
)QQX Y
;QQY Z
returnRR 
OkRR 
(RR 
)RR 
;RR 
}SS 	
[UU 	
HttpPutUU	 
(UU 
$strUU  
)UU  !
]UU! "
publicVV 
IActionResultVV 
UpdateVV #
(VV# $
GuidVV$ (
drugIdVV) /
,VV/ 0
[VV1 2
FromBodyVV2 :
]VV: ;
CreateDrugDtoVV< I
drugDtoVVJ Q
)VVQ R
{WW 	
varXX 
drugXX 
=XX 
drugRepositoryXX %
.XX% &
GetXX& )
(XX) *
drugIdXX* 0
)XX0 1
.XX1 2
ResultXX2 8
;XX8 9
ifYY 
(YY 
drugYY 
==YY 
nullYY 
)YY 
{ZZ 
return[[ 
NotFound[[ 
([[  
)[[  !
;[[! "
}\\ 
drug^^ 
.^^ 
Update^^ 
(^^ 
drugDto^^ 
.^^  
Name^^  $
,^^$ %
drugDto^^& -
.^^- .
Quantity^^. 6
,^^6 7
drugDto^^8 ?
.^^? @
	UnitPrice^^@ I
)^^I J
;^^J K
drugRepository`` 
.`` 
Update`` !
(``! "
drug``" &
)``& '
;``' (
drugRepositoryaa 
.aa 
SaveChangesaa &
(aa& '
)aa' (
;aa( )
Responsecc 
.cc 
Headerscc 
.cc 
Addcc  
(cc  !
$strcc! ?
,cc? @
$strccA a
)cca b
;ccb c
Responsedd 
.dd 
Headersdd 
.dd 
Adddd  
(dd  !
$strdd! ?
,dd? @
$strddA b
)ddb c
;ddc d
Responseee 
.ee 
Headersee 
.ee 
Addee  
(ee  !
$stree! >
,ee> ?
$stree@ X
)eeX Y
;eeY Z
returnff 
Okff 
(ff 

DrugMapperff  
.ff  !
Mapperff! '
.ff' (
Mapff( +
<ff+ ,
DrugDtoff, 3
>ff3 4
(ff4 5
drugff5 9
)ff9 :
)ff: ;
;ff; <
}gg 	
}hh 
}ii ÍE
dC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.API\Controllers\MedicalHistoriesController.cs
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
 3
)

3 4
]

4 5
[ 
ApiController 
] 
[ 

ApiVersion 
( 
$str 
) 
] 
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
;/ 0
public &
MedicalHistoriesController )
() *
IUnitOfWork* 5

unitOfWork6 @
)@ A
=>B D
thisE I
.I J

unitOfWorkJ T
=U V

unitOfWorkW a
;a b
[ 	
HttpGet	 
] 
public 
IActionResult 
Get  
(  !
)! "
{ 	
var 
medicalHistories  
=! "

unitOfWork# -
.- .$
MedicalHistoryRepository. F
. 
All 
( 
) 
. 
Result 
. 
Select $
($ % 
MedicalHistoryMapper% 9
.9 :
Mapper: @
.@ A
MapA D
<D E
MedicalHistoryDtoE V
>V W
)W X
;X Y
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
return 
Ok 
( 
medicalHistories &
)& '
;' (
} 	
[   	
HttpGet  	 
(   
$str   "
)  " #
]  # $
public!! 
IActionResult!! 
GetByClinicId!! *
(!!* +
Guid!!+ /
clinicId!!0 8
)!!8 9
{"" 	
var## 
clinic## 
=## 

unitOfWork## #
.### $
VetClinicRepository##$ 7
.##7 8
Get##8 ;
(##; <
clinicId##< D
)##D E
.##E F
Result##F L
;##L M
if$$ 
($$ 
clinic$$ 
==$$ 
null$$ 
)$$ 
{%% 
return&& 
NotFound&& 
(&&  
)&&  !
;&&! "
}'' 
var(( 
medicalHistory(( 
=((   
MedicalHistoryMapper((! 5
.((5 6
Mapper((6 <
.)) 
Map)) 
<)) 
MedicalHistoryDto)) &
>))& '
())' (

unitOfWork))( 2
.))2 3$
MedicalHistoryRepository))3 K
.** 
Find** 
(** 
md** 
=>** 
md** 
.** 
ClinicId** '
==**( *
clinicId**+ 3
)**3 4
)**4 5
;**5 6
if++ 
(++ 
medicalHistory++ 
==++ !
null++" &
)++& '
{,, 
return-- 
NotFound-- 
(--  
)--  !
;--! "
}.. 
Response00 
.00 
Headers00 
.00 
Add00  
(00  !
$str00! ?
,00? @
$str00A a
)00a b
;00b c
Response11 
.11 
Headers11 
.11 
Add11  
(11  !
$str11! ?
,11? @
$str11A b
)11b c
;11c d
Response22 
.22 
Headers22 
.22 
Add22  
(22  !
$str22! >
,22> ?
$str22@ X
)22X Y
;22Y Z
return44 
Ok44 
(44 
medicalHistory44 $
)44$ %
;44% &
}55 	
[77 	
HttpPost77	 
(77 
$str77 7
)777 8
]778 9
public88 
IActionResult88 
Post88 !
(88! "
Guid88" &
medicalHistoryId88' 7
,887 8
[889 :
FromBody88: B
]88B C 
CreateAppointmentDto88D X
appointmentDto88Y g
)88g h
{99 	
var:: 
medicalHistory:: 
=::  

unitOfWork::! +
.::+ ,$
MedicalHistoryRepository::, D
.::D E
Get::E H
(::H I
medicalHistoryId::I Y
)::Y Z
.::Z [
Result::[ a
;::a b
if;; 
(;; 
medicalHistory;; 
==;; !
null;;" &
);;& '
{<< 
return== 
NotFound== 
(==  
)==  !
;==! "
}>> 
var@@ 
pet@@ 
=@@ 

unitOfWork@@  
.@@  !
PetRepository@@! .
.@@. /
Get@@/ 2
(@@2 3
appointmentDto@@3 A
.@@A B
PetId@@B G
)@@G H
.@@H I
Result@@I O
;@@O P
ifAA 
(AA 
petAA 
==AA 
nullAA 
)AA 
{BB 
returnCC 
NotFoundCC 
(CC  
)CC  !
;CC! "
}DD 
varFF 
vetFF 
=FF 

unitOfWorkFF  
.FF  !
VetRepositoryFF! .
.FF. /
GetFF/ 2
(FF2 3
appointmentDtoFF3 A
.FFA B
VetIdFFB G
)FFG H
.FFH I
ResultFFI O
;FFO P
ifGG 
(GG 
vetGG 
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
varLL 
appointmentLL 
=LL 
AppointmentLL )
.LL) *
SettleAppointmentLL* ;
(LL; <
vetMM 
,MM 
petNN 
,NN 
appointmentDtoOO 
.OO 
ScheduledDateOO ,
,OO, -
appointmentDtoPP 
.PP &
EstimatedDurationInMinutesPP 9
)QQ 
;QQ 
ifRR 
(RR 
appointmentRR 
.RR 
	IsFailureRR %
)RR% &
{SS 
returnTT 

BadRequestTT !
(TT! "
appointmentTT" -
.TT- .
ErrorTT. 3
)TT3 4
;TT4 5
}UU 
varWW 
resultWW 
=WW 
medicalHistoryWW '
.WW' ((
RegisterAppointmentToHistoryWW( D
(WWD E
appointmentWWE P
.WWP Q
EntityWWQ W
)WWW X
;WWX Y
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
.]] !
AppointmentRepository]] ,
.]], -
Add]]- 0
(]]0 1
appointment]]1 <
.]]< =
Entity]]= C
)]]C D
;]]D E

unitOfWork^^ 
.^^ 
SaveChanges^^ "
(^^" #
)^^# $
;^^$ %
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
(cc! "
Postcc" &
)cc& '
,cc' (
AppointmentMappercc) :
.cc: ;
Mappercc; A
.ccA B
MapccB E
<ccE F
AppointmentDtoccF T
>ccT U
(ccU V
appointmentccV a
.cca b
Entityccb h
)cch i
)cci j
;ccj k
}dd 	
}ee 
}ff È>
]C:\Users\Leonard\Desktop\VetAppointment\VetAppointment.API\Controllers\PetOwnersController.cs
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
 3
)

3 4
]

4 5
[ 
ApiController 
] 
[ 

ApiVersion 
( 
$str 
) 
] 
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
;7 8
public 
PetOwnersController "
(" #
IRepository# .
<. /
PetOwner/ 7
>7 8
petOwnerRepository9 K
,K L
IRepositoryM X
<X Y
PetY \
>\ ]
petRepository^ k
)k l
{ 	
this 
. 
petOwnerRepository #
=$ %
petOwnerRepository& 8
;8 9
this 
. 
petRepository 
=  
petRepository! .
;. /
} 	
[ 	
HttpGet	 
] 
public 
IActionResult 
Get  
(  !
)! "
{ 	
var 
	petOwners 
= 
petOwnerRepository .
.. /
All/ 2
(2 3
)3 4
.4 5
Result5 ;
.; <
Select< B
(B C
PetOwnerMapperC Q
.Q R
MapperR X
.X Y
MapY \
<\ ]
PetOwnerDto] h
>h i
)i j
;j k
Response 
. 
Headers 
. 
Add  
(  !
$str! ?
,? @
$strA g
)g h
;h i
Response 
. 
Headers 
. 
Add  
(  !
$str! ?
,? @
$strA b
)b c
;c d
Response 
. 
Headers 
. 
Add  
(  !
$str! >
,> ?
$str@ X
)X Y
;Y Z
return   
Ok   
(   
	petOwners   
)    
;    !
}!! 	
[## 	
HttpPost##	 
]## 
public$$ 
IActionResult$$ 
Create$$ #
($$# $
[$$$ %
FromBody$$% -
]$$- .
CreatePetOwnerDto$$/ @
petOwnerDto$$A L
)$$L M
{%% 	
var&& 
petOwner&& 
=&& 
PetOwnerMapper&& )
.&&) *
Mapper&&* 0
.&&0 1
Map&&1 4
<&&4 5
PetOwner&&5 =
>&&= >
(&&> ?
petOwnerDto&&? J
)&&J K
;&&K L
if(( 
((( 
petOwner(( 
==(( 
null((  
)((  !
{)) 
return** 

BadRequest** !
(**! "
)**" #
;**# $
}++ 
petOwnerRepository-- 
.-- 
Add-- "
(--" #
petOwner--# +
)--+ ,
;--, -
petOwnerRepository.. 
... 
SaveChanges.. *
(..* +
)..+ ,
;.., -
Response00 
.00 
Headers00 
.00 
Add00  
(00  !
$str00! ?
,00? @
$str00A g
)00g h
;00h i
Response11 
.11 
Headers11 
.11 
Add11  
(11  !
$str11! ?
,11? @
$str11A b
)11b c
;11c d
Response22 
.22 
Headers22 
.22 
Add22  
(22  !
$str22! >
,22> ?
$str22@ X
)22X Y
;22Y Z
return33 
Created33 
(33 
nameof33 !
(33! "
Get33" %
)33% &
,33& '
PetOwnerMapper33( 6
.336 7
Mapper337 =
.33= >
Map33> A
<33A B
PetOwnerDto33B M
>33M N
(33N O
petOwner33O W
)33W X
)33X Y
;33Y Z
}55 	
[77 	
HttpPost77	 
(77 
$str77 (
)77( )
]77) *
public88 
IActionResult88 
RegisterPetsToOwner88 0
(880 1
Guid881 5
ownerId886 =
,88= >
[88? @
FromBody88@ H
]88H I
List88J N
<88N O
CreatePetDto88O [
>88[ \
petsDtos88] e
)88e f
{99 	
var:: 
owner:: 
=:: 
petOwnerRepository:: *
.::* +
Get::+ .
(::. /
ownerId::/ 6
)::6 7
.::7 8
Result::8 >
;::> ?
if;; 
(;; 
owner;; 
==;; 
null;; 
);; 
{<< 
return== 
NotFound== 
(==  
)==  !
;==! "
}>> 
var@@ 
pets@@ 
=@@ 
petsDtos@@ 
.@@  
Select@@  &
(@@& '
	PetMapper@@' 0
.@@0 1
Mapper@@1 7
.@@7 8
Map@@8 ;
<@@; <
Pet@@< ?
>@@? @
)@@@ A
.@@A B
ToList@@B H
(@@H I
)@@I J
;@@J K
ifAA 
(AA 
petsAA 
.AA 
AnyAA 
(AA 
pAA 
=>AA 
pAA 
==AA !
nullAA" &
)AA& '
)AA' (
{BB 
returnCC 

BadRequestCC !
(CC! "
)CC" #
;CC# $
}DD 
varFF 
resultFF 
=FF 
ownerFF 
.FF 
RegisterPetsToOwnerFF 2
(FF2 3
petsFF3 7
)FF7 8
;FF8 9
ifHH 
(HH 
resultHH 
.HH 
	IsFailureHH  
)HH  !
{II 
returnJJ 

BadRequestJJ !
(JJ! "
resultJJ" (
.JJ( )
ErrorJJ) .
)JJ. /
;JJ/ 0
}KK 
petsMM 
.MM 
ForEachMM 
(MM 
pMM 
=>MM 
petRepositoryMM +
.MM+ ,
AddMM, /
(MM/ 0
pMM0 1
)MM1 2
)MM2 3
;MM3 4
petOwnerRepositoryNN 
.NN 
SaveChangesNN *
(NN* +
)NN+ ,
;NN, -
ResponsePP 
.PP 
HeadersPP 
.PP 
AddPP  
(PP  !
$strPP! ?
,PP? @
$strPPA a
)PPa b
;PPb c
ResponseQQ 
.QQ 
HeadersQQ 
.QQ 
AddQQ  
(QQ  !
$strQQ! ?
,QQ? @
$strQQA b
)QQb c
;QQc d
ResponseRR 
.RR 
HeadersRR 
.RR 
AddRR  
(RR  !
$strRR! >
,RR> ?
$strRR@ X
)RRX Y
;RRY Z
returnSS 
CreatedSS 
(SS 
nameofSS !
(SS! "
GetSS" %
)SS% &
,SS& '
PetOwnerMapperSS( 6
.SS6 7
MapperSS7 =
.SS= >
MapSS> A
<SSA B
PetOwnerDtoSSB M
>SSM N
(SSN O
ownerSSO T
)SST U
)SSU V
;SSV W
}TT 	
}UU 
}VV ñ
XC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.API\Controllers\PetsController.cs
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
$str		 3
)		3 4
]		4 5
[

 
ApiController

 
]

 
[ 

ApiVersion 
( 
$str 
) 
] 
public 

class 
PetsController 
:  !
ControllerBase" 0
{ 
private 
readonly 
IRepository $
<$ %
Pet% (
>( )
petRepository* 7
;7 8
public 
PetsController 
( 
IRepository )
<) *
Pet* -
>- .
petRepository/ <
)< =
=>> @
thisA E
.E F
petRepositoryF S
=T U
petRepositoryV c
;c d
[ 	
HttpGet	 
] 
public 
IActionResult 
Get  
(  !
)! "
{ 	
var 
pets 
= 
petRepository $
.$ %
All% (
(( )
)) *
.* +
Result+ 1
.1 2
Select2 8
(8 9
	PetMapper9 B
.B C
MapperC I
.I J
MapJ M
<M N
PetDtoN T
>T U
)U V
;V W
Response 
. 
Headers 
. 
Add  
(  !
$str! ?
,? @
$strA a
)a b
;b c
Response 
. 
Headers 
. 
Add  
(  !
$str! ?
,? @
$strA b
)b c
;c d
Response 
. 
Headers 
. 
Add  
(  !
$str! >
,> ?
$str@ X
)X Y
;Y Z
return 
Ok 
( 
pets 
) 
; 
} 	
} 
} ﬂ)
cC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.API\Controllers\PrescribedDrugsController.cs
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
 3
)

3 4
]

4 5
[ 
ApiController 
] 
[ 

ApiVersion 
( 
$str 
) 
] 
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
;9 :
public %
PrescribedDrugsController (
(( )
IRepository) 4
<4 5
PrescribedDrug5 C
>C D$
prescribedDrugRepositoryE ]
,] ^
IRepository_ j
<j k
Drugk o
>o p
drugRepositoryq 
)	 Ä
{ 	
this 
. $
prescribedDrugRepository )
=* +$
prescribedDrugRepository, D
;D E
this 
. 
drugRepository 
=  !
drugRepository" 0
;0 1
} 	
[ 	
HttpGet	 
] 
public 
IActionResult 
Get  
(  !
)! "
{ 	
var 
drugs 
= $
prescribedDrugRepository 0
.0 1
All1 4
(4 5
)5 6
.6 7
Result7 =
.= >
Select> D
(D E 
PrescribedDrugMapperE Y
.Y Z
MapperZ `
.` a
Mapa d
<d e
PrescribedDrugDtoe v
>v w
)w x
;x y
Response 
. 
Headers 
. 
Add  
(  !
$str! ?
,? @
$strA a
)a b
;b c
Response 
. 
Headers 
. 
Add  
(  !
$str! ?
,? @
$strA b
)b c
;c d
Response 
. 
Headers 
. 
Add  
(  !
$str! >
,> ?
$str@ X
)X Y
;Y Z
return   
Ok   
(   
drugs   
)   
;   
}!! 	
[## 	
HttpPost##	 
]## 
public$$ 
IActionResult$$ 
Create$$ #
($$# $
[$$$ %
FromBody$$% -
]$$- .#
CreatePrescribedDrugDto$$/ F
drugDto$$G N
)$$N O
{%% 	
var&& 
drug&& 
=&& 
drugRepository&& %
.&&% &
Get&&& )
(&&) *
drugDto&&* 1
.&&1 2
DrugId&&2 8
)&&8 9
.&&9 :
Result&&: @
;&&@ A
if'' 
('' 
drug'' 
=='' 
null'' 
)'' 
{(( 
return)) 
NotFound)) 
())  
)))  !
;))! "
}** 
var,, 
prescribedDrug,, 
=,,   
PrescribedDrugMapper,,! 5
.,,5 6
Mapper,,6 <
.,,< =
Map,,= @
<,,@ A
PrescribedDrug,,A O
>,,O P
(,,P Q
drugDto,,Q X
),,X Y
;,,Y Z
if-- 
(-- 
prescribedDrug-- 
==-- !
null--" &
)--& '
{.. 
return// 

BadRequest// !
(//! "
)//" #
;//# $
}00 $
prescribedDrugRepository22 $
.22$ %
Add22% (
(22( )
prescribedDrug22) 7
)227 8
;228 9$
prescribedDrugRepository33 $
.33$ %
SaveChanges33% 0
(330 1
)331 2
;332 3
Response55 
.55 
Headers55 
.55 
Add55  
(55  !
$str55! ?
,55? @
$str55A a
)55a b
;55b c
Response66 
.66 
Headers66 
.66 
Add66  
(66  !
$str66! ?
,66? @
$str66A b
)66b c
;66c d
Response77 
.77 
Headers77 
.77 
Add77  
(77  !
$str77! >
,77> ?
$str77@ X
)77X Y
;77Y Z
return88 
Created88 
(88 
nameof88 !
(88! "
Get88" %
)88% &
,88& ' 
PrescribedDrugMapper88( <
.88< =
Mapper88= C
.88C D
Map88D G
<88G H
PrescribedDrugDto88H Y
>88Y Z
(88Z [
prescribedDrug88[ i
)88i j
)88j k
;88k l
}99 	
}:: 
};; ¡é
^C:\Users\Leonard\Desktop\VetAppointment\VetAppointment.API\Controllers\TreatmentsController.cs
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
 3
)

3 4
]

4 5
[ 
ApiController 
] 
[ 

ApiVersion 
( 
$str 
) 
] 
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
;/ 0
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
.; <
All< ?
(? @
)@ A
.A B
ResultB H
.H I
SelectI O
(P Q
TreatmentMapperQ `
.` a
Mappera g
.g h
Maph k
<k l
TreatmentDtol x
>x y
)y z
;z {
Response 
. 
Headers 
. 
Add  
(  !
$str! ?
,? @
$strA a
)a b
;b c
Response 
. 
Headers 
. 
Add  
(  !
$str! ?
,? @
$strA b
)b c
;c d
Response 
. 
Headers 
. 
Add  
(  !
$str! >
,> ?
$str@ X
)X Y
;Y Z
return 
Ok 
( 

treatments  
)  !
;! "
} 	
[ 	
HttpPost	 
] 
public 
IActionResult 
Create #
(# $
[$ %
FromBody% -
]- .
CreateTreatmentDto/ A
treatmentDtoB N
)N O
{ 	
var   
treat   
=   
TreatmentMapper   '
.  ' (
Mapper  ( .
.  . /
Map  / 2
<  2 3
	Treatment  3 <
>  < =
(  = >
treatmentDto  > J
)  J K
;  K L
if!! 
(!! 
treat!! 
==!! 
null!! 
)!! 
{"" 
return## 

BadRequest## !
(##! "
)##" #
;### $
}$$ 

unitOfWork&& 
.&& 
TreatmentRepository&& *
.&&* +
Add&&+ .
(&&. /
treat&&/ 4
)&&4 5
;&&5 6

unitOfWork'' 
.'' 
SaveChanges'' "
(''" #
)''# $
;''$ %
Response)) 
.)) 
Headers)) 
.)) 
Add))  
())  !
$str))! ?
,))? @
$str))A a
)))a b
;))b c
Response** 
.** 
Headers** 
.** 
Add**  
(**  !
$str**! ?
,**? @
$str**A b
)**b c
;**c d
Response++ 
.++ 
Headers++ 
.++ 
Add++  
(++  !
$str++! >
,++> ?
$str++@ X
)++X Y
;++Y Z
return,, 
Created,, 
(,, 
nameof,, !
(,,! "
Get,," %
),,% &
,,,& '
TreatmentMapper,,( 7
.,,7 8
Mapper,,8 >
.,,> ?
Map,,? B
<,,B C
TreatmentDto,,C O
>,,O P
(,,P Q
treat,,Q V
),,V W
),,W X
;,,X Y
}-- 	
[// 	
HttpPost//	 
(// 
$str// 6
)//6 7
]//7 8
public00 
IActionResult00 
AddDrugsToTreatment00 0
(000 1
Guid001 5
treatmentId006 A
,00A B
[00C D
FromBody00D L
]00L M
List00N R
<00R S
PrescribedDrugDto00S d
>00d e
prescribedDrugDtos00f x
)00x y
{11 	
var22 
	treatment22 
=22 

unitOfWork22 &
.22& '
TreatmentRepository22' :
.22: ;
Get22; >
(22> ?
treatmentId22? J
)22J K
.22K L
Result22L R
;22R S
if33 
(33 
	treatment33 
==33 
null33 !
)33! "
{44 
return55 
NotFound55 
(55  
)55  !
;55! "
}66 
var88 
drugs88 
=88 
prescribedDrugDtos88 *
.88* +
Select88+ 1
(881 2 
PrescribedDrugMapper882 F
.88F G
Mapper88G M
.88M N
Map88N Q
<88Q R
PrescribedDrug88R `
>88` a
)88a b
.88b c
ToList88c i
(88i j
)88j k
;88k l
if99 
(99 
drugs99 
.99 
Any99 
(99 
p99 
=>99 
p99  
==99! #
null99$ (
)99( )
)99) *
{:: 
return;; 

BadRequest;; !
(;;! "
);;" #
;;;# $
}<< 
var>> 
result>> 
=>> 
	treatment>> "
.>>" #"
AppendDrugsToTreatment>># 9
(>>9 :
drugs>>: ?
)>>? @
;>>@ A
if?? 
(?? 
result?? 
.?? 
	IsFailure??  
)??  !
{@@ 
returnAA 

BadRequestAA !
(AA! "
resultAA" (
.AA( )
ErrorAA) .
)AA. /
;AA/ 0
}BB 
drugsDD 
.DD 
ForEachDD 
(DD 
pDD 
=>DD 

unitOfWorkDD )
.DD) *$
PrescribedDrugRepositoryDD* B
.DDB C
AddDDC F
(DDF G
pDDG H
)DDH I
)DDI J
;DDJ K

unitOfWorkEE 
.EE 
SaveChangesEE "
(EE" #
)EE# $
;EE$ %
ResponseGG 
.GG 
HeadersGG 
.GG 
AddGG  
(GG  !
$strGG! ?
,GG? @
$strGGA a
)GGa b
;GGb c
ResponseHH 
.HH 
HeadersHH 
.HH 
AddHH  
(HH  !
$strHH! ?
,HH? @
$strHHA b
)HHb c
;HHc d
ResponseII 
.II 
HeadersII 
.II 
AddII  
(II  !
$strII! >
,II> ?
$strII@ X
)IIX Y
;IIY Z
returnJJ 
	NoContentJJ 
(JJ 
)JJ 
;JJ 
}KK 	
[MM 	
HttpPutMM	 
(MM 
$strMM %
)MM% &
]MM& '
publicNN 
IActionResultNN 
UpdateTreatmentNN ,
(NN, -
GuidNN- 1
treatmentIdNN2 =
,NN= >
[NN? @
FromBodyNN@ H
]NNH I
CreateTreatmentDtoNNJ \
treatmentDtoNN] i
)NNi j
{OO 	
varPP 
	treatmentPP 
=PP 

unitOfWorkPP &
.PP& '
TreatmentRepositoryPP' :
.PP: ;
GetPP; >
(PP> ?
treatmentIdPP? J
)PPJ K
.PPK L
ResultPPL R
;PPR S
ifQQ 
(QQ 
	treatmentQQ 
==QQ 
nullQQ !
)QQ! "
{RR 
returnSS 
NotFoundSS 
(SS  
)SS  !
;SS! "
}TT 
varVV 
resultVV 
=VV 
	treatmentVV "
.VV" #
UpdateDescriptionVV# 4
(VV4 5
treatmentDtoVV5 A
.VVA B
DescriptionVVB M
)VVM N
;VVN O
ifWW 
(WW 
resultWW 
.WW 
	IsFailureWW  
)WW  !
{XX 
returnYY 

BadRequestYY !
(YY! "
resultYY" (
.YY( )
ErrorYY) .
)YY. /
;YY/ 0
}ZZ 

unitOfWork\\ 
.\\ 
TreatmentRepository\\ *
.\\* +
Update\\+ 1
(\\1 2
	treatment\\2 ;
)\\; <
;\\< =

unitOfWork]] 
.]] 
SaveChanges]] "
(]]" #
)]]# $
;]]$ %
Response__ 
.__ 
Headers__ 
.__ 
Add__  
(__  !
$str__! ?
,__? @
$str__A a
)__a b
;__b c
Response`` 
.`` 
Headers`` 
.`` 
Add``  
(``  !
$str``! ?
,``? @
$str``A b
)``b c
;``c d
Responseaa 
.aa 
Headersaa 
.aa 
Addaa  
(aa  !
$straa! >
,aa> ?
$straa@ X
)aaX Y
;aaY Z
returnbb 
	NoContentbb 
(bb 
)bb 
;bb 
}cc 	
[ee 	
HttpPutee	 
(ee 
$stree L
)eeL M
]eeM N
publicff 
IActionResultff !
UpdateDrugInTreatmentff 2
(ff2 3
Guidff3 7
treatmentIdff8 C
,ffC D
GuidffE I
prescribedDrugIdffJ Z
,ffZ [
[gg 
FromBodygg 
]gg 
PrescribedDrugDtogg (
prescribedDrugDtogg) :
)gg: ;
{hh 	
varii 
	treatmentii 
=ii 

unitOfWorkii &
.ii& '
TreatmentRepositoryii' :
.ii: ;
Getii; >
(ii> ?
treatmentIdii? J
)iiJ K
.iiK L
ResultiiL R
;iiR S
ifjj 
(jj 
	treatmentjj 
==jj 
nulljj !
)jj! "
{kk 
returnll 
NotFoundll 
(ll  
)ll  !
;ll! "
}mm 
varoo 
drugPrescribedoo 
=oo  

unitOfWorkoo! +
.oo+ ,$
PrescribedDrugRepositoryoo, D
.ooD E
GetooE H
(ooH I
prescribedDrugIdooI Y
)ooY Z
.ooZ [
Resultoo[ a
;ooa b
ifpp 
(pp 
drugPrescribedpp 
==pp !
nullpp" &
)pp& '
{qq 
returnrr 
NotFoundrr 
(rr  
)rr  !
;rr! "
}ss 
varuu 
druguu 
=uu 

unitOfWorkuu !
.uu! "
DrugRepositoryuu" 0
.uu0 1
Getuu1 4
(uu4 5
prescribedDrugDtouu5 F
.uuF G
DrugIduuG M
)uuM N
.uuN O
ResultuuO U
;uuU V
ifvv 
(vv 
drugvv 
==vv 
nullvv 
)vv 
{ww 
returnxx 
NotFoundxx 
(xx  
)xx  !
;xx! "
}yy 
var{{ 
result{{ 
={{ 
drugPrescribed{{ '
.{{' (
Update{{( .
({{. /
prescribedDrugDto{{/ @
.{{@ A
Quantity{{A I
,{{I J
drug{{K O
){{O P
;{{P Q
if}} 
(}} 
result}} 
.}} 
	IsFailure}}  
)}}  !
{~~ 
return 

BadRequest !
(! "
result" (
.( )
Error) .
). /
;/ 0
}
ÄÄ 

unitOfWork
ÇÇ 
.
ÇÇ &
PrescribedDrugRepository
ÇÇ /
.
ÇÇ/ 0
Update
ÇÇ0 6
(
ÇÇ6 7
drugPrescribed
ÇÇ7 E
)
ÇÇE F
;
ÇÇF G

unitOfWork
ÉÉ 
.
ÉÉ 
SaveChanges
ÉÉ "
(
ÉÉ" #
)
ÉÉ# $
;
ÉÉ$ %
Response
ÖÖ 
.
ÖÖ 
Headers
ÖÖ 
.
ÖÖ 
Add
ÖÖ  
(
ÖÖ  !
$str
ÖÖ! ?
,
ÖÖ? @
$str
ÖÖA a
)
ÖÖa b
;
ÖÖb c
Response
ÜÜ 
.
ÜÜ 
Headers
ÜÜ 
.
ÜÜ 
Add
ÜÜ  
(
ÜÜ  !
$str
ÜÜ! ?
,
ÜÜ? @
$str
ÜÜA b
)
ÜÜb c
;
ÜÜc d
Response
áá 
.
áá 
Headers
áá 
.
áá 
Add
áá  
(
áá  !
$str
áá! >
,
áá> ?
$str
áá@ X
)
ááX Y
;
ááY Z
return
àà 
	NoContent
àà 
(
àà 
)
àà 
;
àà 
}
ââ 	
[
ãã 	

HttpDelete
ãã	 
(
ãã 
$str
ãã O
)
ããO P
]
ããP Q
public
åå 
IActionResult
åå %
RemoveDrugFromTreatment
åå 4
(
åå4 5
Guid
åå5 9
treatmentId
åå: E
,
ååE F
Guid
ååG K
prescribedDrugId
ååL \
)
åå\ ]
{
çç 	
var
éé 
	treatment
éé 
=
éé 

unitOfWork
éé &
.
éé& '!
TreatmentRepository
éé' :
.
éé: ;
Get
éé; >
(
éé> ?
treatmentId
éé? J
)
ééJ K
.
ééK L
Result
ééL R
;
ééR S
if
èè 
(
èè 
	treatment
èè 
==
èè 
null
èè !
)
èè! "
{
êê 
return
ëë 
NotFound
ëë 
(
ëë  
)
ëë  !
;
ëë! "
}
íí 
var
îî 
drug
îî 
=
îî 

unitOfWork
îî !
.
îî! "&
PrescribedDrugRepository
îî" :
.
îî: ;
Get
îî; >
(
îî> ?
prescribedDrugId
îî? O
)
îîO P
.
îîP Q
Result
îîQ W
;
îîW X
if
ïï 
(
ïï 
drug
ïï 
==
ïï 
null
ïï 
)
ïï 
{
ññ 
return
óó 
NotFound
óó 
(
óó  
)
óó  !
;
óó! "
}
òò 
var
öö 
result
öö 
=
öö 
	treatment
öö "
.
öö" #%
RemoveDrugFromTreatment
öö# :
(
öö: ;
drug
öö; ?
)
öö? @
;
öö@ A
if
õõ 
(
õõ 
result
õõ 
.
õõ 
	IsFailure
õõ  
)
õõ  !
{
úú 
return
ùù 

BadRequest
ùù !
(
ùù! "
result
ùù" (
.
ùù( )
Error
ùù) .
)
ùù. /
;
ùù/ 0
}
ûû 

unitOfWork
†† 
.
†† &
PrescribedDrugRepository
†† /
.
††/ 0
Delete
††0 6
(
††6 7
drug
††7 ;
)
††; <
;
††< =

unitOfWork
°° 
.
°° 
SaveChanges
°° "
(
°°" #
)
°°# $
;
°°$ %
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
££A a
)
££a b
;
££b c
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
§§! ?
,
§§? @
$str
§§A b
)
§§b c
;
§§c d
Response
•• 
.
•• 
Headers
•• 
.
•• 
Add
••  
(
••  !
$str
••! >
,
••> ?
$str
••@ X
)
••X Y
;
••Y Z
return
¶¶ 
	NoContent
¶¶ 
(
¶¶ 
)
¶¶ 
;
¶¶ 
}
ßß 	
[
©© 	

HttpDelete
©©	 
(
©© 
$str
©© (
)
©©( )
]
©©) *
public
™™ 
IActionResult
™™ 
Delete
™™ #
(
™™# $
Guid
™™$ (
treatmentId
™™) 4
)
™™4 5
{
´´ 	
var
¨¨ 
	treatment
¨¨ 
=
¨¨ 

unitOfWork
¨¨ &
.
¨¨& '!
TreatmentRepository
¨¨' :
.
¨¨: ;
Get
¨¨; >
(
¨¨> ?
treatmentId
¨¨? J
)
¨¨J K
.
¨¨K L
Result
¨¨L R
;
¨¨R S
if
≠≠ 
(
≠≠ 
	treatment
≠≠ 
==
≠≠ 
null
≠≠ !
)
≠≠! "
{
ÆÆ 
return
ØØ 
NotFound
ØØ 
(
ØØ  
)
ØØ  !
;
ØØ! "
}
∞∞ 

unitOfWork
≤≤ 
.
≤≤ !
TreatmentRepository
≤≤ *
.
≤≤* +
Delete
≤≤+ 1
(
≤≤1 2
	treatment
≤≤2 ;
)
≤≤; <
;
≤≤< =

unitOfWork
≥≥ 
.
≥≥ 
SaveChanges
≥≥ "
(
≥≥" #
)
≥≥# $
;
≥≥$ %
Response
µµ 
.
µµ 
Headers
µµ 
.
µµ 
Add
µµ  
(
µµ  !
$str
µµ! ?
,
µµ? @
$str
µµA a
)
µµa b
;
µµb c
Response
∂∂ 
.
∂∂ 
Headers
∂∂ 
.
∂∂ 
Add
∂∂  
(
∂∂  !
$str
∂∂! ?
,
∂∂? @
$str
∂∂A b
)
∂∂b c
;
∂∂c d
Response
∑∑ 
.
∑∑ 
Headers
∑∑ 
.
∑∑ 
Add
∑∑  
(
∑∑  !
$str
∑∑! >
,
∑∑> ?
$str
∑∑@ X
)
∑∑X Y
;
∑∑Y Z
return
∏∏ 
	NoContent
∏∏ 
(
∏∏ 
)
∏∏ 
;
∏∏ 
}
ππ 	
}
ªª 
}ºº ®.
\C:\Users\Leonard\Desktop\VetAppointment\VetAppointment.API\Controllers\v2\DrugsController.cs
	namespace 	
VetAppointment
 
. 
API 
. 
Controllers (
.( )
v2) +
{ 
[		 
Route		 

(		
 
$str		 3
)		3 4
]		4 5
[

 
ApiController

 
]

 
[ 

ApiVersion 
( 
$str 
) 
] 
public 

class 
DrugsController  
:! "
ControllerBase# 1
{ 
private 
readonly 
	IMediator "
mediator# +
;+ ,
private 
void 
AccessControl "
(" #
)# $
{ 	
Response 
. 
Headers 
. 
Add  
(  !
$str! ?
,? @
$strA a
)a b
;b c
Response 
. 
Headers 
. 
Add  
(  !
$str! ?
,? @
$strA b
)b c
;c d
Response 
. 
Headers 
. 
Add  
(  !
$str! >
,> ?
$str@ X
)X Y
;Y Z
} 	
public 
DrugsController 
( 
	IMediator (
mediator) 1
)1 2
=>3 5
this6 :
.: ;
mediator; C
=D E
mediatorF N
;N O
[ 	
HttpPost	 
] 
public 
async 
Task 
< 
ActionResult &
<& '
DrugResponse' 3
>3 4
>4 5
Create6 <
(< =
[= >
FromBody> F
]F G
CreateDrugCommandH Y
commandZ a
)a b
{ 	
AccessControl 
( 
) 
; 
return 
Created 
( 
nameof !
(! "
Get" %
)% &
,& '
await( -
mediator. 6
.6 7
Send7 ;
(; <
command< C
)C D
)D E
;E F
} 	
[   	
HttpGet  	 
]   
public!! 
async!! 
Task!! 
<!! 
ActionResult!! &
<!!& '
List!!' +
<!!+ ,
DrugResponse!!, 8
>!!8 9
>!!9 :
>!!: ;
GetAll!!< B
(!!B C
)!!C D
{"" 	
AccessControl## 
(## 
)## 
;## 
return$$ 
Ok$$ 
($$ 
await$$ 
mediator$$ $
.$$$ %
Send$$% )
($$) *
new$$* -
GetAllDrugsQuery$$. >
($$> ?
)$$? @
)$$@ A
)$$A B
;$$B C
}%% 	
['' 	
HttpGet''	 
('' 
$str''  
)''  !
]''! "
public(( 
async(( 
Task(( 
<(( 
ActionResult(( &
<((& '
DrugResponse((' 3
>((3 4
>((4 5
Get((6 9
(((9 :
Guid((: >
drugId((? E
)((E F
{)) 	
var** 
result** 
=** 
await** 
mediator** '
.**' (
Send**( ,
(**, -
new**- 0
GetDrugQuery**1 =
(**= >
drugId**> D
)**D E
)**E F
;**F G
if++ 
(++ 
result++ 
==++ 
null++ 
)++ 
{,, 
return-- 
NotFound-- 
(--  
)--  !
;--! "
}.. 
AccessControl00 
(00 
)00 
;00 
return11 
Ok11 
(11 
result11 
)11 
;11 
}22 	
[44 	
HttpPut44	 
]44 
public55 
async55 
Task55 
<55 
ActionResult55 &
<55& '
DrugResponse55' 3
>553 4
>554 5
Put556 9
(559 :
[55: ;
FromBody55; C
]55C D
UpdateDrugCommand55E V
command55W ^
)55^ _
{66 	
var77 
result77 
=77 
await77 
mediator77 '
.77' (
Send77( ,
(77, -
command77- 4
)774 5
;775 6
if88 
(88 
result88 
==88 
null88 
)88 
{99 
return:: 
NotFound:: 
(::  
)::  !
;::! "
};; 
AccessControl== 
(== 
)== 
;== 
return>> 
Ok>> 
(>> 
result>> 
)>> 
;>> 
}?? 	
[AA 	

HttpDeleteAA	 
]AA 
publicBB 
asyncBB 
TaskBB 
<BB 
ActionResultBB &
>BB& '
DeleteBB( .
(BB. /
DeleteDrugCommandBB/ @
commandBBA H
)BBH I
{CC 	
varDD 
resultDD 
=DD 
awaitDD 
mediatorDD '
.DD' (
SendDD( ,
(DD, -
commandDD- 4
)DD4 5
;DD5 6
AccessControlEE 
(EE 
)EE 
;EE 
returnFF 
resultFF 
?FF 
	NoContentFF %
(FF% &
)FF& '
:FF( )
NotFoundFF* 2
(FF2 3
)FF3 4
;FF4 5
}GG 	
}HH 
}II ≤%
`C:\Users\Leonard\Desktop\VetAppointment\VetAppointment.API\Controllers\v2\PetOwnersController.cs
	namespace 	
VetAppointment
 
. 
API 
. 
Controllers (
.( )
v2) +
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
 3
)

3 4
]

4 5
[ 
ApiController 
] 
[ 

ApiVersion 
( 
$str 
) 
] 
public 

class 
PetOwnersController $
:% &
ControllerBase' 5
{ 
private 
readonly 
	IMediator "
mediator# +
;+ ,
public 
PetOwnersController "
(" #
	IMediator# ,

medediator- 7
)7 8
{ 	
this 
. 
mediator 
= 

medediator %
;% &
} 	
[ 	
HttpGet	 
] 
public 
async 
Task 
< 
List 
< 
PetOwnerResponse /
>/ 0
>0 1
Get2 5
(5 6
)6 7
{ 	
return 
await 
mediator !
.! "
Send" &
(& '
new' * 
GetAllPetOwnersQuery+ ?
(? @
)@ A
)A B
;B C
} 	
[ 	
HttpPost	 
] 
public 
async 
Task 
< 
ActionResult &
<& '
PetOwnerResponse' 7
>7 8
>8 9
Create: @
(@ A
[A B
FromBodyB J
]J K!
CreatePetOwnerCommandL a
commandb i
)i j
{ 	
var 
result 
= 
await 
mediator '
.' (
Send( ,
(, -
command- 4
)4 5
;5 6
return   
Ok   
(   
result   
)   
;   
}!! 	
[## 	
HttpPost##	 
(## 
$str## '
)##' (
]##( )
public$$ 
async$$ 
Task$$ 
<$$ 
ActionResult$$ &
<$$& '
PetOwnerResponse$$' 7
>$$7 8
>$$8 9
RegisterPetsToOwner$$: M
($$M N
Guid$$N R
ownerId$$S Z
,$$Z [
[$$\ ]
FromBody$$] e
]$$e f
List$$g k
<$$k l
CreatePetCommand$$l |
>$$| }
commands	$$~ Ü
)
$$Ü á
{%% 	
var'' 
owner'' 
='' 
mediator''  
.''  !
Send''! %
(''% &
new''& )
GetPetOwnerCommand''* <
(''< =
ownerId''= D
)''D E
)''E F
;''F G
if(( 
((( 
owner(( 
==(( 
null(( 
)(( 
{)) 
return** 
NotFound** 
(**  
)**  !
;**! "
}++ 
var-- 
nulls-- 
=-- 
new-- 
List--  
<--  !
CreatePetCommand--! 1
>--1 2
(--2 3
)--3 4
;--4 5
foreach.. 
(.. 
var.. 
command..  
in..! #
commands..$ ,
).., -
{// 
var00 
result00 
=00 
await00 "
mediator00# +
.00+ ,
Send00, 0
(000 1
command001 8
)008 9
;009 :
if11 
(11 
result11 
==11 
null11 "
)11" #
{22 
nulls33 
.33 
Add33 
(33 
command33 %
)33% &
;33& '
}44 
}55 
if77 
(77 
nulls77 
.77 
Count77 
>77 
$num77 
)77  
{88 
return99 

BadRequest99 !
(99! "
nulls99" '
)99' (
;99( )
}:: 
var<< 
postPets<< 
=<< 
await<<  
mediator<<! )
.<<) *
Send<<* .
(<<. /
new<</ 2$
RegisterPetsToOwnerQuery<<3 K
(<<K L
ownerId<<L S
,<<S T
commands<<U ]
)<<] ^
)<<^ _
;<<_ `
return== 
Ok== 
(== 
postPets== 
)== 
;==  
}>> 	
}?? 
}@@ °8
fC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.API\Controllers\v2\PrescribedDrugsController.cs
	namespace 	
VetAppointment
 
. 
API 
. 
Controllers (
.( )
v2) +
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
 3
)

3 4
]

4 5
[ 
ApiController 
] 
[ 

ApiVersion 
( 
$str 
) 
] 
public 

class %
PrescribedDrugsController *
:+ ,
ControllerBase- ;
{ 
private 
readonly 
	IMediator "
mediator# +
;+ ,
private 
void 
AccessControl "
(" #
)# $
{ 	
Response 
. 
Headers 
. 
Add  
(  !
$str! ?
,? @
$strA a
)a b
;b c
Response 
. 
Headers 
. 
Add  
(  !
$str! ?
,? @
$strA b
)b c
;c d
Response 
. 
Headers 
. 
Add  
(  !
$str! >
,> ?
$str@ X
)X Y
;Y Z
} 	
public %
PrescribedDrugsController (
(( )
	IMediator) 2
mediator3 ;
); <
=>= ?
this@ D
.D E
mediatorE M
=N O
mediatorP X
;X Y
[ 	
HttpPost	 
] 
public 
async 
Task 
< 
ActionResult &
<& '"
PrescribedDrugResponse' =
>= >
>> ?
Create@ F
(F G
[G H
FromBodyH P
]P Q'
CreatePrescribedDrugCommandR m
commandn u
)u v
{ 	
var 
drug 
= 
mediator 
.  
Send  $
($ %
new% (
GetDrugQuery) 5
(5 6
command6 =
.= >
DrugToPrescribeId> O
)O P
)P Q
;Q R
if 
( 
drug 
== 
null 
) 
{ 
return   
NotFound   
(    
)    !
;  ! "
}!! 
AccessControl## 
(## 
)## 
;## 
return$$ 
Created$$ 
($$ 
nameof$$ !
($$! "
GetById$$" )
)$$) *
,$$* +
await$$, 1
mediator$$2 :
.$$: ;
Send$$; ?
($$? @
command$$@ G
)$$G H
)$$H I
;$$I J
}%% 	
['' 	
HttpGet''	 
]'' 
public(( 
async(( 
Task(( 
<(( 
ActionResult(( &
<((& '
List((' +
<((+ ,"
PrescribedDrugResponse((, B
>((B C
>((C D
>((D E
GetAll((F L
(((L M
)((M N
{)) 	
AccessControl** 
(** 
)** 
;** 
return++ 
Ok++ 
(++ 
await++ 
mediator++ $
.++$ %
Send++% )
(++) *
new++* -&
GetAllPrescribedDrugsQuery++. H
(++H I
)++I J
)++J K
)++K L
;++L M
},, 	
[.. 	
HttpGet..	 
(.. 
$str.. *
)..* +
]..+ ,
public// 
async// 
Task// 
<// 
ActionResult// &
<//& '"
PrescribedDrugResponse//' =
>//= >
>//> ?
GetById//@ G
(//G H
Guid//H L
prescribedDrugId//M ]
)//] ^
{00 	
var11 
result11 
=11 
await11 
mediator11 '
.11' (
Send11( ,
(11, -
new11- 0"
GetPrescribedDrugQuery111 G
(11G H
prescribedDrugId11H X
)11X Y
)11Y Z
;11Z [
if22 
(22 
result22 
==22 
null22 
)22 
{33 
return44 
NotFound44 
(44  
)44  !
;44! "
}55 
AccessControl77 
(77 
)77 
;77 
return88 
Ok88 
(88 
result88 
)88 
;88 
}99 	
[;; 	
HttpPut;;	 
];; 
public<< 
async<< 
Task<< 
<<< 
ActionResult<< &
<<<& '"
PrescribedDrugResponse<<' =
><<= >
><<> ?
Update<<@ F
(<<F G
[<<G H
FromBody<<H P
]<<P Q'
UpdatePrescribedDrugCommand<<R m
command<<n u
)<<u v
{== 	
var>> 
drug>> 
=>> 
await>> 
mediator>> %
.>>% &
Send>>& *
(>>* +
new>>+ .
GetDrugQuery>>/ ;
(>>; <
command>>< C
.>>C D
DrugToPrescribeId>>D U
)>>U V
)>>V W
;>>W X
if?? 
(?? 
drug?? 
==?? 
null?? 
)?? 
{@@ 
returnAA 
NotFoundAA 
(AA  
)AA  !
;AA! "
}BB 
varDD 
resultDD 
=DD 
awaitDD 
mediatorDD '
.DD' (
SendDD( ,
(DD, -
commandDD- 4
)DD4 5
;DD5 6
ifEE 
(EE 
resultEE 
==EE 
nullEE 
)EE 
{FF 
returnGG 
NotFoundGG 
(GG  
)GG  !
;GG! "
}HH 
AccessControlJJ 
(JJ 
)JJ 
;JJ 
returnKK 
OkKK 
(KK 
resultKK 
)KK 
;KK 
}LL 	
[NN 	

HttpDeleteNN	 
]NN 
publicOO 
asyncOO 
TaskOO 
<OO 
ActionResultOO &
<OO& '
boolOO' +
>OO+ ,
>OO, -
DeleteOO. 4
(OO4 5
[OO5 6
FromBodyOO6 >
]OO> ?'
DeletePrescribedDrugCommandOO@ [
commandOO\ c
)OOc d
{PP 	
varQQ 
resultQQ 
=QQ 
awaitQQ 
mediatorQQ '
.QQ' (
SendQQ( ,
(QQ, -
commandQQ- 4
)QQ4 5
;QQ5 6
AccessControlRR 
(RR 
)RR 
;RR 
returnSS 
resultSS 
?SS 
OkSS 
(SS 
)SS  
:SS! "
NotFoundSS# +
(SS+ ,
)SS, -
;SS- .
}TT 	
}UU 
}VV Áz
aC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.API\Controllers\v2\VetClinicsController.cs
	namespace

 	
VetAppointment


 
.

 
API

 
.

 
Controllers

 (
.

( )
v2

) +
{ 
[ 
ApiController 
] 
[ 
Route 

(
 
$str 3
)3 4
]4 5
[ 

ApiVersion 
( 
$str 
) 
] 
public 

class  
VetClinicsController %
:& '
ControllerBase( 6
{ 
private 
readonly 
	IMediator "
mediator# +
;+ ,
private 
void 
AccessControl "
(" #
)# $
{ 	
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
;Y Z
} 	
public  
VetClinicsController #
(# $
	IMediator$ -
mediator. 6
)6 7
=>8 :
this; ?
.? @
mediator@ H
=I J
mediatorK S
;S T
[ 	
HttpPost	 
] 
public 
async 
Task 
< 
ActionResult &
<& '
VetClinicResponse' 8
>8 9
>9 :
Post; ?
(? @
[@ A
FromBodyA I
]I J"
CreateVetClinicCommandK a
commandb i
)i j
{ 	
var   
result   
=   
await   
mediator   '
.  ' (
Send  ( ,
(  , -
command  - 4
)  4 5
;  5 6
if!! 
(!! 
result!! 
==!! 
null!! 
)!! 
{"" 
return## 

BadRequest## !
(##! "
)##" #
;### $
}$$ 
AccessControl&& 
(&& 
)&& 
;&& 
return'' 
Created'' 
('' 
nameof'' !
(''! "
Get''" %
)''% &
,''& '
result''( .
)''. /
;''/ 0
}(( 	
[** 	
HttpPost**	 
(** 
$str** *
)*** +
]**+ ,
public++ 
async++ 
Task++ 
<++ 
ActionResult++ &
<++& '
VetResponse++' 2
>++2 3
>++3 4
PostVet++5 <
(++< =
Guid++= A
vetClinicId++B M
,++M N
[++O P
FromBody++P X
]++X Y
CreateVetCommand++Z j
command++k r
)++r s
{,, 	
var-- 
vet-- 
=-- 
await-- 
mediator-- $
.--$ %
Send--% )
(--) *
command--* 1
)--1 2
;--2 3
if.. 
(.. 
vet.. 
==.. 
null.. 
).. 
{// 
return00 

BadRequest00 !
(00! "
)00" #
;00# $
}11 
var33 
response33 
=33 
await33  
mediator33! )
.33) *
Send33* .
(33. /
new33/ 2#
PostVetInVetClinicQuery333 J
(33J K
vetClinicId33K V
,33V W
vet33X [
.33[ \
Id33\ ^
)33^ _
)33_ `
;33` a
if44 
(44 
response44 
==44 
null44  
)44  !
{55 
return66 
NotFound66 
(66  
)66  !
;66! "
}77 
AccessControl99 
(99 
)99 
;99 
return:: 
Created:: 
(:: 
nameof:: !
(::! "
GetVet::" (
)::( )
,::) *
response::+ 3
)::3 4
;::4 5
};; 	
[== 	
HttpGet==	 
]== 
public>> 
async>> 
Task>> 
<>> 
ActionResult>> &
<>>& '
List>>' +
<>>+ ,
VetClinicResponse>>, =
>>>= >
>>>> ?
>>>? @
GetAll>>A G
(>>G H
)>>H I
{?? 	
var@@ 
result@@ 
=@@ 
await@@ 
mediator@@ '
.@@' (
Send@@( ,
(@@, -
new@@- 0!
GetAllVetClinicsQuery@@1 F
(@@F G
)@@G H
)@@H I
;@@I J
AccessControlBB 
(BB 
)BB 
;BB 
returnCC 
OkCC 
(CC 
resultCC 
)CC 
;CC 
}EE 	
[GG 	
HttpGetGG	 
(GG 
$strGG %
)GG% &
]GG& '
publicHH 
asyncHH 
TaskHH 
<HH 
ActionResultHH &
<HH& '
VetClinicResponseHH' 8
>HH8 9
>HH9 :
GetHH; >
(HH> ?
GuidHH? C
vetClinicIdHHD O
)HHO P
{II 	
varJJ 
resultJJ 
=JJ 
awaitJJ 
mediatorJJ '
.JJ' (
SendJJ( ,
(JJ, -
newJJ- 0
GetVetClinicQueryJJ1 B
(JJB C
vetClinicIdJJC N
)JJN O
)JJO P
;JJP Q
ifKK 
(KK 
resultKK 
==KK 
nullKK 
)KK 
{LL 
returnMM 
NotFoundMM 
(MM  
)MM  !
;MM! "
}NN 
AccessControlPP 
(PP 
)PP 
;PP 
returnQQ 
OkQQ 
(QQ 
resultQQ 
)QQ 
;QQ 
}RR 	
[TT 	
HttpGetTT	 
(TT 
$strTT *
)TT* +
]TT+ ,
publicUU 
asyncUU 
TaskUU 
<UU 
ActionResultUU &
<UU& '
ListUU' +
<UU+ ,
VetResponseUU, 7
>UU7 8
>UU8 9
>UU9 :

GetAllVetsUU; E
(UUE F
GuidUUF J
vetClinicIdUUK V
)UUV W
{VV 	
varWW 
resultWW 
=WW 
awaitWW 
mediatorWW '
.WW' (
SendWW( ,
(WW, -
newWW- 0(
GetAllVetsFromVetClinicQueryWW1 M
(WWM N
vetClinicIdWWN Y
)WWY Z
)WWZ [
;WW[ \
ifXX 
(XX 
resultXX 
==XX 
nullXX 
)XX 
{YY 
returnZZ 
NotFoundZZ 
(ZZ  
)ZZ  !
;ZZ! "
}[[ 
AccessControl]] 
(]] 
)]] 
;]] 
return^^ 
Ok^^ 
(^^ 
result^^ 
)^^ 
;^^ 
}__ 	
[aa 	
HttpGetaa	 
(aa 
$straa 2
)aa2 3
]aa3 4
publicbb 
asyncbb 
Taskbb 
<bb 
ActionResultbb &
<bb& '
VetResponsebb' 2
>bb2 3
>bb3 4
GetVetbb5 ;
(bb; <
Guidbb< @
vetClinicIdbbA L
,bbL M
GuidbbN R
vetIdbbS X
)bbX Y
{cc 	
vardd 
resultdd 
=dd 
awaitdd 
mediatordd '
.dd' (
Senddd( ,
(dd, -
newdd- 0$
GetVetFromVetClinicQuerydd1 I
(ddI J
vetClinicIdddJ U
,ddU V
vetIdddW \
)dd\ ]
)dd] ^
;dd^ _
ifee 
(ee 
resultee 
==ee 
nullee 
)ee 
{ff 
returngg 
NotFoundgg 
(gg  
)gg  !
;gg! "
}hh 
AccessControljj 
(jj 
)jj 
;jj 
returnkk 
Okkk 
(kk 
resultkk 
)kk 
;kk 
}ll 	
[nn 	
HttpGetnn	 
(nn 
$strnn <
)nn< =
]nn= >
publicoo 
asyncoo 
Taskoo 
<oo 
ActionResultoo &
<oo& '
Listoo' +
<oo+ ,
PetResponseoo, 7
>oo7 8
>oo8 9
>oo9 :
GetPetsoo; B
(ooB C
GuidooC G
vetClinicIdooH S
,ooS T
GuidooU Y

petOwnerIdooZ d
)ood e
{pp 	
varqq 
resultqq 
=qq 
awaitqq 
mediatorqq '
.qq' (
Sendqq( ,
(qq, -
newqq- 0-
!GetAllPetsFromClinicAndOwnerQueryqq1 R
(qqR S
vetClinicIdqqS ^
,qq^ _

petOwnerIdqq` j
)qqj k
)qqk l
;qql m
ifrr 
(rr 
resultrr 
==rr 
nullrr 
)rr 
{ss 
returntt 
NotFoundtt 
(tt  
)tt  !
;tt! "
}uu 
AccessControlww 
(ww 
)ww 
;ww 
returnxx 
Okxx 
(xx 
resultxx 
)xx 
;xx 
}yy 	
[{{ 	
HttpPut{{	 
({{ 
$str{{ %
){{% &
]{{& '
public|| 
async|| 
Task|| 
<|| 
ActionResult|| &
<||& '
VetClinicResponse||' 8
>||8 9
>||9 :
Put||; >
(||> ?
Guid||? C
vetClinicId||D O
,||O P
[||Q R
FromBody||R Z
]||Z ["
CreateVetClinicCommand||\ r
command||s z
)||z {
{}} 	
var~~ 
result~~ 
=~~ 
await~~ 
mediator~~ '
.~~' (
Send~~( ,
(~~, -
new~~- 0 
UpdateVetClinicQuery~~1 E
(~~E F
vetClinicId~~F Q
,~~Q R
command~~S Z
)~~Z [
)~~[ \
;~~\ ]
AccessControl
ÄÄ 
(
ÄÄ 
)
ÄÄ 
;
ÄÄ 
if
ÇÇ 
(
ÇÇ 
result
ÇÇ 
==
ÇÇ !
ResponseStatusCodes
ÇÇ -
.
ÇÇ- .
NotFound
ÇÇ. 6
)
ÇÇ6 7
{
ÉÉ 
return
ÑÑ 
NotFound
ÑÑ 
(
ÑÑ  
)
ÑÑ  !
;
ÑÑ! "
}
ÖÖ 
else
ÜÜ 
if
ÜÜ 
(
ÜÜ 
result
ÜÜ 
==
ÜÜ !
ResponseStatusCodes
ÜÜ 2
.
ÜÜ2 3

BadRequest
ÜÜ3 =
)
ÜÜ= >
{
áá 
return
àà 

BadRequest
àà !
(
àà! "
)
àà" #
;
àà# $
}
ââ 
else
ää 
{
ãã 
return
åå 
Ok
åå 
(
åå 
)
åå 
;
åå 
}
çç 
}
éé 	
[
êê 	
HttpPut
êê	 
(
êê 
$str
êê 6
)
êê6 7
]
êê7 8
public
ëë 
async
ëë 
Task
ëë 
<
ëë 
ActionResult
ëë &
<
ëë& '
VetResponse
ëë' 2
>
ëë2 3
>
ëë3 4
PutVet
ëë5 ;
(
ëë; <
Guid
ëë< @
vetClinicId
ëëA L
,
ëëL M
Guid
ëëN R
vetId
ëëS X
,
ëëX Y
[
íí 
FromBody
íí 
]
íí 
CreateVetCommand
íí '
command
íí( /
)
íí/ 0
{
ìì 	
var
îî 
result
îî 
=
îî 
await
îî 
mediator
îî '
.
îî' (
Send
îî( ,
(
îî, -
new
îî- 0)
UpdateVetFromVetClinicQuery
îî1 L
(
îîL M
vetClinicId
îîM X
,
îîX Y
vetId
îîZ _
,
îî_ `
command
îîa h
)
îîh i
)
îîi j
;
îîj k
AccessControl
ññ 
(
ññ 
)
ññ 
;
ññ 
if
óó 
(
óó 
result
óó 
==
óó !
ResponseStatusCodes
óó -
.
óó- .
NotFound
óó. 6
)
óó6 7
{
òò 
return
ôô 
NotFound
ôô 
(
ôô  
)
ôô  !
;
ôô! "
}
öö 
else
õõ 
if
õõ 
(
õõ 
result
õõ 
==
õõ !
ResponseStatusCodes
õõ 2
.
õõ2 3

BadRequest
õõ3 =
)
õõ= >
{
úú 
return
ùù 

BadRequest
ùù !
(
ùù! "
)
ùù" #
;
ùù# $
}
ûû 
else
üü 
{
†† 
return
°° 
Ok
°° 
(
°° 
)
°° 
;
°° 
}
¢¢ 
}
££ 	
[
•• 	

HttpDelete
••	 
(
•• 
$str
•• (
)
••( )
]
••) *
public
¶¶ 
async
¶¶ 
Task
¶¶ 
<
¶¶ 
ActionResult
¶¶ &
>
¶¶& '
Delete
¶¶( .
(
¶¶. /
Guid
¶¶/ 3
vetClinicId
¶¶4 ?
)
¶¶? @
{
ßß 	
var
®® 
result
®® 
=
®® 
await
®® 
mediator
®® '
.
®®' (
Send
®®( ,
(
®®, -
new
®®- 0"
DeleteVetClinicQuery
®®1 E
(
®®E F
vetClinicId
®®F Q
)
®®Q R
)
®®R S
;
®®S T
if
©© 
(
©© 
result
©© 
==
©© 
null
©© 
)
©© 
{
™™ 
return
´´ 
NotFound
´´ 
(
´´  
)
´´  !
;
´´! "
}
¨¨ 
AccessControl
ÆÆ 
(
ÆÆ 
)
ÆÆ 
;
ÆÆ 
return
ØØ 
	NoContent
ØØ 
(
ØØ 
)
ØØ 
;
ØØ 
}
∞∞ 	
[
≤≤ 	

HttpDelete
≤≤	 
(
≤≤ 
$str
≤≤ 9
)
≤≤9 :
]
≤≤: ;
public
≥≥ 
async
≥≥ 
Task
≥≥ 
<
≥≥ 
ActionResult
≥≥ &
>
≥≥& '
	DeleteVet
≥≥( 1
(
≥≥1 2
Guid
≥≥2 6
vetClinicId
≥≥7 B
,
≥≥B C
Guid
≥≥D H
vetId
≥≥I N
)
≥≥N O
{
¥¥ 	
var
µµ 
result
µµ 
=
µµ 
await
µµ 
mediator
µµ '
.
µµ' (
Send
µµ( ,
(
µµ, -
new
µµ- 0)
DeleteVetFromVetClinicQuery
µµ1 L
(
µµL M
vetClinicId
µµM X
,
µµX Y
vetId
µµZ _
)
µµ_ `
)
µµ` a
;
µµa b
if
∂∂ 
(
∂∂ 
result
∂∂ 
==
∂∂ 
null
∂∂ 
)
∂∂ 
{
∑∑ 
return
∏∏ 
NotFound
∏∏ 
(
∏∏  
)
∏∏  !
;
∏∏! "
}
ππ 
AccessControl
ªª 
(
ªª 
)
ªª 
;
ªª 
return
ºº 
	NoContent
ºº 
(
ºº 
)
ºº 
;
ºº 
}
ΩΩ 	
}
ææ 
}øø æ◊
^C:\Users\Leonard\Desktop\VetAppointment\VetAppointment.API\Controllers\VetClinicsController.cs
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
 3
)

3 4
]

4 5
[ 
ApiController 
] 
[ 

ApiVersion 
( 
$str 
) 
] 
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
;/ 0
public  
VetClinicsController #
(# $
IUnitOfWork$ /

unitOfWork0 :
): ;
=>< >
this? C
.C D

unitOfWorkD N
=O P

unitOfWorkQ [
;[ \
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
CreateVetClinicDto/ A
vetClinicDtoB N
)N O
{ 	
var 
history 
= 
MedicalHistory (
.( )
Create) /
(/ 0
)0 1
;1 2
var 
	vetClinic 
= 
VetClinicMapper +
.+ ,
Mapper, 2
.2 3
Map3 6
<6 7
	VetClinic7 @
>@ A
(A B
vetClinicDtoB N
)N O
;O P
if 
( 
	vetClinic 
== 
null !
)! "
{ 
return 

BadRequest !
(! "
)" #
;# $
} 
history 
. 
Entity 
. 
AtachToClinic (
(( )
	vetClinic) 2
.2 3
Id3 5
)5 6
;6 7
	vetClinic   
.    
AttachMedicalHistory   *
(  * +
history  + 2
.  2 3
Entity  3 9
.  9 :
Id  : <
)  < =
;  = >

unitOfWork"" 
."" $
MedicalHistoryRepository"" /
.""/ 0
Add""0 3
(""3 4
history""4 ;
.""; <
Entity""< B
)""B C
;""C D

unitOfWork## 
.## 
SaveChanges## "
(##" #
)### $
;##$ %

unitOfWork%% 
.%% 
VetClinicRepository%% *
.%%* +
Add%%+ .
(%%. /
	vetClinic%%/ 8
)%%8 9
;%%9 :

unitOfWork&& 
.&& 
SaveChanges&& "
(&&" #
)&&# $
;&&$ %
Response(( 
.(( 
Headers(( 
.(( 
Add((  
(((  !
$str((! ?
,((? @
$str((A a
)((a b
;((b c
Response)) 
.)) 
Headers)) 
.)) 
Add))  
())  !
$str))! ?
,))? @
$str))A b
)))b c
;))c d
Response** 
.** 
Headers** 
.** 
Add**  
(**  !
$str**! >
,**> ?
$str**@ X
)**X Y
;**Y Z
return++ 
Created++ 
(++ 
nameof++ !
(++! "
GetAllVetClinics++" 2
)++2 3
,++3 4
VetClinicMapper++5 D
.++D E
Mapper++E K
.++K L
Map++L O
<++O P
VetClinicDto++P \
>++\ ]
(++] ^
	vetClinic++^ g
)++g h
)++h i
;++i j
},, 	
[// 	
HttpGet//	 
]// 
public00 
IActionResult00 
GetAllVetClinics00 -
(00- .
)00. /
{11 	
var22 

vetClinics22 
=22 

unitOfWork22 '
.22' (
VetClinicRepository22( ;
.22; <
All22< ?
(22? @
)22@ A
.22A B
Result22B H
.22H I
Select22I O
(22O P
VetClinicMapper22P _
.22_ `
Mapper22` f
.22f g
Map22g j
<22j k
VetClinicDto22k w
>22w x
)22x y
;22y z
Response44 
.44 
Headers44 
.44 
Add44  
(44  !
$str44! ?
,44? @
$str44A a
)44a b
;44b c
Response55 
.55 
Headers55 
.55 
Add55  
(55  !
$str55! ?
,55? @
$str55A b
)55b c
;55c d
Response66 
.66 
Headers66 
.66 
Add66  
(66  !
$str66! >
,66> ?
$str66@ X
)66X Y
;66Y Z
return77 
Ok77 
(77 

vetClinics77  
)77  !
;77! "
}88 	
[:: 	
HttpGet::	 
(:: 
$str:: %
)::% &
]::& '
public;; 
IActionResult;; 
GetById;; $
(;;$ %
Guid;;% )
vetClinicId;;* 5
);;5 6
{<< 	
var== 
clinic== 
=== 

unitOfWork== #
.==# $
VetClinicRepository==$ 7
.==7 8
Get==8 ;
(==; <
vetClinicId==< G
)==G H
.==H I
Result==I O
;==O P
if>> 
(>> 
clinic>> 
==>> 
null>> 
)>> 
{?? 
return@@ 
NotFound@@ 
(@@  
)@@  !
;@@! "
}AA 
ResponseCC 
.CC 
HeadersCC 
.CC 
AddCC  
(CC  !
$strCC! ?
,CC? @
$strCCA a
)CCa b
;CCb c
ResponseDD 
.DD 
HeadersDD 
.DD 
AddDD  
(DD  !
$strDD! ?
,DD? @
$strDDA b
)DDb c
;DDc d
ResponseEE 
.EE 
HeadersEE 
.EE 
AddEE  
(EE  !
$strEE! >
,EE> ?
$strEE@ X
)EEX Y
;EEY Z
returnFF 
OkFF 
(FF 
clinicFF 
)FF 
;FF 
}GG 	
[II 	
HttpGetII	 
(II 
$strII *
)II* +
]II+ ,
publicJJ 
IActionResultJJ 
GetVetsByClinicIdJJ .
(JJ. /
GuidJJ/ 3
vetClinicIdJJ4 ?
)JJ? @
{KK 	
varLL 
clinicLL 
=LL 

unitOfWorkLL #
.LL# $
VetClinicRepositoryLL$ 7
.LL7 8
GetLL8 ;
(LL; <
vetClinicIdLL< G
)LLG H
.LLH I
ResultLLI O
;LLO P
ifMM 
(MM 
clinicMM 
==MM 
nullMM 
)MM 
{NN 
returnOO 
NotFoundOO 
(OO  
)OO  !
;OO! "
}PP 
varRR 
vetsRR 
=RR 
clinicRR 
.RR 
VetsRR "
.RR" #
SelectRR# )
(RR) *
	VetMapperRR* 3
.RR3 4
MapperRR4 :
.RR: ;
MapRR; >
<RR> ?
VetDtoRR? E
>RRE F
)RRF G
;RRG H
ResponseTT 
.TT 
HeadersTT 
.TT 
AddTT  
(TT  !
$strTT! ?
,TT? @
$strTTA a
)TTa b
;TTb c
ResponseUU 
.UU 
HeadersUU 
.UU 
AddUU  
(UU  !
$strUU! ?
,UU? @
$strUUA b
)UUb c
;UUc d
ResponseVV 
.VV 
HeadersVV 
.VV 
AddVV  
(VV  !
$strVV! >
,VV> ?
$strVV@ X
)VVX Y
;VVY Z
returnWW 
OkWW 
(WW 
vetsWW 
)WW 
;WW 
}XX 	
[ZZ 	
HttpGetZZ	 
(ZZ 
$strZZ *
)ZZ* +
]ZZ+ ,
public[[ 
IActionResult[[ 
GetPetsByClinicId[[ .
([[. /
Guid[[/ 3
vetClinicId[[4 ?
)[[? @
{\\ 	
var]] 
clinic]] 
=]] 

unitOfWork]] #
.]]# $
VetClinicRepository]]$ 7
.]]7 8
Get]]8 ;
(]]; <
vetClinicId]]< G
)]]G H
.]]H I
Result]]I O
;]]O P
if^^ 
(^^ 
clinic^^ 
==^^ 
null^^ 
)^^ 
{__ 
return`` 
NotFound`` 
(``  
)``  !
;``! "
}aa 
varcc 
petscc 
=cc 
cliniccc 
.cc 
Petscc "
.cc" #
Selectcc# )
(cc) *
	PetMappercc* 3
.cc3 4
Mappercc4 :
.cc: ;
Mapcc; >
<cc> ?
PetDtocc? E
>ccE F
)ccF G
;ccG H
Responseee 
.ee 
Headersee 
.ee 
Addee  
(ee  !
$stree! ?
,ee? @
$streeA a
)eea b
;eeb c
Responseff 
.ff 
Headersff 
.ff 
Addff  
(ff  !
$strff! ?
,ff? @
$strffA b
)ffb c
;ffc d
Responsegg 
.gg 
Headersgg 
.gg 
Addgg  
(gg  !
$strgg! >
,gg> ?
$strgg@ X
)ggX Y
;ggY Z
returnhh 
Okhh 
(hh 
petshh 
)hh 
;hh 
}ii 	
[kk 	
HttpGetkk	 
(kk 
$strkk 2
)kk2 3
]kk3 4
publicll 
IActionResultll %
GetAppointmentsByClinicIdll 6
(ll6 7
Guidll7 ;
vetClinicIdll< G
)llG H
{mm 	
varnn 
clinicnn 
=nn 

unitOfWorknn #
.nn# $
VetClinicRepositorynn$ 7
.nn7 8
Getnn8 ;
(nn; <
vetClinicIdnn< G
)nnG H
.nnH I
ResultnnI O
;nnO P
ifoo 
(oo 
clinicoo 
==oo 
nulloo 
)oo 
{pp 
returnqq 
NotFoundqq 
(qq  
)qq  !
;qq! "
}rr 
vartt 
medicalHistorytt 
=tt  

unitOfWorktt! +
.tt+ ,$
MedicalHistoryRepositorytt, D
.ttD E
GetttE H
(ttH I
clinicttI O
.ttO P
MedicalHistoryIdttP `
)tt` a
.tta b
Resultttb h
;tth i
varuu 
appointmentsuu 
=uu 
medicalHistoryuu -
.uu- .
Appointmentsuu. :
.uu: ;
Selectuu; A
(uuA B
AppointmentMapperuuB S
.uuS T
MapperuuT Z
.uuZ [
Mapuu[ ^
<uu^ _
AppointmentDtouu_ m
>uum n
)uun o
;uuo p
Responseww 
.ww 
Headersww 
.ww 
Addww  
(ww  !
$strww! ?
,ww? @
$strwwA a
)wwa b
;wwb c
Responsexx 
.xx 
Headersxx 
.xx 
Addxx  
(xx  !
$strxx! ?
,xx? @
$strxxA b
)xxb c
;xxc d
Responseyy 
.yy 
Headersyy 
.yy 
Addyy  
(yy  !
$stryy! >
,yy> ?
$stryy@ X
)yyX Y
;yyY Z
returnzz 
Okzz 
(zz 
appointmentszz "
)zz" #
;zz# $
}{{ 	
[~~ 	
HttpPost~~	 
(~~ 
$str~~ +
)~~+ ,
]~~, -
public 
IActionResult 
RegisterPetsFamily /
(/ 0
Guid0 4
vetClinicId5 @
,@ A
[B C
FromBodyC K
]K L
ListM Q
<Q R
CreatePetDtoR ^
>^ _
petsDtos` h
)h i
{
ÄÄ 	
var
ÅÅ 
clinic
ÅÅ 
=
ÅÅ 

unitOfWork
ÅÅ #
.
ÅÅ# $!
VetClinicRepository
ÅÅ$ 7
.
ÅÅ7 8
Get
ÅÅ8 ;
(
ÅÅ; <
vetClinicId
ÅÅ< G
)
ÅÅG H
.
ÅÅH I
Result
ÅÅI O
;
ÅÅO P
if
ÇÇ 
(
ÇÇ 
clinic
ÇÇ 
==
ÇÇ 
null
ÇÇ 
)
ÇÇ 
{
ÉÉ 
return
ÑÑ 
NotFound
ÑÑ 
(
ÑÑ  
)
ÑÑ  !
;
ÑÑ! "
}
ÖÖ 
var
áá 
pets
áá 
=
áá 
petsDtos
áá 
.
áá  
Select
áá  &
(
áá& '
	PetMapper
áá' 0
.
áá0 1
Mapper
áá1 7
.
áá7 8
Map
áá8 ;
<
áá; <
Pet
áá< ?
>
áá? @
)
áá@ A
.
ááA B
ToList
ááB H
(
ááH I
)
ááI J
;
ááJ K
if
àà 
(
àà 
pets
àà 
.
àà 
Any
àà 
(
àà 
p
àà 
=>
àà 
p
àà 
==
àà  "
null
àà# '
)
àà' (
)
àà( )
{
ââ 
return
ää 

BadRequest
ää !
(
ää! "
)
ää" #
;
ää# $
}
ãã 
var
çç 
result
çç 
=
çç 
clinic
çç 
.
çç  (
RegisterPetsFamilyToClinic
çç  :
(
çç: ;
pets
çç; ?
.
çç? @
ToList
çç@ F
(
ççF G
)
ççG H
)
ççH I
;
ççI J
if
éé 
(
éé 
result
éé 
.
éé 
	IsFailure
éé  
)
éé  !
{
èè 
return
êê 

BadRequest
êê !
(
êê! "
result
êê" (
.
êê( )
Error
êê) .
)
êê. /
;
êê/ 0
}
ëë 
pets
ìì 
.
ìì 
ForEach
ìì 
(
ìì 
p
ìì 
=>
ìì 

unitOfWork
ìì (
.
ìì( )
PetRepository
ìì) 6
.
ìì6 7
Add
ìì7 :
(
ìì: ;
p
ìì; <
)
ìì< =
)
ìì= >
;
ìì> ?
Response
ïï 
.
ïï 
Headers
ïï 
.
ïï 
Add
ïï  
(
ïï  !
$str
ïï! ?
,
ïï? @
$str
ïïA a
)
ïïa b
;
ïïb c
Response
ññ 
.
ññ 
Headers
ññ 
.
ññ 
Add
ññ  
(
ññ  !
$str
ññ! ?
,
ññ? @
$str
ññA b
)
ññb c
;
ññc d
Response
óó 
.
óó 
Headers
óó 
.
óó 
Add
óó  
(
óó  !
$str
óó! >
,
óó> ?
$str
óó@ X
)
óóX Y
;
óóY Z
return
òò 
Created
òò 
(
òò 
nameof
òò !
(
òò! "
GetPetsByClinicId
òò" 3
)
òò3 4
,
òò4 5
pets
òò6 :
.
òò: ;
Select
òò; A
(
òòA B
	PetMapper
òòB K
.
òòK L
Mapper
òòL R
.
òòR S
Map
òòS V
<
òòV W
PetDto
òòW ]
>
òò] ^
)
òò^ _
)
òò_ `
;
òò` a
}
ôô 	
[
õõ 	
HttpPost
õõ	 
(
õõ 
$str
õõ *
)
õõ* +
]
õõ+ ,
public
úú 
IActionResult
úú 
RegisterVet
úú (
(
úú( )
Guid
úú) -
vetClinicId
úú. 9
,
úú9 :
[
úú; <
FromBody
úú< D
]
úúD E
CreateVetDto
úúF R
vetDto
úúS Y
)
úúY Z
{
ùù 	
var
ûû 
clinic
ûû 
=
ûû 

unitOfWork
ûû #
.
ûû# $!
VetClinicRepository
ûû$ 7
.
ûû7 8
Get
ûû8 ;
(
ûû; <
vetClinicId
ûû< G
)
ûûG H
.
ûûH I
Result
ûûI O
;
ûûO P
if
üü 
(
üü 
clinic
üü 
==
üü 
null
üü 
)
üü 
{
†† 
return
°° 
NotFound
°° 
(
°°  
)
°°  !
;
°°! "
}
¢¢ 
var
§§ 
doctor
§§ 
=
§§ 
	VetMapper
§§ "
.
§§" #
Mapper
§§# )
.
§§) *
Map
§§* -
<
§§- .
Vet
§§. 1
>
§§1 2
(
§§2 3
vetDto
§§3 9
)
§§9 :
;
§§: ;
if
•• 
(
•• 
doctor
•• 
==
•• 
null
•• 
)
•• 
{
¶¶ 
return
ßß 

BadRequest
ßß !
(
ßß! "
)
ßß" #
;
ßß# $
}
®® 
var
™™ 
result
™™ 
=
™™ 
clinic
™™ 
.
™™  !
RegisterVetToClinic
™™  3
(
™™3 4
doctor
™™4 :
)
™™: ;
;
™™; <
if
´´ 
(
´´ 
result
´´ 
.
´´ 
	IsFailure
´´  
)
´´  !
{
¨¨ 
return
≠≠ 

BadRequest
≠≠ !
(
≠≠! "
result
≠≠" (
.
≠≠( )
Error
≠≠) .
)
≠≠. /
;
≠≠/ 0
}
ÆÆ 

unitOfWork
∞∞ 
.
∞∞ !
VetClinicRepository
∞∞ *
.
∞∞* +
Update
∞∞+ 1
(
∞∞1 2
clinic
∞∞2 8
)
∞∞8 9
;
∞∞9 :

unitOfWork
±± 
.
±± 
VetRepository
±± $
.
±±$ %
Add
±±% (
(
±±( )
doctor
±±) /
)
±±/ 0
;
±±0 1
Response
≥≥ 
.
≥≥ 
Headers
≥≥ 
.
≥≥ 
Add
≥≥  
(
≥≥  !
$str
≥≥! ?
,
≥≥? @
$str
≥≥A a
)
≥≥a b
;
≥≥b c
Response
¥¥ 
.
¥¥ 
Headers
¥¥ 
.
¥¥ 
Add
¥¥  
(
¥¥  !
$str
¥¥! ?
,
¥¥? @
$str
¥¥A b
)
¥¥b c
;
¥¥c d
Response
µµ 
.
µµ 
Headers
µµ 
.
µµ 
Add
µµ  
(
µµ  !
$str
µµ! >
,
µµ> ?
$str
µµ@ X
)
µµX Y
;
µµY Z
return
∂∂ 
Created
∂∂ 
(
∂∂ 
nameof
∂∂ !
(
∂∂! "
RegisterVet
∂∂" -
)
∂∂- .
,
∂∂. /
	VetMapper
∂∂0 9
.
∂∂9 :
Mapper
∂∂: @
.
∂∂@ A
Map
∂∂A D
<
∂∂D E
VetDto
∂∂E K
>
∂∂K L
(
∂∂L M
doctor
∂∂M S
)
∂∂S T
)
∂∂T U
;
∂∂U V
}
∑∑ 	
[
ππ 	
HttpPost
ππ	 
(
ππ 
$str
ππ 2
)
ππ2 3
]
ππ3 4
public
∫∫ 
IActionResult
∫∫ !
RegisterAppointment
∫∫ 0
(
∫∫0 1
Guid
∫∫1 5
vetClinicId
∫∫6 A
,
∫∫A B
[
∫∫C D
FromBody
∫∫D L
]
∫∫L M"
CreateAppointmentDto
∫∫N b
appointmentDto
∫∫c q
)
∫∫q r
{
ªª 	
var
ºº 
clinic
ºº 
=
ºº 

unitOfWork
ºº #
.
ºº# $!
VetClinicRepository
ºº$ 7
.
ºº7 8
Get
ºº8 ;
(
ºº; <
vetClinicId
ºº< G
)
ººG H
.
ººH I
Result
ººI O
;
ººO P
if
ΩΩ 
(
ΩΩ 
clinic
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
øø 
NotFound
øø 
(
øø  
)
øø  !
;
øø! "
}
¿¿ 
var
¬¬ 
medicalHistory
¬¬ 
=
¬¬  

unitOfWork
¬¬! +
.
¬¬+ ,&
MedicalHistoryRepository
¬¬, D
.
¬¬D E
Get
¬¬E H
(
¬¬H I
clinic
¬¬I O
.
¬¬O P
MedicalHistoryId
¬¬P `
)
¬¬` a
.
¬¬a b
Result
¬¬b h
;
¬¬h i
var
ƒƒ 
pet
ƒƒ 
=
ƒƒ 

unitOfWork
ƒƒ  
.
ƒƒ  !
PetRepository
ƒƒ! .
.
ƒƒ. /
Get
ƒƒ/ 2
(
ƒƒ2 3
appointmentDto
ƒƒ3 A
.
ƒƒA B
PetId
ƒƒB G
)
ƒƒG H
.
ƒƒH I
Result
ƒƒI O
;
ƒƒO P
if
≈≈ 
(
≈≈ 
pet
≈≈ 
==
≈≈ 
null
≈≈ 
)
≈≈ 
{
∆∆ 
return
«« 
NotFound
«« 
(
««  
)
««  !
;
««! "
}
»» 
var
   
vet
   
=
   

unitOfWork
    
.
    !
VetRepository
  ! .
.
  . /
Get
  / 2
(
  2 3
appointmentDto
  3 A
.
  A B
VetId
  B G
)
  G H
.
  H I
Result
  I O
;
  O P
if
ÀÀ 
(
ÀÀ 
vet
ÀÀ 
==
ÀÀ 
null
ÀÀ 
)
ÀÀ 
{
ÃÃ 
return
ÕÕ 
NotFound
ÕÕ 
(
ÕÕ  
)
ÕÕ  !
;
ÕÕ! "
}
ŒŒ 
var
–– 
appointment
–– 
=
–– 
AppointmentMapper
–– /
.
––/ 0
Mapper
––0 6
.
––6 7
Map
––7 :
<
––: ;
Appointment
––; F
>
––F G
(
––G H
appointmentDto
––H V
)
––V W
;
––W X
if
—— 
(
—— 
appointment
—— 
==
—— 
null
—— #
)
——# $
{
““ 
return
”” 

BadRequest
”” !
(
””! "
)
””" #
;
””# $
}
‘‘ 
var
÷÷ 
result
÷÷ 
=
÷÷ 
medicalHistory
÷÷ '
.
÷÷' (*
RegisterAppointmentToHistory
÷÷( D
(
÷÷D E
appointment
÷÷E P
)
÷÷P Q
;
÷÷Q R
if
◊◊ 
(
◊◊ 
result
◊◊ 
.
◊◊ 
	IsFailure
◊◊  
)
◊◊  !
{
ÿÿ 
return
ŸŸ 

BadRequest
ŸŸ !
(
ŸŸ! "
result
ŸŸ" (
.
ŸŸ( )
Error
ŸŸ) .
)
ŸŸ. /
;
ŸŸ/ 0
}
⁄⁄ 

unitOfWork
‹‹ 
.
‹‹ &
MedicalHistoryRepository
‹‹ /
.
‹‹/ 0
Update
‹‹0 6
(
‹‹6 7
medicalHistory
‹‹7 E
)
‹‹E F
;
‹‹F G

unitOfWork
›› 
.
›› #
AppointmentRepository
›› ,
.
››, -
Add
››- 0
(
››0 1
appointment
››1 <
)
››< =
;
››= >

unitOfWork
ﬁﬁ 
.
ﬁﬁ 
SaveChanges
ﬁﬁ "
(
ﬁﬁ" #
)
ﬁﬁ# $
;
ﬁﬁ$ %
Response
‡‡ 
.
‡‡ 
Headers
‡‡ 
.
‡‡ 
Add
‡‡  
(
‡‡  !
$str
‡‡! ?
,
‡‡? @
$str
‡‡A g
)
‡‡g h
;
‡‡h i
Response
·· 
.
·· 
Headers
·· 
.
·· 
Add
··  
(
··  !
$str
··! ?
,
··? @
$str
··A b
)
··b c
;
··c d
Response
‚‚ 
.
‚‚ 
Headers
‚‚ 
.
‚‚ 
Add
‚‚  
(
‚‚  !
$str
‚‚! >
,
‚‚> ?
$str
‚‚@ X
)
‚‚X Y
;
‚‚Y Z
return
„„ 
Created
„„ 
(
„„ 
nameof
„„ !
(
„„! "!
RegisterAppointment
„„" 5
)
„„5 6
,
„„6 7
AppointmentMapper
„„8 I
.
„„I J
Mapper
„„J P
.
„„P Q
Map
„„Q T
<
„„T U
AppointmentDto
„„U c
>
„„c d
(
„„d e
appointment
„„e p
)
„„p q
)
„„q r
;
„„r s
}
‰‰ 	
[
ÊÊ 	
HttpPut
ÊÊ	 
(
ÊÊ 
$str
ÊÊ %
)
ÊÊ% &
]
ÊÊ& '
public
ÁÁ 
IActionResult
ÁÁ 
Update
ÁÁ #
(
ÁÁ# $
Guid
ÁÁ$ (
vetClinicId
ÁÁ) 4
,
ÁÁ4 5
[
ÁÁ6 7
FromBody
ÁÁ7 ?
]
ÁÁ? @ 
CreateVetClinicDto
ÁÁA S
vetClinicDto
ÁÁT `
)
ÁÁ` a
{
ËË 	
var
ÈÈ 
clinic
ÈÈ 
=
ÈÈ 

unitOfWork
ÈÈ #
.
ÈÈ# $!
VetClinicRepository
ÈÈ$ 7
.
ÈÈ7 8
Get
ÈÈ8 ;
(
ÈÈ; <
vetClinicId
ÈÈ< G
)
ÈÈG H
.
ÈÈH I
Result
ÈÈI O
;
ÈÈO P
if
ÍÍ 
(
ÍÍ 
clinic
ÍÍ 
==
ÍÍ 
null
ÍÍ 
)
ÍÍ 
{
ÎÎ 
return
ÏÏ 
NotFound
ÏÏ 
(
ÏÏ  
)
ÏÏ  !
;
ÏÏ! "
}
ÌÌ 
var
ÔÔ 
result
ÔÔ 
=
ÔÔ 
clinic
ÔÔ 
.
ÔÔ  
Update
ÔÔ  &
(
ÔÔ& '
vetClinicDto
ÔÔ' 3
.
ÔÔ3 4
Name
ÔÔ4 8
,
ÔÔ8 9
vetClinicDto
ÔÔ: F
.
ÔÔF G
Address
ÔÔG N
,
ÔÔN O
vetClinicDto
ÔÔP \
.
ÔÔ\ ]
NumberOfPlaces
ÔÔ] k
,
ÔÔk l
vetClinicDto
 
.
 
ContactEmail
 )
,
) *
vetClinicDto
+ 7
.
7 8
ContactPhone
8 D
)
D E
;
E F
if
ÒÒ 
(
ÒÒ 
result
ÒÒ 
.
ÒÒ 
	IsFailure
ÒÒ  
)
ÒÒ  !
{
ÚÚ 
return
ÛÛ 

BadRequest
ÛÛ !
(
ÛÛ! "
result
ÛÛ" (
.
ÛÛ( )
Error
ÛÛ) .
)
ÛÛ. /
;
ÛÛ/ 0
}
ÙÙ 

unitOfWork
ˆˆ 
.
ˆˆ !
VetClinicRepository
ˆˆ *
.
ˆˆ* +
Update
ˆˆ+ 1
(
ˆˆ1 2
result
ˆˆ2 8
.
ˆˆ8 9
Entity
ˆˆ9 ?
)
ˆˆ? @
;
ˆˆ@ A

unitOfWork
˜˜ 
.
˜˜ 
SaveChanges
˜˜ "
(
˜˜" #
)
˜˜# $
;
˜˜$ %
Response
˘˘ 
.
˘˘ 
Headers
˘˘ 
.
˘˘ 
Add
˘˘  
(
˘˘  !
$str
˘˘! ?
,
˘˘? @
$str
˘˘A g
)
˘˘g h
;
˘˘h i
Response
˙˙ 
.
˙˙ 
Headers
˙˙ 
.
˙˙ 
Add
˙˙  
(
˙˙  !
$str
˙˙! ?
,
˙˙? @
$str
˙˙A b
)
˙˙b c
;
˙˙c d
Response
˚˚ 
.
˚˚ 
Headers
˚˚ 
.
˚˚ 
Add
˚˚  
(
˚˚  !
$str
˚˚! >
,
˚˚> ?
$str
˚˚@ X
)
˚˚X Y
;
˚˚Y Z
return
¸¸ 
	NoContent
¸¸ 
(
¸¸ 
)
¸¸ 
;
¸¸ 
}
˝˝ 	
[
ˇˇ 	
HttpPut
ˇˇ	 
(
ˇˇ 
$str
ˇˇ 6
)
ˇˇ6 7
]
ˇˇ7 8
public
ÄÄ 
IActionResult
ÄÄ 
	UpdateVet
ÄÄ &
(
ÄÄ& '
Guid
ÄÄ' +
vetClinicId
ÄÄ, 7
,
ÄÄ7 8
Guid
ÄÄ9 =
vetId
ÄÄ> C
,
ÄÄC D
[
ÄÄE F
FromBody
ÄÄF N
]
ÄÄN O
CreateVetDto
ÄÄP \
vetDto
ÄÄ] c
)
ÄÄc d
{
ÅÅ 	
var
ÇÇ 
clinic
ÇÇ 
=
ÇÇ 

unitOfWork
ÇÇ #
.
ÇÇ# $!
VetClinicRepository
ÇÇ$ 7
.
ÇÇ7 8
Get
ÇÇ8 ;
(
ÇÇ; <
vetClinicId
ÇÇ< G
)
ÇÇG H
.
ÇÇH I
Result
ÇÇI O
;
ÇÇO P
if
ÉÉ 
(
ÉÉ 
clinic
ÉÉ 
==
ÉÉ 
null
ÉÉ 
)
ÉÉ 
{
ÑÑ 
return
ÖÖ 
NotFound
ÖÖ 
(
ÖÖ  
)
ÖÖ  !
;
ÖÖ! "
}
ÜÜ 
var
àà 
vet
àà 
=
àà 

unitOfWork
àà  
.
àà  !
VetRepository
àà! .
.
àà. /
Get
àà/ 2
(
àà2 3
vetId
àà3 8
)
àà8 9
.
àà9 :
Result
àà: @
;
àà@ A
if
ââ 
(
ââ 
vet
ââ 
==
ââ 
null
ââ 
)
ââ 
{
ää 
return
ãã 
NotFound
ãã 
(
ãã  
)
ãã  !
;
ãã! "
}
åå 
var
éé 
result
éé 
=
éé 
vet
éé 
.
éé 
Update
éé #
(
éé# $
vetDto
éé$ *
.
éé* +
Name
éé+ /
,
éé/ 0
vetDto
éé1 7
.
éé7 8
Surname
éé8 ?
,
éé? @
vetDto
ééA G
.
ééG H
	Birthdate
ééH Q
,
ééQ R
vetDto
ééS Y
.
ééY Z
Gender
ééZ `
,
éé` a
vetDto
ééb h
.
ééh i
Email
ééi n
,
één o
vetDto
èè 
.
èè 
Phone
èè 
,
èè 
vetDto
èè $
.
èè$ %
Specialisation
èè% 3
)
èè3 4
;
èè4 5
if
êê 
(
êê 
result
êê 
.
êê 
	IsFailure
êê  
)
êê  !
{
ëë 
return
íí 

BadRequest
íí !
(
íí! "
result
íí" (
.
íí( )
Error
íí) .
)
íí. /
;
íí/ 0
}
ìì 

unitOfWork
ïï 
.
ïï 
VetRepository
ïï $
.
ïï$ %
Update
ïï% +
(
ïï+ ,
vet
ïï, /
)
ïï/ 0
;
ïï0 1

unitOfWork
ññ 
.
ññ 
SaveChanges
ññ "
(
ññ" #
)
ññ# $
;
ññ$ %
Response
òò 
.
òò 
Headers
òò 
.
òò 
Add
òò  
(
òò  !
$str
òò! ?
,
òò? @
$str
òòA g
)
òòg h
;
òòh i
Response
ôô 
.
ôô 
Headers
ôô 
.
ôô 
Add
ôô  
(
ôô  !
$str
ôô! ?
,
ôô? @
$str
ôôA b
)
ôôb c
;
ôôc d
Response
öö 
.
öö 
Headers
öö 
.
öö 
Add
öö  
(
öö  !
$str
öö! >
,
öö> ?
$str
öö@ X
)
ööX Y
;
ööY Z
return
õõ 
	NoContent
õõ 
(
õõ 
)
õõ 
;
õõ 
}
úú 	
[
ûû 	
HttpPut
ûû	 
(
ûû 
$str
ûû 6
)
ûû6 7
]
ûû7 8
public
üü 
IActionResult
üü 
	UpdatePet
üü &
(
üü& '
Guid
üü' +
vetClinicId
üü, 7
,
üü7 8
Guid
üü9 =
petId
üü> C
,
üüC D
[
üüE F
FromBody
üüF N
]
üüN O
CreatePetDto
üüP \
petDto
üü] c
)
üüc d
{
†† 	
var
°° 
clinic
°° 
=
°° 

unitOfWork
°° #
.
°°# $!
VetClinicRepository
°°$ 7
.
°°7 8
Get
°°8 ;
(
°°; <
vetClinicId
°°< G
)
°°G H
.
°°H I
Result
°°I O
;
°°O P
if
¢¢ 
(
¢¢ 
clinic
¢¢ 
==
¢¢ 
null
¢¢ 
)
¢¢ 
{
££ 
return
§§ 
NotFound
§§ 
(
§§  
)
§§  !
;
§§! "
}
•• 
var
ßß 
pet
ßß 
=
ßß 

unitOfWork
ßß  
.
ßß  !
PetRepository
ßß! .
.
ßß. /
Get
ßß/ 2
(
ßß2 3
petId
ßß3 8
)
ßß8 9
.
ßß9 :
Result
ßß: @
;
ßß@ A
if
®® 
(
®® 
pet
®® 
==
®® 
null
®® 
)
®® 
{
©© 
return
™™ 
NotFound
™™ 
(
™™  
)
™™  !
;
™™! "
}
´´ 
var
≠≠ 
result
≠≠ 
=
≠≠ 
pet
≠≠ 
.
≠≠ 
Update
≠≠ #
(
≠≠# $
petDto
≠≠$ *
.
≠≠* +
Name
≠≠+ /
,
≠≠/ 0
petDto
≠≠1 7
.
≠≠7 8
	Birthdate
≠≠8 A
,
≠≠A B
petDto
≠≠C I
.
≠≠I J
Race
≠≠J N
,
≠≠N O
petDto
≠≠P V
.
≠≠V W
Gender
≠≠W ]
)
≠≠] ^
;
≠≠^ _
if
ÆÆ 
(
ÆÆ 
result
ÆÆ 
.
ÆÆ 
	IsFailure
ÆÆ  
)
ÆÆ  !
{
ØØ 
return
∞∞ 

BadRequest
∞∞ !
(
∞∞! "
result
∞∞" (
.
∞∞( )
Error
∞∞) .
)
∞∞. /
;
∞∞/ 0
}
±± 

unitOfWork
≥≥ 
.
≥≥ 
PetRepository
≥≥ $
.
≥≥$ %
Update
≥≥% +
(
≥≥+ ,
pet
≥≥, /
)
≥≥/ 0
;
≥≥0 1

unitOfWork
¥¥ 
.
¥¥ 
SaveChanges
¥¥ "
(
¥¥" #
)
¥¥# $
;
¥¥$ %
Response
∂∂ 
.
∂∂ 
Headers
∂∂ 
.
∂∂ 
Add
∂∂  
(
∂∂  !
$str
∂∂! ?
,
∂∂? @
$str
∂∂A a
)
∂∂a b
;
∂∂b c
Response
∑∑ 
.
∑∑ 
Headers
∑∑ 
.
∑∑ 
Add
∑∑  
(
∑∑  !
$str
∑∑! ?
,
∑∑? @
$str
∑∑A b
)
∑∑b c
;
∑∑c d
Response
∏∏ 
.
∏∏ 
Headers
∏∏ 
.
∏∏ 
Add
∏∏  
(
∏∏  !
$str
∏∏! >
,
∏∏> ?
$str
∏∏@ X
)
∏∏X Y
;
∏∏Y Z
return
ππ 
	NoContent
ππ 
(
ππ 
)
ππ 
;
ππ 
}
∫∫ 	
[
ºº 	

HttpDelete
ºº	 
(
ºº 
$str
ºº (
)
ºº( )
]
ºº) *
public
ΩΩ 
IActionResult
ΩΩ 
Delete
ΩΩ #
(
ΩΩ# $
Guid
ΩΩ$ (
vetClinicId
ΩΩ) 4
)
ΩΩ4 5
{
ææ 	
var
øø 
	vetClinic
øø 
=
øø 

unitOfWork
øø &
.
øø& '!
VetClinicRepository
øø' :
.
øø: ;
Get
øø; >
(
øø> ?
vetClinicId
øø? J
)
øøJ K
.
øøK L
Result
øøL R
;
øøR S
if
¿¿ 
(
¿¿ 
	vetClinic
¿¿ 
==
¿¿ 
null
¿¿ !
)
¿¿! "
{
¡¡ 
return
¬¬ 
NotFound
¬¬ 
(
¬¬  
)
¬¬  !
;
¬¬! "
}
√√ 
var
≈≈ 
medicalHistorys
≈≈ 
=
≈≈  !

unitOfWork
≈≈" ,
.
≈≈, -&
MedicalHistoryRepository
≈≈- E
.
≈≈E F
All
≈≈F I
(
≈≈I J
)
≈≈J K
.
≈≈K L
Result
≈≈L R
.
≈≈R S
Where
≈≈S X
(
≈≈X Y
m
≈≈Y Z
=>
≈≈[ ]
m
≈≈^ _
.
≈≈_ `
ClinicId
≈≈` h
==
≈≈i k
vetClinicId
≈≈l w
)
≈≈w x
;
≈≈x y
if
∆∆ 
(
∆∆ 
medicalHistorys
∆∆ 
!=
∆∆  "
null
∆∆# '
)
∆∆' (
{
«« 
foreach
»» 
(
»» 
var
»» 
item
»» !
in
»»" $
medicalHistorys
»»% 4
)
»»4 5
{
…… 

unitOfWork
   
.
   &
MedicalHistoryRepository
   7
.
  7 8
Delete
  8 >
(
  > ?
item
  ? C
)
  C D
;
  D E
}
ÀÀ 
}
ÃÃ 
var
ŒŒ 
vets
ŒŒ 
=
ŒŒ 

unitOfWork
ŒŒ !
.
ŒŒ! "
VetRepository
ŒŒ" /
.
ŒŒ/ 0
All
ŒŒ0 3
(
ŒŒ3 4
)
ŒŒ4 5
.
ŒŒ5 6
Result
ŒŒ6 <
.
ŒŒ< =
Where
ŒŒ= B
(
ŒŒB C
v
ŒŒC D
=>
ŒŒE G
v
ŒŒH I
.
ŒŒI J
ClinicId
ŒŒJ R
==
ŒŒS U
vetClinicId
ŒŒV a
)
ŒŒa b
;
ŒŒb c
if
œœ 
(
œœ 
vets
œœ 
!=
œœ 
null
œœ 
)
œœ 
{
–– 
foreach
—— 
(
—— 
var
—— 
item
—— !
in
——" $
vets
——% )
)
——) *
{
““ 

unitOfWork
”” 
.
”” 
VetRepository
”” ,
.
””, -
Delete
””- 3
(
””3 4
item
””4 8
)
””8 9
;
””9 :
}
‘‘ 
}
’’ 
var
◊◊ 
pets
◊◊ 
=
◊◊ 

unitOfWork
◊◊ !
.
◊◊! "
PetRepository
◊◊" /
.
◊◊/ 0
All
◊◊0 3
(
◊◊3 4
)
◊◊4 5
.
◊◊5 6
Result
◊◊6 <
.
◊◊< =
Where
◊◊= B
(
◊◊B C
p
◊◊C D
=>
◊◊E G
p
◊◊H I
.
◊◊I J
ClinicId
◊◊J R
==
◊◊S U
vetClinicId
◊◊V a
)
◊◊a b
;
◊◊b c
if
ÿÿ 
(
ÿÿ 
pets
ÿÿ 
!=
ÿÿ 
null
ÿÿ 
)
ÿÿ 
{
ŸŸ 
foreach
⁄⁄ 
(
⁄⁄ 
var
⁄⁄ 
item
⁄⁄ !
in
⁄⁄" $
pets
⁄⁄% )
)
⁄⁄) *
{
€€ 

unitOfWork
‹‹ 
.
‹‹ 
PetRepository
‹‹ ,
.
‹‹, -
Delete
‹‹- 3
(
‹‹3 4
item
‹‹4 8
)
‹‹8 9
;
‹‹9 :
}
›› 
}
ﬁﬁ 

unitOfWork
‡‡ 
.
‡‡ !
VetClinicRepository
‡‡ *
.
‡‡* +
Delete
‡‡+ 1
(
‡‡1 2
	vetClinic
‡‡2 ;
)
‡‡; <
;
‡‡< =

unitOfWork
·· 
.
·· 
SaveChanges
·· "
(
··" #
)
··# $
;
··$ %
Response
„„ 
.
„„ 
Headers
„„ 
.
„„ 
Add
„„  
(
„„  !
$str
„„! ?
,
„„? @
$str
„„A a
)
„„a b
;
„„b c
Response
‰‰ 
.
‰‰ 
Headers
‰‰ 
.
‰‰ 
Add
‰‰  
(
‰‰  !
$str
‰‰! >
,
‰‰> ?
$str
‰‰@ X
)
‰‰X Y
;
‰‰Y Z
Response
ÂÂ 
.
ÂÂ 
Headers
ÂÂ 
.
ÂÂ 
Add
ÂÂ  
(
ÂÂ  !
$str
ÂÂ! ?
,
ÂÂ? @
$str
ÂÂA b
)
ÂÂb c
;
ÂÂc d
return
ÊÊ 
	NoContent
ÊÊ 
(
ÊÊ 
)
ÊÊ 
;
ÊÊ 
}
ÁÁ 	
[
ÈÈ 	

HttpDelete
ÈÈ	 
(
ÈÈ 
$str
ÈÈ 9
)
ÈÈ9 :
]
ÈÈ: ;
public
ÍÍ 
IActionResult
ÍÍ 
	DeleteVet
ÍÍ &
(
ÍÍ& '
Guid
ÍÍ' +
vetClinicId
ÍÍ, 7
,
ÍÍ7 8
Guid
ÍÍ9 =
vetId
ÍÍ> C
)
ÍÍC D
{
ÎÎ 	
var
ÏÏ 
clinic
ÏÏ 
=
ÏÏ 

unitOfWork
ÏÏ #
.
ÏÏ# $!
VetClinicRepository
ÏÏ$ 7
.
ÏÏ7 8
Get
ÏÏ8 ;
(
ÏÏ; <
vetClinicId
ÏÏ< G
)
ÏÏG H
.
ÏÏH I
Result
ÏÏI O
;
ÏÏO P
if
ÌÌ 
(
ÌÌ 
clinic
ÌÌ 
==
ÌÌ 
null
ÌÌ 
)
ÌÌ 
{
ÓÓ 
return
ÔÔ 
NotFound
ÔÔ 
(
ÔÔ  
)
ÔÔ  !
;
ÔÔ! "
}
 
var
ÚÚ 
vet
ÚÚ 
=
ÚÚ 

unitOfWork
ÚÚ  
.
ÚÚ  !
VetRepository
ÚÚ! .
.
ÚÚ. /
Get
ÚÚ/ 2
(
ÚÚ2 3
vetId
ÚÚ3 8
)
ÚÚ8 9
.
ÚÚ9 :
Result
ÚÚ: @
;
ÚÚ@ A
if
ÛÛ 
(
ÛÛ 
vet
ÛÛ 
==
ÛÛ 
null
ÛÛ 
)
ÛÛ 
{
ÙÙ 
return
ıı 
NotFound
ıı 
(
ıı  
)
ıı  !
;
ıı! "
}
ˆˆ 

unitOfWork
¯¯ 
.
¯¯ 
VetRepository
¯¯ $
.
¯¯$ %
Delete
¯¯% +
(
¯¯+ ,
vet
¯¯, /
)
¯¯/ 0
;
¯¯0 1

unitOfWork
˘˘ 
.
˘˘ 
SaveChanges
˘˘ "
(
˘˘" #
)
˘˘# $
;
˘˘$ %
Response
˚˚ 
.
˚˚ 
Headers
˚˚ 
.
˚˚ 
Add
˚˚  
(
˚˚  !
$str
˚˚! ?
,
˚˚? @
$str
˚˚A a
)
˚˚a b
;
˚˚b c
Response
¸¸ 
.
¸¸ 
Headers
¸¸ 
.
¸¸ 
Add
¸¸  
(
¸¸  !
$str
¸¸! ?
,
¸¸? @
$str
¸¸A b
)
¸¸b c
;
¸¸c d
Response
˝˝ 
.
˝˝ 
Headers
˝˝ 
.
˝˝ 
Add
˝˝  
(
˝˝  !
$str
˝˝! >
,
˝˝> ?
$str
˝˝@ X
)
˝˝X Y
;
˝˝Y Z
return
˛˛ 
	NoContent
˛˛ 
(
˛˛ 
)
˛˛ 
;
˛˛ 
}
ˇˇ 	
[
ÅÅ 	

HttpDelete
ÅÅ	 
(
ÅÅ 
$str
ÅÅ 9
)
ÅÅ9 :
]
ÅÅ: ;
public
ÇÇ 
IActionResult
ÇÇ 
	DeletePet
ÇÇ &
(
ÇÇ& '
Guid
ÇÇ' +
vetClinicId
ÇÇ, 7
,
ÇÇ7 8
Guid
ÇÇ9 =
petId
ÇÇ> C
)
ÇÇC D
{
ÉÉ 	
var
ÑÑ 
clinic
ÑÑ 
=
ÑÑ 

unitOfWork
ÑÑ #
.
ÑÑ# $!
VetClinicRepository
ÑÑ$ 7
.
ÑÑ7 8
Get
ÑÑ8 ;
(
ÑÑ; <
vetClinicId
ÑÑ< G
)
ÑÑG H
.
ÑÑH I
Result
ÑÑI O
;
ÑÑO P
if
ÖÖ 
(
ÖÖ 
clinic
ÖÖ 
==
ÖÖ 
null
ÖÖ 
)
ÖÖ 
{
ÜÜ 
return
áá 
NotFound
áá 
(
áá  
)
áá  !
;
áá! "
}
àà 
var
ää 
pet
ää 
=
ää 

unitOfWork
ää  
.
ää  !
PetRepository
ää! .
.
ää. /
Get
ää/ 2
(
ää2 3
petId
ää3 8
)
ää8 9
.
ää9 :
Result
ää: @
;
ää@ A
if
ãã 
(
ãã 
pet
ãã 
==
ãã 
null
ãã 
)
ãã 
{
åå 
return
çç 
NotFound
çç 
(
çç  
)
çç  !
;
çç! "
}
éé 

unitOfWork
êê 
.
êê 
PetRepository
êê $
.
êê$ %
Delete
êê% +
(
êê+ ,
pet
êê, /
)
êê/ 0
;
êê0 1

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
îî! ?
,
îî? @
$str
îîA b
)
îîb c
;
îîc d
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
ïï! >
,
ïï> ?
$str
ïï@ X
)
ïïX Y
;
ïïY Z
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
}
òò 
}ôô ñ
XC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.API\Controllers\VetsController.cs
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
$str		 3
)		3 4
]		4 5
[

 
ApiController

 
]

 
[ 

ApiVersion 
( 
$str 
) 
] 
public 

class 
VetsController 
:  !
ControllerBase" 0
{ 
private 
readonly 
IRepository $
<$ %
Vet% (
>( )
vetRepository* 7
;7 8
public 
VetsController 
( 
IRepository )
<) *
Vet* -
>- .
vetRepository/ <
)< =
=>> @
thisA E
.E F
vetRepositoryF S
=T U
vetRepositoryV c
;c d
[ 	
HttpGet	 
] 
public 
IActionResult 
Get  
(  !
)! "
{ 	
var 
vets 
= 
vetRepository $
.$ %
All% (
(( )
)) *
.* +
Result+ 1
.1 2
Select2 8
(8 9
	VetMapper9 B
.B C
MapperC I
.I J
MapJ M
<M N
VetDtoN T
>T U
)U V
;V W
Response 
. 
Headers 
. 
Add  
(  !
$str! ?
,? @
$strA a
)a b
;b c
Response 
. 
Headers 
. 
Add  
(  !
$str! ?
,? @
$strA b
)b c
;c d
Response 
. 
Headers 
. 
Add  
(  !
$str! >
,> ?
$str@ X
)X Y
;Y Z
return 
Ok 
( 
vets 
) 
; 
} 	
} 
} Ö
QC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.API\Dtos\AppointmentDto.cs
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
}		 æ

^C:\Users\Leonard\Desktop\VetAppointment\VetAppointment.API\Dtos\Create\CreateAppointmentDto.cs
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
} π
WC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.API\Dtos\Create\CreateDrugDto.cs
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
 Õ
VC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.API\Dtos\Create\CreatePetDto.cs
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
} ß
[C:\Users\Leonard\Desktop\VetAppointment\VetAppointment.API\Dtos\Create\CreatePetOwnerDto.cs
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
} Õ
aC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.API\Dtos\Create\CreatePrescribedDrugDto.cs
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
}		 ë
\C:\Users\Leonard\Desktop\VetAppointment\VetAppointment.API\Dtos\Create\CreateTreatmentDto.cs
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
} Ñ	
\C:\Users\Leonard\Desktop\VetAppointment\VetAppointment.API\Dtos\Create\CreateVetClinicDto.cs
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
} §
VC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.API\Dtos\Create\CreateVetDto.cs
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
} 
JC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.API\Dtos\DrugDto.cs
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
 Ù
TC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.API\Dtos\MedicalHistoryDto.cs
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
} Ì
IC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.API\Dtos\PetDto.cs
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
}		 ¸
NC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.API\Dtos\PetOwnerDto.cs
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
}		 é
TC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.API\Dtos\PrescribedDrugDto.cs
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
}		 ˇ
OC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.API\Dtos\TreatmentDto.cs
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
}		 «
OC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.API\Dtos\VetClinicDto.cs
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
} á
IC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.API\Dtos\VetDto.cs
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
} ≈
WC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.API\Mappers\AppointmentMapper.cs
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
} ∆
^C:\Users\Leonard\Desktop\VetAppointment\VetAppointment.API\Mappers\AppointmentMapperProfile.cs
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
} ∞
PC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.API\Mappers\DrugMapper.cs
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
} ï
WC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.API\Mappers\DrugMapperProfile.cs
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
} Œ
ZC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.API\Mappers\MedicalHistoryMapper.cs
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
} ’
aC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.API\Mappers\MedicalHistoryMapperProfile.cs
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
} Æ
OC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.API\Mappers\PetMapper.cs
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
} ë
WC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.API\Mappers\PetMappingProfile.cs
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
} º
TC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.API\Mappers\PetOwnerMapper.cs
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
} ±
[C:\Users\Leonard\Desktop\VetAppointment\VetAppointment.API\Mappers\PetOwnerMapperProfile.cs
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
} Œ
ZC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.API\Mappers\PrescribedDrugMapper.cs
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
} €
aC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.API\Mappers\PrescribedDrugMapperProfile.cs
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
} ø
UC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.API\Mappers\TreatmentMapper.cs
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
} ∏
\C:\Users\Leonard\Desktop\VetAppointment\VetAppointment.API\Mappers\TreatmentMapperProfile.cs
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
} ø
UC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.API\Mappers\VetClinicMapper.cs
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
} ∏
\C:\Users\Leonard\Desktop\VetAppointment\VetAppointment.API\Mappers\VetClinicMapperProfile.cs
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
} Æ
OC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.API\Mappers\VetMapper.cs
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
} ë
WC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.API\Mappers\VetMappingProfile.cs
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
} ÷;
EC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.API\Program.cs
var 
builder 
= 
WebApplication 
. 
CreateBuilder *
(* +
args+ /
)/ 0
;0 1
builder 
. 
Services 
. 
AddControllers 
(  
)  !
;! "
builder 
. 
Services 
. #
AddEndpointsApiExplorer (
(( )
)) *
;* +
builder 
. 
Services 
. 
AddSwaggerGen 
( 
options &
=>' )
{ 
options 
. 

SwaggerDoc 
( 
$str 
,  
new! $
	Microsoft% .
.. /
OpenApi/ 6
.6 7
Models7 =
.= >
OpenApiInfo> I
(I J
)J K
{ 
Title 
= 
$str (
,( )
Version* 1
=2 3
$str4 7
,7 8
Description9 D
=E F
$strG K
,K L
} 
) 	
;	 

options 
. 

SwaggerDoc 
( 
$str 
,  
new! $
	Microsoft% .
.. /
OpenApi/ 6
.6 7
Models7 =
.= >
OpenApiInfo> I
(I J
)J K
{ 
Title 
= 
$str (
,( )
Version* 1
=2 3
$str4 7
,7 8
Description9 D
=E F
$strG Z
,Z [
} 
) 	
;	 

} 
) 
; 
builder 
. 
Services 
. 
AddCors 
( 
options  
=>! #
{ 
options 
. 
AddDefaultPolicy 
( 
builder $
=>% '
{   
builder!! 
.!! 
WithOrigins!! 
(!! 
$str!! 4
)!!4 5
.!!5 6
WithMethods"" 
("" 
$str"" 
,"" 
$str"" !
,""! "
$str""# (
,""( )
$str""* 2
)""2 3
.""3 4
WithHeaders""4 ?
(""? @
$str""@ N
,""N O
$str""P b
)""b c
;""c d
}## 
)## 
;## 
options%% 
.%% 
	AddPolicy%% 
(%% 
name%% 
:%% 
$str%% )
,%%) *
builder%%+ 2
=>%%3 5
{&& 
builder'' 
.'' 
WithOrigins'' 
('' 
$str'' 4
)''4 5
.''5 6
WithMethods(( 
((( 
$str(( 
,(( 
$str(( !
,((! "
$str((# (
,((( )
$str((* 2
)((2 3
.((3 4
WithHeaders((4 ?
(((? @
$str((@ N
,((N O
$str((P b
)((b c
;((c d
})) 
))) 
;)) 
}** 
)** 
;** 
builder,, 
.,, 
Services,, 
.,, 
AddApiVersioning,, !
(,,! "
options,," )
=>,,* ,
{-- 
options.. 
... /
#AssumeDefaultVersionWhenUnspecified.. 3
=..4 5
true..6 :
;..: ;
options// 
.// 
DefaultApiVersion// !
=//" #
new//$ '
	Microsoft//( 1
.//1 2

AspNetCore//2 <
.//< =
Mvc//= @
.//@ A

ApiVersion//A K
(//K L
$num//L M
,//M N
$num//O P
)//P Q
;//Q R
options00 
.00 
ReportApiVersions00 !
=00" #
true00$ (
;00( )
options11 
.11 
ApiVersionReader11  
=11! "
ApiVersionReader11# 3
.113 4
Combine114 ;
(22 
new33 '
QueryStringApiVersionReader33 /
(33/ 0
$str330 =
)33= >
,33> ?
new44 "
HeaderApiVersionReader44 *
(44* +
$str44+ 6
)446 7
,447 8
new55 %
MediaTypeApiVersionReader55 -
(55- .
$str55. 3
)553 4
)66 
;66 
}77 
)88 
;88 
builder:: 
.:: 
Services:: 
.:: #
AddVersionedApiExplorer:: (
(::( )
options::) 0
=>::1 3
{;; 
options<< 
.<< 
GroupNameFormat<< 
=<<  !
$str<<" *
;<<* +
options== 
.== %
SubstituteApiVersionInUrl== )
===* +
true==, 0
;==0 1
}>> 
)?? 
;?? 
builderAA 
.AA 
ServicesAA 
.AA 
AddControllersAA 
(AA  
)AA  !
;AA! "
builderBB 
.BB 
ServicesBB 
.BB "
AddApplicationServicesBB '
(BB' (
)BB( )
;BB) *
builderCC 
.CC 
ServicesCC 
.CC 
AddAPIServicesCC 
(CC  
)CC  !
;CC! "
builderDD 
.DD 
ServicesDD 
.DD $
AddInfrastrutureServicesDD )
(DD) *
builderDD* 1
.DD1 2
ConfigurationDD2 ?
)DD? @
;DD@ A
builderEE 
.EE 
ServicesEE 
.EE 
AddHealthChecksEE  
(EE  !
)EE! "
;EE" #
varGG 
appGG 
=GG 	
builderGG
 
.GG 
BuildGG 
(GG 
)GG 
;GG 
ifJJ 
(JJ 
appJJ 
.JJ 
EnvironmentJJ 
.JJ 
IsDevelopmentJJ !
(JJ! "
)JJ" #
)JJ# $
{KK 
appLL 
.LL 

UseSwaggerLL 
(LL 
)LL 
;LL 
appMM 
.MM 
UseSwaggerUIMM 
(MM 
optionsMM 
=>MM 
{NN 	
optionsOO 
.OO 
SwaggerEndpointOO #
(OO# $
$"OO$ &
$strOO& >
"OO> ?
,OO? @
$"OOA C
$strOOC E
"OOE F
)OOF G
;OOG H
optionsPP 
.PP 
SwaggerEndpointPP #
(PP# $
$"PP$ &
$strPP& >
"PP> ?
,PP? @
$"PPA C
$strPPC E
"PPE F
)PPF G
;PPG H
}QQ 	
)RR 
;RR 
}SS 
appUU 
.UU 
UseHttpsRedirectionUU 
(UU 
)UU 
;UU 
appVV 
.VV 
UseCorsVV 
(VV 
$strVV 
)VV 
;VV 
appWW 
.WW 
UseHealthChecksWW 
(WW 
$strWW 
)WW 
;WW 
appYY 
.YY 
UseAuthorizationYY 
(YY 
)YY 
;YY 
app[[ 
.[[ 
MapControllers[[ 
([[ 
)[[ 
;[[ 
app]] 
.]] 
Run]] 
(]] 
)]] 	
;]]	 
™
fC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.API\Validators\CreateAppointmentDtoValidator.cs
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
} Ç
_C:\Users\Leonard\Desktop\VetAppointment\VetAppointment.API\Validators\CreateDrugDtoValidator.cs
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
} ≥
^C:\Users\Leonard\Desktop\VetAppointment\VetAppointment.API\Validators\CreatePetDtoValidator.cs
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
} Í
cC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.API\Validators\CreatePetOwnerDtoValidator.cs
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
} ô	
iC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.API\Validators\CreatePrescribedDrugDtoValidator.cs
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
} ‡
dC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.API\Validators\CreateTreatmentDtoValidator.cs
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
} ≈
dC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.API\Validators\CreateVetClinicDtoValidator.cs
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
} £
^C:\Users\Leonard\Desktop\VetAppointment\VetAppointment.API\Validators\CreateVetDtoValidator.cs
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
} ø
TC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.API\Validators\Validations.cs
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