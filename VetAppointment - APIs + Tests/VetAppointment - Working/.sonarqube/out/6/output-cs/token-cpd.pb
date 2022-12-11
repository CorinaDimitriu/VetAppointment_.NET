Ë{
õD:\Facultate\Anul_3\.NET\VetAppointment_S12\VetAppointment - APIs + Tests\VetAppointment - Working\VetAppointment.API\Controllers\AppointmentsController.cs
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
;II 
ResponseKK 
.KK 
HeadersKK 
.KK 
AddKK  
(KK  !
$strKK! ?
,KK? @
$strKKA a
)KKa b
;KKb c
ResponseLL 
.LL 
HeadersLL 
.LL 
AddLL  
(LL  !
$strLL! ?
,LL? @
$strLLA b
)LLb c
;LLc d
ResponseMM 
.MM 
HeadersMM 
.MM 
AddMM  
(MM  !
$strMM! >
,MM> ?
$strMM@ X
)MMX Y
;MMY Z
returnNN 
CreatedNN 
(NN 
nameofNN !
(NN! "
GetAllAppointmentsNN" 4
)NN4 5
,NN5 6
fullAppointmentNN7 F
)NNF G
;NNG H
}OO 	
[QQ 	
HttpGetQQ	 
]QQ 
publicRR 
IActionResultRR 
GetAllAppointmentsRR /
(RR/ 0
)RR0 1
{SS 	
varTT 
appointmentsTT 
=TT 

unitOfWorkTT )
.TT) *!
AppointmentRepositoryTT* ?
.TT? @
AllTT@ C
(TTC D
)TTD E
.TTE F
SelectTTF L
(TTL M
appointmentTTM X
=>TTY [
newTT\ _
AppointmentDtoTT` n
(TTn o
)TTo p
{UU 
IdVV 
=VV 
appointmentVV  
.VV  !
IdVV! #
,VV# $
VetIdWW 
=WW 
appointmentWW #
.WW# $
VetIdWW$ )
,WW) *
PetIdXX 
=XX 
appointmentXX #
.XX# $
PetIdXX$ )
,XX) *
ScheduledDateYY 
=YY 
appointmentYY  +
.YY+ ,
ScheduledDateYY, 9
.YY9 :
ToStringYY: B
(YYB C
)YYC D
,YYD E&
EstimatedDurationInMinutesZZ *
=ZZ+ ,
appointmentZZ- 8
.ZZ8 9&
EstimatedDurationInMinutesZZ9 S
,ZZS T
TreatmentId[[ 
=[[ 
appointment[[ )
.[[) *
TreatmentId[[* 5
,[[5 6
MedicalHistoryId\\  
=\\! "
appointment\\# .
.\\. /
MedicalHistoryId\\/ ?
}]] 
)]] 
;]] 
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
returnbb 
Okbb 
(bb 
appointmentsbb "
)bb" #
;bb# $
}cc 	
[ee 	
HttpGetee	 
(ee 
$stree 
)ee 
]ee 
publicff 
IActionResultff 
GetAppointmentByIdff /
(ff/ 0
Guidff0 4
idff5 7
)ff7 8
{gg 	
varhh 
appointmenthh 
=hh 

unitOfWorkhh (
.hh( )!
AppointmentRepositoryhh) >
.hh> ?
Gethh? B
(hhB C
idhhC E
)hhE F
;hhF G
ifii 
(ii 
appointmentii 
==ii 
nullii #
)ii# $
{jj 
returnkk 
NotFoundkk 
(kk  
)kk  !
;kk! "
}ll 
varnn 
appointmentDtonn 
=nn  
newnn! $
AppointmentDtonn% 3
{oo 
Idpp 
=pp 
appointmentpp  
.pp  !
Idpp! #
,pp# $
VetIdqq 
=qq 
appointmentqq #
.qq# $
VetIdqq$ )
,qq) *
PetIdrr 
=rr 
appointmentrr #
.rr# $
PetIdrr$ )
,rr) *
ScheduledDatess 
=ss 
appointmentss  +
.ss+ ,
ScheduledDatess, 9
.ss9 :
ToStringss: B
(ssB C
)ssC D
,ssD E&
EstimatedDurationInMinutestt *
=tt+ ,
appointmenttt- 8
.tt8 9&
EstimatedDurationInMinutestt9 S
,ttS T
TreatmentIduu 
=uu 
appointmentuu )
.uu) *
TreatmentIduu* 5
,uu5 6
MedicalHistoryIdvv  
=vv! "
appointmentvv# .
.vv. /
MedicalHistoryIdvv/ ?
}ww 
;ww 
Responseyy 
.yy 
Headersyy 
.yy 
Addyy  
(yy  !
$stryy! ?
,yy? @
$stryyA a
)yya b
;yyb c
Responsezz 
.zz 
Headerszz 
.zz 
Addzz  
(zz  !
$strzz! ?
,zz? @
$strzzA b
)zzb c
;zzc d
Response{{ 
.{{ 
Headers{{ 
.{{ 
Add{{  
({{  !
$str{{! >
,{{> ?
$str{{@ X
){{X Y
;{{Y Z
return|| 
Ok|| 
(|| 
appointmentDto|| $
)||$ %
;||% &
}}} 	
[ 	

HttpDelete	 
( 
$str 
) 
] 
public
ÄÄ 
IActionResult
ÄÄ 
DeleteAppointment
ÄÄ .
(
ÄÄ. /
Guid
ÄÄ/ 3
id
ÄÄ4 6
)
ÄÄ6 7
{
ÅÅ 	
var
ÇÇ 
appointment
ÇÇ 
=
ÇÇ 

unitOfWork
ÇÇ (
.
ÇÇ( )#
AppointmentRepository
ÇÇ) >
.
ÇÇ> ?
Get
ÇÇ? B
(
ÇÇB C
id
ÇÇC E
)
ÇÇE F
;
ÇÇF G
if
ÉÉ 
(
ÉÉ 
appointment
ÉÉ 
==
ÉÉ 
null
ÉÉ #
)
ÉÉ# $
{
ÑÑ 
return
ÖÖ 
NotFound
ÖÖ 
(
ÖÖ  
)
ÖÖ  !
;
ÖÖ! "
}
ÜÜ 

unitOfWork
àà 
.
àà #
AppointmentRepository
àà ,
.
àà, -
Delete
àà- 3
(
àà3 4
appointment
àà4 ?
)
àà? @
;
àà@ A

unitOfWork
ââ 
.
ââ 
SaveChanges
ââ "
(
ââ" #
)
ââ# $
;
ââ$ %
Response
ãã 
.
ãã 
Headers
ãã 
.
ãã 
Add
ãã  
(
ãã  !
$str
ãã! ?
,
ãã? @
$str
ããA a
)
ããa b
;
ããb c
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
ååA b
)
ååb c
;
ååc d
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
çç! >
,
çç> ?
$str
çç@ X
)
ççX Y
;
ççY Z
return
éé 
	NoContent
éé 
(
éé 
)
éé 
;
éé 
}
èè 	
[
ëë 	
HttpPut
ëë	 
(
ëë 
$str
ëë 
)
ëë 
]
ëë 
public
íí 
IActionResult
íí 
UpdateAppointment
íí .
(
íí. /
Guid
íí/ 3
id
íí4 6
,
íí6 7
[
íí8 9
FromBody
íí9 A
]
ííA B
AppointmentDto
ííC Q
appointmentDto
ííR `
)
íí` a
{
ìì 	
var
îî 
appointment
îî 
=
îî 

unitOfWork
îî (
.
îî( )#
AppointmentRepository
îî) >
.
îî> ?
Get
îî? B
(
îîB C
id
îîC E
)
îîE F
;
îîF G
if
ïï 
(
ïï 
appointment
ïï 
==
ïï 
null
ïï #
)
ïï# $
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
òò 
appointment
öö 
.
öö 
Update
öö 
(
öö 
appointment
öö *
.
öö* +
VetId
öö+ 0
,
öö0 1
appointmentDto
öö2 @
.
öö@ A
PetId
ööA F
,
ööF G
appointmentDto
ööH V
.
ööV W
ScheduledDate
ööW d
,
ööd e
appointmentDto
õõ 
.
õõ (
EstimatedDurationInMinutes
õõ 9
,
õõ9 :
appointmentDto
õõ; I
.
õõI J
TreatmentId
õõJ U
,
õõU V
appointmentDto
õõW e
.
õõe f
MedicalHistoryId
õõf v
)
õõv w
;
õõw x

unitOfWork
ùù 
.
ùù #
AppointmentRepository
ùù ,
.
ùù, -
Update
ùù- 3
(
ùù3 4
appointment
ùù4 ?
)
ùù? @
;
ùù@ A

unitOfWork
ûû 
.
ûû 
SaveChanges
ûû "
(
ûû" #
)
ûû# $
;
ûû$ %
Response
†† 
.
†† 
Headers
†† 
.
†† 
Add
††  
(
††  !
$str
††! ?
,
††? @
$str
††A a
)
††a b
;
††b c
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
°°A b
)
°°b c
;
°°c d
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
¢¢! >
,
¢¢> ?
$str
¢¢@ X
)
¢¢X Y
;
¢¢Y Z
return
££ 
	NoContent
££ 
(
££ 
)
££ 
;
££ 
}
§§ 	
}
•• 
}¶¶ ≈M
îD:\Facultate\Anul_3\.NET\VetAppointment_S12\VetAppointment - APIs + Tests\VetAppointment - Working\VetAppointment.API\Controllers\DrugsController.cs
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
; 
Response 
. 
Headers 
. 
Add  
(  !
$str! ?
,? @
$strA a
)a b
;b c
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
("" 
drugs"" 
)"" 
;"" 
}## 	
[%% 	
HttpGet%%	 
(%% 
$str%%  
)%%  !
]%%! "
public&& 
IActionResult&& 
Get&&  
(&&  !
Guid&&! %
drugId&&& ,
)&&, -
{'' 	
{(( 
var)) 
drug)) 
=)) 
drugRepository)) )
.))) *
Get))* -
())- .
drugId)). 4
)))4 5
;))5 6
if++ 
(++ 
drug++ 
==++ 
null++  
)++  !
{,, 
return-- 
NotFound-- #
(--# $
)--$ %
;--% &
}.. 
var00 
drugDto00 
=00 
new00 !
DrugDto00" )
{11 
Id22 
=22 
drug22 
.22 
Id22  
,22  !
Name33 
=33 
drug33 
.33  
Name33  $
,33$ %
Quantity44 
=44 
drug44 #
.44# $
Quantity44$ ,
,44, -
	UnitPrice55 
=55 
drug55  $
.55$ %
	UnitPrice55% .
}66 
;66 
Response88 
.88 
Headers88  
.88  !
Add88! $
(88$ %
$str88% C
,88C D
$str88E e
)88e f
;88f g
Response99 
.99 
Headers99  
.99  !
Add99! $
(99$ %
$str99% C
,99C D
$str99E f
)99f g
;99g h
Response:: 
.:: 
Headers::  
.::  !
Add::! $
(::$ %
$str::% B
,::B C
$str::D \
)::\ ]
;::] ^
return;; 
Ok;; 
(;; 
drugDto;; !
);;! "
;;;" #
}<< 
}== 	
[?? 	
HttpPost??	 
]?? 
public@@ 
IActionResult@@ 
Create@@ #
(@@# $
[@@$ %
FromBody@@% -
]@@- .
CreateDrugDto@@/ <
drugDto@@= D
)@@D E
{AA 	
varBB 
drugBB 
=BB 
DrugBB 
.BB 
CreateBB "
(BB" #
drugDtoCC 
.CC 
NameCC  
,CC  !
drugDtoDD 
.DD 
QuantityDD $
,DD$ %
drugDtoEE 
.EE 
	UnitPriceEE %
)FF 
;FF 
ifHH 
(HH 
drugHH 
.HH 
	IsFailureHH 
)HH 
{II 
returnJJ 

BadRequestJJ !
(JJ! "
drugJJ" &
.JJ& '
ErrorJJ' ,
)JJ, -
;JJ- .
}KK 
drugRepositoryMM 
.MM 
AddMM 
(MM 
drugMM #
.MM# $
EntityMM$ *
)MM* +
;MM+ ,
drugRepositoryNN 
.NN 
SaveChangesNN &
(NN& '
)NN' (
;NN( )
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
,SS& '
drugSS( ,
.SS, -
EntitySS- 3
)SS3 4
;SS4 5
}TT 	
[VV 	

HttpDeleteVV	 
(VV 
$strVV #
)VV# $
]VV$ %
publicWW 
IActionResultWW 
DeleteWW #
(WW# $
GuidWW$ (
drugIdWW) /
)WW/ 0
{XX 	
varYY 
drugYY 
=YY 
drugRepositoryYY %
.YY% &
GetYY& )
(YY) *
drugIdYY* 0
)YY0 1
;YY1 2
ifZZ 
(ZZ 
drugZZ 
==ZZ 
nullZZ 
)ZZ 
{[[ 
return\\ 
NotFound\\ 
(\\  
)\\  !
;\\! "
}]] 
drugRepository__ 
.__ 
Delete__ !
(__! "
drug__" &
)__& '
;__' (
drugRepository`` 
.`` 
SaveChanges`` &
(``& '
)``' (
;``( )
Responsebb 
.bb 
Headersbb 
.bb 
Addbb  
(bb  !
$strbb! ?
,bb? @
$strbbA a
)bba b
;bbb c
Responsecc 
.cc 
Headerscc 
.cc 
Addcc  
(cc  !
$strcc! ?
,cc? @
$strccA b
)ccb c
;ccc d
Responsedd 
.dd 
Headersdd 
.dd 
Adddd  
(dd  !
$strdd! >
,dd> ?
$strdd@ X
)ddX Y
;ddY Z
returnee 
Okee 
(ee 
)ee 
;ee 
}ff 	
[hh 	
HttpPuthh	 
(hh 
$strhh  
)hh  !
]hh! "
publicii 
IActionResultii 
Updateii #
(ii# $
Guidii$ (
drugIdii) /
,ii/ 0
[ii1 2
FromBodyii2 :
]ii: ;
CreateDrugDtoii< I
drugDtoiiJ Q
)iiQ R
{jj 	
varkk 
drugkk 
=kk 
drugRepositorykk %
.kk% &
Getkk& )
(kk) *
drugIdkk* 0
)kk0 1
;kk1 2
ifll 
(ll 
drugll 
==ll 
nullll 
)ll 
{mm 
returnnn 
NotFoundnn 
(nn  
)nn  !
;nn! "
}oo 
drugqq 
.qq 
Updateqq 
(qq 
drugDtoqq 
.qq  
Nameqq  $
,qq$ %
drugDtoqq& -
.qq- .
Quantityqq. 6
,qq6 7
drugDtoqq8 ?
.qq? @
	UnitPriceqq@ I
)qqI J
;qqJ K
drugRepositoryss 
.ss 
Updatess !
(ss! "
drugss" &
)ss& '
;ss' (
drugRepositorytt 
.tt 
SaveChangestt &
(tt& '
)tt' (
;tt( )
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
returnyy 
Okyy 
(yy 
drugyy 
)yy 
;yy 
}zz 	
}{{ 
}|| ˝<
üD:\Facultate\Anul_3\.NET\VetAppointment_S12\VetAppointment - APIs + Tests\VetAppointment - Working\VetAppointment.API\Controllers\MedicalHistoriesController.cs
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
;l m
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
[   	
HttpPost  	 
(   
$str   7
)  7 8
]  8 9
public!! 
IActionResult!! 
Post!! !
(!!! "
Guid!!" &
medicalHistoryId!!' 7
,!!7 8
[!!9 :
FromBody!!: B
]!!B C 
CreateAppointmentDto!!D X
appointmentDto!!Y g
)!!g h
{"" 	
var## 
medicalHistory## 
=##  

unitOfWork##! +
.##+ ,$
MedicalHistoryRepository##, D
.##D E
Get##E H
(##H I
medicalHistoryId##I Y
)##Y Z
;##Z [
if$$ 
($$ 
medicalHistory$$ 
==$$ !
null$$" &
)$$& '
{%% 
return&& 
NotFound&& 
(&&  
)&&  !
;&&! "
}'' 
var)) 
pet)) 
=)) 

unitOfWork))  
.))  !
PetRepository))! .
.)). /
Get))/ 2
())2 3
appointmentDto))3 A
.))A B
PetId))B G
)))G H
;))H I
if** 
(** 
pet** 
==** 
null** 
)** 
{++ 
return,, 
NotFound,, 
(,,  
),,  !
;,,! "
}-- 
var// 
vet// 
=// 

unitOfWork//  
.//  !
VetRepository//! .
.//. /
Get/// 2
(//2 3
appointmentDto//3 A
.//A B
VetId//B G
)//G H
;//H I
if00 
(00 
vet00 
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
var55 
appointment55 
=55 
Appointment55 )
.55) *
SettleAppointment55* ;
(55; <
vet66 
,66 
pet77 
,77 
appointmentDto88 
.88 
ScheduledDate88 ,
,88, -
appointmentDto99 
.99 &
EstimatedDurationInMinutes99 9
):: 
;:: 
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
}>> 
var@@ 
result@@ 
=@@ 
medicalHistory@@ '
.@@' ((
RegisterAppointmentToHistory@@( D
(@@D E
appointment@@E P
.@@P Q
Entity@@Q W
)@@W X
;@@X Y
ifAA 
(AA 
resultAA 
.AA 
	IsFailureAA  
)AA  !
{BB 
returnCC 

BadRequestCC !
(CC! "
resultCC" (
.CC( )
ErrorCC) .
)CC. /
;CC/ 0
}DD 

unitOfWorkFF 
.FF !
AppointmentRepositoryFF ,
.FF, -
AddFF- 0
(FF0 1
appointmentFF1 <
.FF< =
EntityFF= C
)FFC D
;FFD E

unitOfWorkGG 
.GG 
SaveChangesGG "
(GG" #
)GG# $
;GG$ %
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
,KK* +
ScheduledDateLL 
=LL 
appointmentLL  +
.LL+ ,
EntityLL, 2
.LL2 3
ScheduledDateLL3 @
.LL@ A
ToStringLLA I
(LLI J
)LLJ K
,LLK L&
EstimatedDurationInMinutesMM *
=MM+ ,
appointmentMM- 8
.MM8 9
EntityMM9 ?
.MM? @&
EstimatedDurationInMinutesMM@ Z
,MMZ [
VetIdNN 
=NN 
appointmentNN #
.NN# $
EntityNN$ *
.NN* +
VetIdNN+ 0
,NN0 1
PetIdOO 
=OO 
appointmentOO #
.OO# $
EntityOO$ *
.OO* +
PetIdOO+ 0
,OO0 1
TreatmentIdPP 
=PP 
appointmentPP )
.PP) *
EntityPP* 0
.PP0 1
TreatmentIdPP1 <
,PP< =
MedicalHistoryIdQQ  
=QQ! "
appointmentQQ# .
.QQ. /
EntityQQ/ 5
.QQ5 6
MedicalHistoryIdQQ6 F
}RR 
;RR 
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
returnWW 
CreatedWW 
(WW 
nameofWW !
(WW! "
PostWW" &
)WW& '
,WW' (
fullAppointmentWW) 8
)WW8 9
;WW9 :
}XX 	
}YY 
}ZZ ÏT
òD:\Facultate\Anul_3\.NET\VetAppointment_S12\VetAppointment - APIs + Tests\VetAppointment - Working\VetAppointment.API\Controllers\PetOwnersController.cs
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
;&& 
Response(( 
.(( 
Headers(( 
.(( 
Add((  
(((  !
$str((! ?
,((? @
$str((A g
)((g h
;((h i
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
return++ 
Ok++ 
(++ 
	petOwners++ 
)++  
;++  !
},, 	
[.. 	
HttpPost..	 
].. 
public// 
IActionResult// 
Create// #
(//# $
[//$ %
FromBody//% -
]//- .
CreatePetOwnerDto/// @
petOwnerDto//A L
)//L M
{00 	
var11 
petOwner11 
=11 
PetOwner11 #
.11# $
Create11$ *
(11+ ,
petOwnerDto22 
.22  
Name22  $
,22$ %
petOwnerDto33 
.33  
Surname33  '
,33' (
petOwnerDto44 
.44  
	Birthdate44  )
,44) *
petOwnerDto55 
.55  
Gender55  &
,55& '
petOwnerDto66 
.66  
Address66  '
,66' (
petOwnerDto77 
.77  
Email77  %
,77% &
petOwnerDto88 
.88  
Phone88  %
)99 
;99 
if;; 
(;; 
petOwner;; 
.;; 
	IsFailure;; "
);;" #
{<< 
return== 

BadRequest== !
(==! "
petOwner==" *
.==* +
Error==+ 0
)==0 1
;==1 2
}>> 
petOwnerRepository@@ 
.@@ 
Add@@ "
(@@" #
petOwner@@# +
.@@+ ,
Entity@@, 2
)@@2 3
;@@3 4
petOwnerRepositoryAA 
.AA 
SaveChangesAA *
(AA* +
)AA+ ,
;AA, -
varCC 
fullPetOwnerCC 
=CC 
newCC "
PetOwnerDtoCC# .
(CC. /
)CC/ 0
{DD 
NameEE 
=EE 
petOwnerEE 
.EE  
EntityEE  &
.EE& '
NameEE' +
,EE+ ,
SurnameFF 
=FF 
petOwnerFF "
.FF" #
EntityFF# )
.FF) *
SurnameFF* 1
,FF1 2
AddressGG 
=GG 
petOwnerGG "
.GG" #
EntityGG# )
.GG) *
AddressGG* 1
,GG1 2
	BirthdateHH 
=HH 
petOwnerHH $
.HH$ %
EntityHH% +
.HH+ ,
	BirthdateHH, 5
.HH5 6
ToStringHH6 >
(HH> ?
)HH? @
,HH@ A
EmailII 
=II 
petOwnerII  
.II  !
EntityII! '
.II' (
EmailII( -
,II- .
GenderJJ 
=JJ 
petOwnerJJ !
.JJ! "
EntityJJ" (
.JJ( )
GenderJJ) /
.JJ/ 0
ToStringJJ0 8
(JJ8 9
)JJ9 :
,JJ: ;
PhoneKK 
=KK 
petOwnerKK  
.KK  !
EntityKK! '
.KK' (
PhoneKK( -
,KK- .
IdLL 
=LL 
petOwnerLL 
.LL 
EntityLL $
.LL$ %
IdLL% '
}MM 
;MM 
ResponseOO 
.OO 
HeadersOO 
.OO 
AddOO  
(OO  !
$strOO! ?
,OO? @
$strOOA g
)OOg h
;OOh i
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
returnRR 
CreatedRR 
(RR 
nameofRR !
(RR! "
GetRR" %
)RR% &
,RR& '
fullPetOwnerRR( 4
)RR4 5
;RR5 6
}TT 	
[VV 	
HttpPostVV	 
(VV 
$strVV (
)VV( )
]VV) *
publicWW 
IActionResultWW 
RegisterPetsToOwnerWW 0
(WW0 1
GuidWW1 5
ownerIdWW6 =
,WW= >
[WW? @
FromBodyWW@ H
]WWH I
ListWWJ N
<WWN O
CreatePetDtoWWO [
>WW[ \
petsDtosWW] e
)WWe f
{XX 	
varYY 
ownerYY 
=YY 
petOwnerRepositoryYY *
.YY* +
GetYY+ .
(YY. /
ownerIdYY/ 6
)YY6 7
;YY7 8
ifZZ 
(ZZ 
ownerZZ 
==ZZ 
nullZZ 
)ZZ 
{[[ 
return\\ 
NotFound\\ 
(\\  
)\\  !
;\\! "
}]] 
var__ 
pets__ 
=__ 
petsDtos__ 
.__  
Select__  &
(__& '
p__' (
=>__) +
Pet__, /
.__/ 0
Create__0 6
(__6 7
p__7 8
.__8 9
Name__9 =
,__= >
p__? @
.__@ A
	Birthdate__A J
,__J K
p__L M
.__M N
Race__N R
,__R S
p__T U
.__U V
Gender__V \
)__\ ]
)__] ^
.__^ _
ToList___ e
(__e f
)__f g
;__g h
if`` 
(`` 
pets`` 
.`` 
Any`` 
(`` 
p`` 
=>`` 
p`` 
.`` 
	IsFailure`` (
)``( )
)``) *
{aa 
returnbb 

BadRequestbb !
(bb! "
)bb" #
;bb# $
}dd 
varff 
resultff 
=ff 
ownerff 
.ff 
RegisterPetsToOwnerff 2
(ff2 3
petsff3 7
.ff7 8
Selectff8 >
(ff> ?
pff? @
=>ffA C
pffD E
.ffE F
EntityffF L
)ffL M
.ffM N
ToListffN T
(ffT U
)ffU V
)ffV W
;ffW X
ifhh 
(hh 
resulthh 
.hh 
	IsFailurehh  
)hh  !
{ii 
returnjj 

BadRequestjj !
(jj! "
resultjj" (
.jj( )
Errorjj) .
)jj. /
;jj/ 0
}kk 
petsmm 
.mm 
ForEachmm 
(mm 
pmm 
=>mm 
petRepositorymm +
.mm+ ,
Addmm, /
(mm/ 0
pmm0 1
.mm1 2
Entitymm2 8
)mm8 9
)mm9 :
;mm: ;
petOwnerRepositorynn 
.nn 
SaveChangesnn *
(nn* +
)nn+ ,
;nn, -
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
returnss 
Createdss 
(ss 
nameofss !
(ss! "
Getss" %
)ss% &
,ss& '
ownerss( -
)ss- .
;ss. /
}tt 	
}uu 
}vv √
ìD:\Facultate\Anul_3\.NET\VetAppointment_S12\VetAppointment - APIs + Tests\VetAppointment - Working\VetAppointment.API\Controllers\PetsController.cs
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
; 
Response   
.   
Headers   
.   
Add    
(    !
$str  ! ?
,  ? @
$str  A a
)  a b
;  b c
Response!! 
.!! 
Headers!! 
.!! 
Add!!  
(!!  !
$str!!! ?
,!!? @
$str!!A b
)!!b c
;!!c d
Response"" 
."" 
Headers"" 
."" 
Add""  
(""  !
$str""! >
,""> ?
$str""@ X
)""X Y
;""Y Z
return## 
Ok## 
(## 
pets## 
)## 
;## 
}$$ 	
}%% 
}&& ¡0
ûD:\Facultate\Anul_3\.NET\VetAppointment_S12\VetAppointment - APIs + Tests\VetAppointment - Working\VetAppointment.API\Controllers\PrescribedDrugsController.cs
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
;$$ 
Response&& 
.&& 
Headers&& 
.&& 
Add&&  
(&&  !
$str&&! ?
,&&? @
$str&&A a
)&&a b
;&&b c
Response'' 
.'' 
Headers'' 
.'' 
Add''  
(''  !
$str''! ?
,''? @
$str''A b
)''b c
;''c d
Response(( 
.(( 
Headers(( 
.(( 
Add((  
(((  !
$str((! >
,((> ?
$str((@ X
)((X Y
;((Y Z
return)) 
Ok)) 
()) 
drugs)) 
))) 
;)) 
}** 	
[,, 	
HttpPost,,	 
],, 
public-- 
IActionResult-- 
Create-- #
(--# $
[--$ %
FromBody--% -
]--- .#
CreatePrescribedDrugDto--/ F
drugDto--G N
)--N O
{.. 	
var// 
drug// 
=// 
drugRepository// %
.//% &
Get//& )
(//) *
drugDto//* 1
.//1 2
DrugId//2 8
)//8 9
;//9 :
if00 
(00 
drug00 
==00 
null00 
)00 
{11 
return22 
NotFound22 
(22  
)22  !
;22! "
}33 
var55 
prescribedDrug55 
=55  
PrescribedDrug55! /
.55/ 0
Create550 6
(556 7
drugDto557 >
.55> ?
Quantity55? G
,55G H
drug55I M
)55M N
;55N O
if66 
(66 
prescribedDrug66 
.66 
	IsFailure66 (
)66( )
{77 
return88 

BadRequest88 !
(88! "
prescribedDrug88" 0
.880 1
Error881 6
)886 7
;887 8
}99 $
prescribedDrugRepository;; $
.;;$ %
Add;;% (
(;;( )
prescribedDrug;;) 7
.;;7 8
Entity;;8 >
);;> ?
;;;? @$
prescribedDrugRepository<< $
.<<$ %
SaveChanges<<% 0
(<<0 1
)<<1 2
;<<2 3
var>> 
fullPrescribedDrug>> "
=>># $
new>>% (
PrescribedDrugDto>>) :
{?? 
Id@@ 
=@@ 
prescribedDrug@@ #
.@@# $
Entity@@$ *
.@@* +
Id@@+ -
,@@- .
QuantityAA 
=AA 
prescribedDrugAA )
.AA) *
EntityAA* 0
.AA0 1
QuantityAA1 9
,AA9 :
DrugIdBB 
=BB 
prescribedDrugBB '
.BB' (
EntityBB( .
.BB. /
DrugToPrescribeIdBB/ @
,BB@ A
	TotalCostCC 
=CC 
prescribedDrugCC *
.CC* +
EntityCC+ 1
.CC1 2
	TotalCostCC2 ;
}DD 
;DD 
ResponseFF 
.FF 
HeadersFF 
.FF 
AddFF  
(FF  !
$strFF! ?
,FF? @
$strFFA a
)FFa b
;FFb c
ResponseGG 
.GG 
HeadersGG 
.GG 
AddGG  
(GG  !
$strGG! ?
,GG? @
$strGGA b
)GGb c
;GGc d
ResponseHH 
.HH 
HeadersHH 
.HH 
AddHH  
(HH  !
$strHH! >
,HH> ?
$strHH@ X
)HHX Y
;HHY Z
returnII 
CreatedII 
(II 
nameofII !
(II! "
GetII" %
)II% &
,II& '
fullPrescribedDrugII( :
)II: ;
;II; <
}JJ 	
}KK 
}LL ±ì
ôD:\Facultate\Anul_3\.NET\VetAppointment_S12\VetAppointment - APIs + Tests\VetAppointment - Working\VetAppointment.API\Controllers\TreatmentsController.cs
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
;\ ]
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
( 

treatments  
)  !
;! "
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
CreateTreatmentDto  / A
treatmentDto  B N
)  N O
{!! 	
var"" 
treat"" 
="" 
	Treatment"" !
.""! "
Create""" (
(""( )
treatmentDto"") 5
.""5 6
Description""6 A
)""A B
;""B C
if## 
(## 
treat## 
.## 
	IsFailure## 
)##  
{$$ 
return%% 

BadRequest%% !
(%%! "
treat%%" '
.%%' (
Error%%( -
)%%- .
;%%. /
}&& 

unitOfWork(( 
.(( 
TreatmentRepository(( *
.((* +
Add((+ .
(((. /
treat((/ 4
.((4 5
Entity((5 ;
)((; <
;((< =

unitOfWork)) 
.)) 
SaveChanges)) "
())" #
)))# $
;))$ %
var++ 
fullTreatment++ 
=++ 
new++  #
TreatmentDto++$ 0
(++0 1
)++1 2
{,, 
Id-- 
=-- 
treat-- 
.-- 
Entity-- !
.--! "
Id--" $
,--$ %
Description.. 
=.. 
treat.. #
...# $
Entity..$ *
...* +
Description..+ 6
}// 
;// 
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
,44& '
fullTreatment44( 5
)445 6
;446 7
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
[99 
FromBody99 
]99 
List99 
<99 
PrescribedDrugDto99 -
>99- .
prescribedDrugDtos99/ A
)99A B
{:: 	
var;; 
	treatment;; 
=;; 

unitOfWork;; &
.;;& '
TreatmentRepository;;' :
.;;: ;
Get;;; >
(;;> ?
treatmentId;;? J
);;J K
;;;K L
if<< 
(<< 
	treatment<< 
==<< 
null<< !
)<<! "
{== 
return>> 
NotFound>> 
(>>  
)>>  !
;>>! "
}?? 
varAA 
drugsAA 
=AA 
prescribedDrugDtosAA *
.BB 
SelectBB 
(BB 
dBB 
=>BB 
PrescribedDrugBB +
.BB+ ,
CreateBB, 2
(BB2 3
dBB3 4
.BB4 5
QuantityBB5 =
,BB= >

unitOfWorkBB? I
.BBI J
DrugRepositoryBBJ X
.BBX Y
GetBBY \
(BB\ ]
dBB] ^
.BB^ _
DrugIdBB_ e
)BBe f
)BBf g
)BBh i
.BBi j
ToListBBj p
(BBp q
)BBq r
;BBr s
ifCC 
(CC 
drugsCC 
.CC 
AnyCC 
(CC 
pCC 
=>CC 
pCC  
.CC  !
	IsFailureCC! *
)CC* +
)CC+ ,
{DD 
returnEE 

BadRequestEE !
(EE! "
)EE" #
;EE# $
}FF 
varHH 
resultHH 
=HH 
	treatmentHH "
.HH" #"
AppendDrugsToTreatmentHH# 9
(HH9 :
drugsHH: ?
.HH? @
SelectHH@ F
(HHF G
dHHG H
=>HHI K
dHHL M
.HHM N
EntityHHN T
)HHT U
.HHU V
ToListHHV \
(HH\ ]
)HH] ^
)HH^ _
;HH_ `
ifII 
(II 
resultII 
.II 
	IsFailureII  
)II  !
{JJ 
returnKK 

BadRequestKK !
(KK! "
resultKK" (
.KK( )
ErrorKK) .
)KK. /
;KK/ 0
}LL 
drugsNN 
.NN 
ForEachNN 
(NN 
dNN 
=>NN 

unitOfWorkNN )
.NN) *$
PrescribedDrugRepositoryNN* B
.NNB C
AddNNC F
(NNF G
dNNG H
.NNH I
EntityNNI O
)NNO P
)NNP Q
;NNQ R

unitOfWorkOO 
.OO 
SaveChangesOO "
(OO" #
)OO# $
;OO$ %
ResponseQQ 
.QQ 
HeadersQQ 
.QQ 
AddQQ  
(QQ  !
$strQQ! ?
,QQ? @
$strQQA a
)QQa b
;QQb c
ResponseRR 
.RR 
HeadersRR 
.RR 
AddRR  
(RR  !
$strRR! ?
,RR? @
$strRRA b
)RRb c
;RRc d
ResponseSS 
.SS 
HeadersSS 
.SS 
AddSS  
(SS  !
$strSS! >
,SS> ?
$strSS@ X
)SSX Y
;SSY Z
returnTT 
	NoContentTT 
(TT 
)TT 
;TT 
}UU 	
[WW 	
HttpPutWW	 
(WW 
$strWW %
)WW% &
]WW& '
publicXX 
IActionResultXX 
UpdateTreatmentXX ,
(XX, -
GuidXX- 1
treatmentIdXX2 =
,XX= >
[XX? @
FromBodyXX@ H
]XXH I
CreateTreatmentDtoXXJ \
treatmentDtoXX] i
)XXi j
{YY 	
varZZ 
	treatmentZZ 
=ZZ 

unitOfWorkZZ &
.ZZ& '
TreatmentRepositoryZZ' :
.ZZ: ;
GetZZ; >
(ZZ> ?
treatmentIdZZ? J
)ZZJ K
;ZZK L
if[[ 
([[ 
	treatment[[ 
==[[ 
null[[ !
)[[! "
{\\ 
return]] 
NotFound]] 
(]]  
)]]  !
;]]! "
}^^ 
var`` 
result`` 
=`` 
	treatment`` "
.``" #
UpdateDescription``# 4
(``4 5
treatmentDto``5 A
.``A B
Description``B M
)``M N
;``N O
ifaa 
(aa 
resultaa 
.aa 
	IsFailureaa  
)aa  !
{bb 
returncc 

BadRequestcc !
(cc! "
resultcc" (
.cc( )
Errorcc) .
)cc. /
;cc/ 0
}dd 

unitOfWorkff 
.ff 
TreatmentRepositoryff *
.ff* +
Updateff+ 1
(ff1 2
	treatmentff2 ;
)ff; <
;ff< =

unitOfWorkgg 
.gg 
SaveChangesgg "
(gg" #
)gg# $
;gg$ %
Responseii 
.ii 
Headersii 
.ii 
Addii  
(ii  !
$strii! ?
,ii? @
$striiA a
)iia b
;iib c
Responsejj 
.jj 
Headersjj 
.jj 
Addjj  
(jj  !
$strjj! ?
,jj? @
$strjjA b
)jjb c
;jjc d
Responsekk 
.kk 
Headerskk 
.kk 
Addkk  
(kk  !
$strkk! >
,kk> ?
$strkk@ X
)kkX Y
;kkY Z
returnll 
	NoContentll 
(ll 
)ll 
;ll 
}mm 	
[oo 	
HttpPutoo	 
(oo 
$stroo L
)ooL M
]ooM N
publicpp 
IActionResultpp !
UpdateDrugInTreatmentpp 2
(pp2 3
Guidpp3 7
treatmentIdpp8 C
,ppC D
GuidppE I
prescribedDrugIdppJ Z
,ppZ [
[qq 
FromBodyqq 
]qq 
PrescribedDrugDtoqq (
prescribedDrugDtoqq) :
)qq: ;
{rr 	
varss 
	treatmentss 
=ss 

unitOfWorkss &
.ss& '
TreatmentRepositoryss' :
.ss: ;
Getss; >
(ss> ?
treatmentIdss? J
)ssJ K
;ssK L
iftt 
(tt 
	treatmenttt 
==tt 
nulltt !
)tt! "
{uu 
returnvv 
NotFoundvv 
(vv  
)vv  !
;vv! "
}ww 
varyy 
drugPrescribedyy 
=yy  

unitOfWorkyy! +
.yy+ ,$
PrescribedDrugRepositoryyy, D
.yyD E
GetyyE H
(yyH I
prescribedDrugIdyyI Y
)yyY Z
;yyZ [
ifzz 
(zz 
drugPrescribedzz 
==zz !
nullzz" &
)zz& '
{{{ 
return|| 
NotFound|| 
(||  
)||  !
;||! "
}}} 
var 
drug 
= 

unitOfWork !
.! "
DrugRepository" 0
.0 1
Get1 4
(4 5
prescribedDrugDto5 F
.F G
DrugIdG M
)M N
;N O
if
ÄÄ 
(
ÄÄ 
drug
ÄÄ 
==
ÄÄ 
null
ÄÄ 
)
ÄÄ 
{
ÅÅ 
return
ÇÇ 
NotFound
ÇÇ 
(
ÇÇ  
)
ÇÇ  !
;
ÇÇ! "
}
ÉÉ 
var
ÖÖ 
result
ÖÖ 
=
ÖÖ 
drugPrescribed
ÖÖ '
.
ÖÖ' (
Update
ÖÖ( .
(
ÖÖ. /
prescribedDrugDto
ÖÖ/ @
.
ÖÖ@ A
Quantity
ÖÖA I
,
ÖÖI J
drug
ÖÖK O
)
ÖÖO P
;
ÖÖP Q
if
áá 
(
áá 
result
áá 
.
áá 
	IsFailure
áá  
)
áá  !
{
àà 
return
ââ 

BadRequest
ââ !
(
ââ! "
result
ââ" (
.
ââ( )
Error
ââ) .
)
ââ. /
;
ââ/ 0
}
ää 

unitOfWork
åå 
.
åå &
PrescribedDrugRepository
åå /
.
åå/ 0
Update
åå0 6
(
åå6 7
drugPrescribed
åå7 E
)
ååE F
;
ååF G

unitOfWork
çç 
.
çç 
SaveChanges
çç "
(
çç" #
)
çç# $
;
çç$ %
Response
èè 
.
èè 
Headers
èè 
.
èè 
Add
èè  
(
èè  !
$str
èè! ?
,
èè? @
$str
èèA a
)
èèa b
;
èèb c
Response
êê 
.
êê 
Headers
êê 
.
êê 
Add
êê  
(
êê  !
$str
êê! ?
,
êê? @
$str
êêA b
)
êêb c
;
êêc d
Response
ëë 
.
ëë 
Headers
ëë 
.
ëë 
Add
ëë  
(
ëë  !
$str
ëë! >
,
ëë> ?
$str
ëë@ X
)
ëëX Y
;
ëëY Z
return
íí 
	NoContent
íí 
(
íí 
)
íí 
;
íí 
}
ìì 	
[
ïï 	

HttpDelete
ïï	 
(
ïï 
$str
ïï O
)
ïïO P
]
ïïP Q
public
ññ 
IActionResult
ññ %
RemoveDrugFromTreatment
ññ 4
(
ññ4 5
Guid
ññ5 9
treatmentId
ññ: E
,
ññE F
Guid
ññG K
prescribedDrugId
ññL \
)
ññ\ ]
{
óó 	
var
òò 
	treatment
òò 
=
òò 

unitOfWork
òò &
.
òò& '!
TreatmentRepository
òò' :
.
òò: ;
Get
òò; >
(
òò> ?
treatmentId
òò? J
)
òòJ K
;
òòK L
if
ôô 
(
ôô 
	treatment
ôô 
==
ôô 
null
ôô !
)
ôô! "
{
öö 
return
õõ 
NotFound
õõ 
(
õõ  
)
õõ  !
;
õõ! "
}
úú 
var
ûû 
drug
ûû 
=
ûû 

unitOfWork
ûû !
.
ûû! "&
PrescribedDrugRepository
ûû" :
.
ûû: ;
Get
ûû; >
(
ûû> ?
prescribedDrugId
ûû? O
)
ûûO P
;
ûûP Q
if
üü 
(
üü 
drug
üü 
==
üü 
null
üü 
)
üü 
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
result
§§ 
=
§§ 
	treatment
§§ "
.
§§" #%
RemoveDrugFromTreatment
§§# :
(
§§: ;
drug
§§; ?
)
§§? @
;
§§@ A
if
•• 
(
•• 
result
•• 
.
•• 
	IsFailure
••  
)
••  !
{
¶¶ 
return
ßß 

BadRequest
ßß !
(
ßß! "
result
ßß" (
.
ßß( )
Error
ßß) .
)
ßß. /
;
ßß/ 0
}
®® 

unitOfWork
™™ 
.
™™ &
PrescribedDrugRepository
™™ /
.
™™/ 0
Delete
™™0 6
(
™™6 7
drug
™™7 ;
)
™™; <
;
™™< =

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
[
≥≥ 	

HttpDelete
≥≥	 
(
≥≥ 
$str
≥≥ (
)
≥≥( )
]
≥≥) *
public
¥¥ 
IActionResult
¥¥ 
Delete
¥¥ #
(
¥¥# $
Guid
¥¥$ (
treatmentId
¥¥) 4
)
¥¥4 5
{
µµ 	
var
∂∂ 
	treatment
∂∂ 
=
∂∂ 

unitOfWork
∂∂ &
.
∂∂& '!
TreatmentRepository
∂∂' :
.
∂∂: ;
Get
∂∂; >
(
∂∂> ?
treatmentId
∂∂? J
)
∂∂J K
;
∂∂K L
if
∑∑ 
(
∑∑ 
	treatment
∑∑ 
==
∑∑ 
null
∑∑ !
)
∑∑! "
{
∏∏ 
return
ππ 
NotFound
ππ 
(
ππ  
)
ππ  !
;
ππ! "
}
∫∫ 

unitOfWork
ºº 
.
ºº !
TreatmentRepository
ºº *
.
ºº* +
Delete
ºº+ 1
(
ºº1 2
	treatment
ºº2 ;
)
ºº; <
;
ºº< =

unitOfWork
ΩΩ 
.
ΩΩ 
SaveChanges
ΩΩ "
(
ΩΩ" #
)
ΩΩ# $
;
ΩΩ$ %
Response
øø 
.
øø 
Headers
øø 
.
øø 
Add
øø  
(
øø  !
$str
øø! ?
,
øø? @
$str
øøA a
)
øøa b
;
øøb c
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
¿¿A b
)
¿¿b c
;
¿¿c d
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
¡¡! >
,
¡¡> ?
$str
¡¡@ X
)
¡¡X Y
;
¡¡Y Z
return
¬¬ 
	NoContent
¬¬ 
(
¬¬ 
)
¬¬ 
;
¬¬ 
}
√√ 	
}
≈≈ 
}∆∆ «•
ôD:\Facultate\Anul_3\.NET\VetAppointment_S12\VetAppointment - APIs + Tests\VetAppointment - Working\VetAppointment.API\Controllers\VetClinicsController.cs
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
VetClinicsController %
:& '
ControllerBase( 6
{ 
private 
readonly 
IUnitOfWork $

unitOfWork% /
;/ 0
public  
VetClinicsController #
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
CreateVetClinicDto/ A
vetClinicDtoB N
)N O
{ 	
var 
history 
= 
MedicalHistory (
.( )
Create) /
(/ 0
)0 1
;1 2
var 
	vetClinic 
= 
	VetClinic %
.% &
Create& ,
(, -
vetClinicDto  
.  !
Name! %
,% &
vetClinicDto  
.  !
Address! (
,( )
vetClinicDto  
.  !
NumberOfPlaces! /
,/ 0
vetClinicDto  
.  !
ContactEmail! -
,- .
vetClinicDto  
.  !
ContactPhone! -
) 
; 
if 
( 
	vetClinic 
== 
null !
)! "
{ 
return   

BadRequest   !
(  ! "
)  " #
;  # $
}!! 
history## 
.## 
Entity## 
.## 
AtachToClinic## (
(##( )
	vetClinic##) 2
.##2 3
Entity##3 9
.##9 :
Id##: <
)##< =
;##= >
	vetClinic$$ 
.$$ 
Entity$$ 
.$$  
AttachMedicalHistory$$ 1
($$1 2
history$$2 9
.$$9 :
Entity$$: @
.$$@ A
Id$$A C
)$$C D
;$$D E
if&& 
(&& 
	vetClinic&& 
.&& 
	IsFailure&& #
)&&# $
{'' 
return(( 

BadRequest(( !
(((! "
	vetClinic((" +
.((+ ,
Error((, 1
)((1 2
;((2 3
})) 

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
...8 9
Entity..9 ?
)..? @
;..@ A

unitOfWork// 
.// 
SaveChanges// "
(//" #
)//# $
;//$ %
var11 

fullClinic11 
=11 
new11  
VetClinicDto11! -
{22 
Id33 
=33 
	vetClinic33 
.33 
Entity33 %
.33% &
Id33& (
,33( )
Name44 
=44 
	vetClinic44  
.44  !
Entity44! '
.44' (
Name44( ,
,44, -
Address55 
=55 
	vetClinic55 #
.55# $
Entity55$ *
.55* +
Address55+ 2
,552 3
NumberOfPlaces66 
=66  
	vetClinic66! *
.66* +
Entity66+ 1
.661 2
NumberOfPlaces662 @
,66@ A
ContactEmail77 
=77 
	vetClinic77 (
.77( )
Entity77) /
.77/ 0
ContactEmail770 <
,77< =
ContactPhone88 
=88 
	vetClinic88 (
.88( )
Entity88) /
.88/ 0
ContactPhone880 <
,88< =
RegistrationDate99  
=99! "
	vetClinic99# ,
.99, -
Entity99- 3
.993 4
RegistrationDate994 D
,99D E
MedicalHistoryId::  
=::! "
history::# *
.::* +
Entity::+ 1
.::1 2
Id::2 4
};; 
;;; 
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
(@@! "
GetAllVetClinics@@" 2
)@@2 3
,@@3 4

fullClinic@@5 ?
)@@? @
;@@@ A
}AA 	
[DD 	
HttpGetDD	 
]DD 
publicEE 
IActionResultEE 
GetAllVetClinicsEE -
(EE- .
)EE. /
{FF 	
varGG 

vetClinicsGG 
=GG 

unitOfWorkGG '
.GG' (
VetClinicRepositoryGG( ;
.HH 
AllHH 
(HH 
)HH 
.II 
SelectII 
(II 
vetJJ 
=>JJ 
newJJ 
VetClinicDtoJJ +
(JJ+ ,
)JJ, -
{KK 
IdLL 
=LL 
vetLL  
.LL  !
IdLL! #
,LL# $
NameMM 
=MM 
vetMM "
.MM" #
NameMM# '
,MM' (
AddressNN 
=NN  !
vetNN" %
.NN% &
AddressNN& -
,NN- .
NumberOfPlacesOO &
=OO' (
vetOO) ,
.OO, -
NumberOfPlacesOO- ;
,OO; <
ContactEmailPP $
=PP% &
vetPP' *
.PP* +
ContactEmailPP+ 7
,PP7 8
ContactPhoneQQ $
=QQ% &
vetQQ' *
.QQ* +
ContactPhoneQQ+ 7
,QQ7 8
RegistrationDateRR (
=RR) *
vetRR+ .
.RR. /
RegistrationDateRR/ ?
,RR? @
MedicalHistoryIdSS (
=SS) *
vetSS+ .
.SS. /
MedicalHistoryIdSS/ ?
}TT 
)UU 
;UU 
ResponseWW 
.WW 
HeadersWW 
.WW 
AddWW  
(WW  !
$strWW! ?
,WW? @
$strWWA a
)WWa b
;WWb c
ResponseXX 
.XX 
HeadersXX 
.XX 
AddXX  
(XX  !
$strXX! ?
,XX? @
$strXXA b
)XXb c
;XXc d
ResponseYY 
.YY 
HeadersYY 
.YY 
AddYY  
(YY  !
$strYY! >
,YY> ?
$strYY@ X
)YYX Y
;YYY Z
returnZZ 
OkZZ 
(ZZ 

vetClinicsZZ  
)ZZ  !
;ZZ! "
}[[ 	
[]] 	
HttpGet]]	 
(]] 
$str]] %
)]]% &
]]]& '
public^^ 
IActionResult^^ 
GetById^^ $
(^^$ %
Guid^^% )
vetClinicId^^* 5
)^^5 6
{__ 	
var`` 
clinic`` 
=`` 

unitOfWork`` #
.``# $
VetClinicRepository``$ 7
.``7 8
Get``8 ;
(``; <
vetClinicId``< G
)``G H
;``H I
ifaa 
(aa 
clinicaa 
==aa 
nullaa 
)aa 
{bb 
returncc 
NotFoundcc 
(cc  
)cc  !
;cc! "
}dd 
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
(ii 
clinicii 
)ii 
;ii 
}jj 	
[ll 	
HttpGetll	 
(ll 
$strll *
)ll* +
]ll+ ,
publicmm 
IActionResultmm 
GetVetsByClinicIdmm .
(mm. /
Guidmm/ 3
vetClinicIdmm4 ?
)mm? @
{nn 	
varoo 
clinicoo 
=oo 

unitOfWorkoo #
.oo# $
VetClinicRepositoryoo$ 7
.oo7 8
Getoo8 ;
(oo; <
vetClinicIdoo< G
)ooG H
;ooH I
ifpp 
(pp 
clinicpp 
==pp 
nullpp 
)pp 
{qq 
returnrr 
NotFoundrr 
(rr  
)rr  !
;rr! "
}ss 
varuu 
vetsuu 
=uu 
clinicuu 
.uu 
Vetsuu "
.vv 
Selectvv 
(vv 
vetvv 
=>vv 
newvv "
VetDtovv# )
(vv) *
)vv* +
{ww 
Idxx 
=xx 
vetxx 
.xx 
Idxx 
,xx  
ClinicIdyy 
=yy 
vetyy "
.yy" #
ClinicIdyy# +
,yy+ ,
Namezz 
=zz 
vetzz 
.zz 
Namezz #
,zz# $
Surname{{ 
={{ 
vet{{ !
.{{! "
Surname{{" )
,{{) *
	Birthdate|| 
=|| 
vet||  #
.||# $
	Birthdate||$ -
.||- .
ToString||. 6
(||6 7
)||7 8
,||8 9
Specialisation}} "
=}}# $
vet}}% (
.}}( )
Specialisation}}) 7
.}}7 8
ToString}}8 @
(}}@ A
)}}A B
,}}B C
Email~~ 
=~~ 
vet~~ 
.~~  
Email~~  %
,~~% &
Gender 
= 
vet  
.  !
Gender! '
.' (
ToString( 0
(0 1
)1 2
,2 3
Phone
ÄÄ 
=
ÄÄ 
vet
ÄÄ 
.
ÄÄ  
Phone
ÄÄ  %
,
ÄÄ% &
}
ÅÅ 
)
ÅÅ 
;
ÅÅ 
Response
ÉÉ 
.
ÉÉ 
Headers
ÉÉ 
.
ÉÉ 
Add
ÉÉ  
(
ÉÉ  !
$str
ÉÉ! ?
,
ÉÉ? @
$str
ÉÉA a
)
ÉÉa b
;
ÉÉb c
Response
ÑÑ 
.
ÑÑ 
Headers
ÑÑ 
.
ÑÑ 
Add
ÑÑ  
(
ÑÑ  !
$str
ÑÑ! ?
,
ÑÑ? @
$str
ÑÑA b
)
ÑÑb c
;
ÑÑc d
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
ÖÖ! >
,
ÖÖ> ?
$str
ÖÖ@ X
)
ÖÖX Y
;
ÖÖY Z
return
ÜÜ 
Ok
ÜÜ 
(
ÜÜ 
vets
ÜÜ 
)
ÜÜ 
;
ÜÜ 
}
áá 	
[
ââ 	
HttpGet
ââ	 
(
ââ 
$str
ââ *
)
ââ* +
]
ââ+ ,
public
ää 
IActionResult
ää 
GetPetsByClinicId
ää .
(
ää. /
Guid
ää/ 3
vetClinicId
ää4 ?
)
ää? @
{
ãã 	
var
åå 
clinic
åå 
=
åå 

unitOfWork
åå #
.
åå# $!
VetClinicRepository
åå$ 7
.
åå7 8
Get
åå8 ;
(
åå; <
vetClinicId
åå< G
)
ååG H
;
ååH I
if
çç 
(
çç 
clinic
çç 
==
çç 
null
çç 
)
çç 
{
éé 
return
èè 
NotFound
èè 
(
èè  
)
èè  !
;
èè! "
}
êê 
var
íí 
pets
íí 
=
íí 
clinic
íí 
.
íí 
Pets
íí "
.
ìì 
Select
ìì 
(
ìì 
pet
ìì 
=>
ìì 
new
ìì "
PetDto
ìì# )
(
ìì) *
)
ìì* +
{
îî 
Id
ïï 
=
ïï 
pet
ïï 
.
ïï 
Id
ïï 
,
ïï  
Name
ññ 
=
ññ 
pet
ññ 
.
ññ 
Name
ññ #
,
ññ# $
	Birthdate
óó 
=
óó 
pet
óó  #
.
óó# $
	Birthdate
óó$ -
.
óó- .
ToString
óó. 6
(
óó6 7
)
óó7 8
,
óó8 9
Gender
òò 
=
òò 
pet
òò  
.
òò  !
Gender
òò! '
.
òò' (
ToString
òò( 0
(
òò0 1
)
òò1 2
,
òò2 3
Race
ôô 
=
ôô 
pet
ôô 
.
ôô 
Race
ôô #
.
ôô# $
ToString
ôô$ ,
(
ôô, -
)
ôô- .
,
ôô. /
}
öö 
)
öö 
;
öö 
Response
úú 
.
úú 
Headers
úú 
.
úú 
Add
úú  
(
úú  !
$str
úú! ?
,
úú? @
$str
úúA a
)
úúa b
;
úúb c
Response
ùù 
.
ùù 
Headers
ùù 
.
ùù 
Add
ùù  
(
ùù  !
$str
ùù! ?
,
ùù? @
$str
ùùA b
)
ùùb c
;
ùùc d
Response
ûû 
.
ûû 
Headers
ûû 
.
ûû 
Add
ûû  
(
ûû  !
$str
ûû! >
,
ûû> ?
$str
ûû@ X
)
ûûX Y
;
ûûY Z
return
üü 
Ok
üü 
(
üü 
pets
üü 
)
üü 
;
üü 
}
†† 	
[
¢¢ 	
HttpGet
¢¢	 
(
¢¢ 
$str
¢¢ 2
)
¢¢2 3
]
¢¢3 4
public
££ 
IActionResult
££ '
GetAppointmentsByClinicId
££ 6
(
££6 7
Guid
££7 ;
vetClinicId
££< G
)
££G H
{
§§ 	
var
•• 
clinic
•• 
=
•• 

unitOfWork
•• #
.
••# $!
VetClinicRepository
••$ 7
.
••7 8
Get
••8 ;
(
••; <
vetClinicId
••< G
)
••G H
;
••H I
if
¶¶ 
(
¶¶ 
clinic
¶¶ 
==
¶¶ 
null
¶¶ 
)
¶¶ 
{
ßß 
return
®® 
NotFound
®® 
(
®®  
)
®®  !
;
®®! "
}
©© 
var
´´ 
medicalHistory
´´ 
=
´´  

unitOfWork
´´! +
.
´´+ ,&
MedicalHistoryRepository
´´, D
.
´´D E
Get
´´E H
(
´´H I
clinic
´´I O
.
´´O P
MedicalHistoryId
´´P `
)
´´` a
;
´´a b
var
≠≠ 
appointments
≠≠ 
=
≠≠ 
medicalHistory
≠≠ -
.
≠≠- .
Appointments
≠≠. :
.
ÆÆ 
Select
ÆÆ 
(
ÆÆ 
appointment
ØØ 
=>
ØØ  "
new
ØØ# &
AppointmentDto
ØØ' 5
(
ØØ5 6
)
ØØ6 7
{
∞∞ 
Id
±± 
=
±± 
appointment
±± (
.
±±( )
Id
±±) +
,
±±+ ,(
EstimatedDurationInMinutes
≤≤ 2
=
≤≤3 4
appointment
≤≤5 @
.
≤≤@ A(
EstimatedDurationInMinutes
≤≤A [
,
≤≤[ \
PetId
≥≥ 
=
≥≥ 
appointment
≥≥  +
.
≥≥+ ,
PetId
≥≥, 1
,
≥≥1 2
VetId
¥¥ 
=
¥¥ 
appointment
¥¥  +
.
¥¥+ ,
VetId
¥¥, 1
,
¥¥1 2
ScheduledDate
µµ %
=
µµ& '
appointment
µµ( 3
.
µµ3 4
ScheduledDate
µµ4 A
.
µµA B
ToString
µµB J
(
µµJ K
)
µµK L
,
µµL M
TreatmentId
∂∂ #
=
∂∂$ %
appointment
∂∂& 1
.
∂∂1 2
TreatmentId
∂∂2 =
}
∑∑ 
)
∏∏ 
;
∏∏ 
Response
∫∫ 
.
∫∫ 
Headers
∫∫ 
.
∫∫ 
Add
∫∫  
(
∫∫  !
$str
∫∫! ?
,
∫∫? @
$str
∫∫A a
)
∫∫a b
;
∫∫b c
Response
ªª 
.
ªª 
Headers
ªª 
.
ªª 
Add
ªª  
(
ªª  !
$str
ªª! ?
,
ªª? @
$str
ªªA b
)
ªªb c
;
ªªc d
Response
ºº 
.
ºº 
Headers
ºº 
.
ºº 
Add
ºº  
(
ºº  !
$str
ºº! >
,
ºº> ?
$str
ºº@ X
)
ººX Y
;
ººY Z
return
ΩΩ 
Ok
ΩΩ 
(
ΩΩ 
appointments
ΩΩ "
)
ΩΩ" #
;
ΩΩ# $
}
ææ 	
[
¡¡ 	
HttpPost
¡¡	 
(
¡¡ 
$str
¡¡ +
)
¡¡+ ,
]
¡¡, -
public
¬¬ 
IActionResult
¬¬  
RegisterPetsFamily
¬¬ /
(
¬¬/ 0
Guid
¬¬0 4
vetClinicId
¬¬5 @
,
¬¬@ A
[
¬¬B C
FromBody
¬¬C K
]
¬¬K L
List
¬¬M Q
<
¬¬Q R
CreatePetDto
¬¬R ^
>
¬¬^ _
petsDtos
¬¬` h
)
¬¬h i
{
√√ 	
var
ƒƒ 
clinic
ƒƒ 
=
ƒƒ 

unitOfWork
ƒƒ #
.
ƒƒ# $!
VetClinicRepository
ƒƒ$ 7
.
ƒƒ7 8
Get
ƒƒ8 ;
(
ƒƒ; <
vetClinicId
ƒƒ< G
)
ƒƒG H
;
ƒƒH I
if
≈≈ 
(
≈≈ 
clinic
≈≈ 
==
≈≈ 
null
≈≈ 
)
≈≈ 
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
   
pets
   
=
   
petsDtos
   
.
    
Select
    &
(
  & '
p
  ' (
=>
  ) +
Pet
  , /
.
  / 0
Create
  0 6
(
  6 7
p
  7 8
.
  8 9
Name
  9 =
,
  = >
p
  ? @
.
  @ A
	Birthdate
  A J
,
  J K
p
  L M
.
  M N
Race
  N R
,
  R S
p
  T U
.
  U V
Gender
  V \
)
  \ ]
)
  ] ^
.
  ^ _
ToList
  _ e
(
  e f
)
  f g
;
  g h
if
ÀÀ 
(
ÀÀ 
pets
ÀÀ 
.
ÀÀ 
Any
ÀÀ 
(
ÀÀ 
p
ÀÀ 
=>
ÀÀ 
p
ÀÀ 
.
ÀÀ  
	IsFailure
ÀÀ  )
)
ÀÀ) *
)
ÀÀ* +
{
ÃÃ 
return
ÕÕ 

BadRequest
ÕÕ !
(
ÕÕ! "
)
ÕÕ" #
;
ÕÕ# $
}
ŒŒ 
var
–– 
result
–– 
=
–– 
clinic
–– 
.
––  (
RegisterPetsFamilyToClinic
––  :
(
––: ;
pets
––; ?
.
––? @
Select
––@ F
(
––F G
p
––G H
=>
––I K
p
––L M
.
––M N
Entity
––N T
)
––T U
.
––U V
ToList
––V \
(
––\ ]
)
––] ^
)
––^ _
;
––_ `
if
—— 
(
—— 
result
—— 
.
—— 
	IsFailure
——  
)
——  !
{
““ 
return
”” 

BadRequest
”” !
(
””! "
result
””" (
.
””( )
Error
””) .
)
””. /
;
””/ 0
}
‘‘ 
pets
÷÷ 
.
÷÷ 
ForEach
÷÷ 
(
÷÷ 
p
÷÷ 
=>
÷÷ 

unitOfWork
÷÷ (
.
÷÷( )
PetRepository
÷÷) 6
.
÷÷6 7
Add
÷÷7 :
(
÷÷: ;
p
÷÷; <
.
÷÷< =
Entity
÷÷= C
)
÷÷C D
)
÷÷D E
;
÷÷E F

unitOfWork
◊◊ 
.
◊◊ 
SaveChanges
◊◊ "
(
◊◊" #
)
◊◊# $
;
◊◊$ %
var
⁄⁄ 
createdPets
⁄⁄ 
=
⁄⁄ 
pets
⁄⁄ "
.
⁄⁄" #
Select
⁄⁄# )
(
⁄⁄) *
pet
€€ 
=>
€€ 
new
€€ 
PetDto
€€ !
(
€€! "
)
€€" #
{
‹‹ 
Name
›› 
=
›› 
pet
›› 
.
›› 
Entity
›› %
.
››% &
Name
››& *
,
››* +
	Birthdate
ﬁﬁ 
=
ﬁﬁ 
pet
ﬁﬁ  #
.
ﬁﬁ# $
Entity
ﬁﬁ$ *
.
ﬁﬁ* +
	Birthdate
ﬁﬁ+ 4
.
ﬁﬁ4 5
ToString
ﬁﬁ5 =
(
ﬁﬁ= >
)
ﬁﬁ> ?
,
ﬁﬁ? @
Gender
ﬂﬂ 
=
ﬂﬂ 
pet
ﬂﬂ  
.
ﬂﬂ  !
Entity
ﬂﬂ! '
.
ﬂﬂ' (
Gender
ﬂﬂ( .
.
ﬂﬂ. /
ToString
ﬂﬂ/ 7
(
ﬂﬂ7 8
)
ﬂﬂ8 9
,
ﬂﬂ9 :
Race
‡‡ 
=
‡‡ 
pet
‡‡ 
.
‡‡ 
Entity
‡‡ %
.
‡‡% &
Race
‡‡& *
.
‡‡* +
ToString
‡‡+ 3
(
‡‡3 4
)
‡‡4 5
,
‡‡5 6
Id
·· 
=
·· 
pet
·· 
.
·· 
Entity
·· #
.
··# $
Id
··$ &
,
··& '
}
‚‚ 
)
‚‚ 
;
‚‚ 
Response
‰‰ 
.
‰‰ 
Headers
‰‰ 
.
‰‰ 
Add
‰‰  
(
‰‰  !
$str
‰‰! ?
,
‰‰? @
$str
‰‰A a
)
‰‰a b
;
‰‰b c
Response
ÂÂ 
.
ÂÂ 
Headers
ÂÂ 
.
ÂÂ 
Add
ÂÂ  
(
ÂÂ  !
$str
ÂÂ! ?
,
ÂÂ? @
$str
ÂÂA b
)
ÂÂb c
;
ÂÂc d
Response
ÊÊ 
.
ÊÊ 
Headers
ÊÊ 
.
ÊÊ 
Add
ÊÊ  
(
ÊÊ  !
$str
ÊÊ! >
,
ÊÊ> ?
$str
ÊÊ@ X
)
ÊÊX Y
;
ÊÊY Z
return
ÁÁ 
Created
ÁÁ 
(
ÁÁ 
nameof
ÁÁ !
(
ÁÁ! "
GetPetsByClinicId
ÁÁ" 3
)
ÁÁ3 4
,
ÁÁ4 5
createdPets
ÁÁ6 A
)
ÁÁA B
;
ÁÁB C
}
ËË 	
[
ÍÍ 	
HttpPost
ÍÍ	 
(
ÍÍ 
$str
ÍÍ *
)
ÍÍ* +
]
ÍÍ+ ,
public
ÎÎ 
IActionResult
ÎÎ 
RegisterVet
ÎÎ (
(
ÎÎ( )
Guid
ÎÎ) -
vetClinicId
ÎÎ. 9
,
ÎÎ9 :
[
ÎÎ; <
FromBody
ÎÎ< D
]
ÎÎD E
CreateVetDto
ÎÎF R
vetDto
ÎÎS Y
)
ÎÎY Z
{
ÏÏ 	
var
ÌÌ 
clinic
ÌÌ 
=
ÌÌ 

unitOfWork
ÌÌ #
.
ÌÌ# $!
VetClinicRepository
ÌÌ$ 7
.
ÌÌ7 8
Get
ÌÌ8 ;
(
ÌÌ; <
vetClinicId
ÌÌ< G
)
ÌÌG H
;
ÌÌH I
if
ÓÓ 
(
ÓÓ 
clinic
ÓÓ 
==
ÓÓ 
null
ÓÓ 
)
ÓÓ 
{
ÔÔ 
return
 
NotFound
 
(
  
)
  !
;
! "
}
ÒÒ 
var
ÛÛ 
doctor
ÛÛ 
=
ÛÛ 
Vet
ÛÛ 
.
ÛÛ 
Create
ÛÛ #
(
ÛÛ# $
vetDto
ÛÛ$ *
.
ÛÛ* +
Name
ÛÛ+ /
,
ÛÛ/ 0
vetDto
ÛÛ1 7
.
ÛÛ7 8
Surname
ÛÛ8 ?
,
ÛÛ? @
vetDto
ÛÛA G
.
ÛÛG H
	Birthdate
ÛÛH Q
,
ÛÛQ R
vetDto
ÛÛS Y
.
ÛÛY Z
Gender
ÛÛZ `
,
ÛÛ` a
vetDto
ÛÛb h
.
ÛÛh i
Email
ÛÛi n
,
ÛÛn o
vetDto
ÙÙ 
.
ÙÙ 
Phone
ÙÙ 
,
ÙÙ 
vetDto
ÙÙ $
.
ÙÙ$ %
Specialisation
ÙÙ% 3
)
ÙÙ3 4
;
ÙÙ4 5
if
ıı 
(
ıı 
doctor
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
˜˜! "
)
˜˜" #
;
˜˜# $
}
¯¯ 
var
˙˙ 
result
˙˙ 
=
˙˙ 
clinic
˙˙ 
.
˙˙  !
RegisterVetToClinic
˙˙  3
(
˙˙3 4
doctor
˙˙4 :
.
˙˙: ;
Entity
˙˙; A
)
˙˙A B
;
˙˙B C
if
˚˚ 
(
˚˚ 
result
˚˚ 
.
˚˚ 
	IsFailure
˚˚  
)
˚˚  !
{
¸¸ 
return
˝˝ 

BadRequest
˝˝ !
(
˝˝! "
result
˝˝" (
.
˝˝( )
Error
˝˝) .
)
˝˝. /
;
˝˝/ 0
}
˛˛ 

unitOfWork
ÄÄ 
.
ÄÄ !
VetClinicRepository
ÄÄ *
.
ÄÄ* +
Update
ÄÄ+ 1
(
ÄÄ1 2
clinic
ÄÄ2 8
)
ÄÄ8 9
;
ÄÄ9 :

unitOfWork
ÅÅ 
.
ÅÅ 
VetRepository
ÅÅ $
.
ÅÅ$ %
Add
ÅÅ% (
(
ÅÅ( )
doctor
ÅÅ) /
.
ÅÅ/ 0
Entity
ÅÅ0 6
)
ÅÅ6 7
;
ÅÅ7 8

unitOfWork
ÇÇ 
.
ÇÇ 
SaveChanges
ÇÇ "
(
ÇÇ" #
)
ÇÇ# $
;
ÇÇ$ %
var
ÑÑ 
	createVet
ÑÑ 
=
ÑÑ 
new
ÑÑ 
VetDto
ÑÑ  &
(
ÑÑ& '
)
ÑÑ' (
{
ÖÖ 
Name
ÜÜ 
=
ÜÜ 
doctor
ÜÜ 
.
ÜÜ 
Entity
ÜÜ $
.
ÜÜ$ %
Name
ÜÜ% )
,
ÜÜ) *
Surname
áá 
=
áá 
doctor
áá  
.
áá  !
Entity
áá! '
.
áá' (
Surname
áá( /
,
áá/ 0
Specialisation
àà 
=
àà  
doctor
àà! '
.
àà' (
Entity
àà( .
.
àà. /
Specialisation
àà/ =
.
àà= >
ToString
àà> F
(
ààF G
)
ààG H
,
ààH I
	Birthdate
ââ 
=
ââ 
doctor
ââ "
.
ââ" #
Entity
ââ# )
.
ââ) *
	Birthdate
ââ* 3
.
ââ3 4
ToString
ââ4 <
(
ââ< =
)
ââ= >
,
ââ> ?
Gender
ää 
=
ää 
doctor
ää 
.
ää  
Entity
ää  &
.
ää& '
Gender
ää' -
.
ää- .
ToString
ää. 6
(
ää6 7
)
ää7 8
,
ää8 9
Email
ãã 
=
ãã 
doctor
ãã 
.
ãã 
Entity
ãã %
.
ãã% &
Email
ãã& +
,
ãã+ ,
Phone
åå 
=
åå 
doctor
åå 
.
åå 
Entity
åå %
.
åå% &
Phone
åå& +
,
åå+ ,
Id
çç 
=
çç 
doctor
çç 
.
çç 
Entity
çç "
.
çç" #
Id
çç# %
,
çç% &
}
éé 
;
éé 
Response
êê 
.
êê 
Headers
êê 
.
êê 
Add
êê  
(
êê  !
$str
êê! ?
,
êê? @
$str
êêA a
)
êêa b
;
êêb c
Response
ëë 
.
ëë 
Headers
ëë 
.
ëë 
Add
ëë  
(
ëë  !
$str
ëë! ?
,
ëë? @
$str
ëëA b
)
ëëb c
;
ëëc d
Response
íí 
.
íí 
Headers
íí 
.
íí 
Add
íí  
(
íí  !
$str
íí! >
,
íí> ?
$str
íí@ X
)
ííX Y
;
ííY Z
return
ìì 
Created
ìì 
(
ìì 
nameof
ìì !
(
ìì! "
RegisterVet
ìì" -
)
ìì- .
,
ìì. /
	createVet
ìì0 9
)
ìì9 :
;
ìì: ;
}
îî 	
[
ññ 	
HttpPost
ññ	 
(
ññ 
$str
ññ 2
)
ññ2 3
]
ññ3 4
public
óó 
IActionResult
óó !
RegisterAppointment
óó 0
(
óó0 1
Guid
óó1 5
vetClinicId
óó6 A
,
óóA B
[
óóC D
FromBody
óóD L
]
óóL M"
CreateAppointmentDto
óóN b
appointmentDto
óóc q
)
óóq r
{
òò 	
var
ôô 
clinic
ôô 
=
ôô 

unitOfWork
ôô #
.
ôô# $!
VetClinicRepository
ôô$ 7
.
ôô7 8
Get
ôô8 ;
(
ôô; <
vetClinicId
ôô< G
)
ôôG H
;
ôôH I
if
öö 
(
öö 
clinic
öö 
==
öö 
null
öö 
)
öö 
{
õõ 
return
úú 
NotFound
úú 
(
úú  
)
úú  !
;
úú! "
}
ùù 
var
üü 
medicalHistory
üü 
=
üü  

unitOfWork
üü! +
.
üü+ ,&
MedicalHistoryRepository
üü, D
.
üüD E
Get
üüE H
(
üüH I
clinic
üüI O
.
üüO P
MedicalHistoryId
üüP `
)
üü` a
;
üüa b
var
°° 
pet
°° 
=
°° 

unitOfWork
°°  
.
°°  !
PetRepository
°°! .
.
°°. /
Get
°°/ 2
(
°°2 3
appointmentDto
°°3 A
.
°°A B
PetId
°°B G
)
°°G H
;
°°H I
if
¢¢ 
(
¢¢ 
pet
¢¢ 
==
¢¢ 
null
¢¢ 
)
¢¢ 
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
vet
ßß 
=
ßß 

unitOfWork
ßß  
.
ßß  !
VetRepository
ßß! .
.
ßß. /
Get
ßß/ 2
(
ßß2 3
appointmentDto
ßß3 A
.
ßßA B
VetId
ßßB G
)
ßßG H
;
ßßH I
if
®® 
(
®® 
vet
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
≠≠ 
appointment
≠≠ 
=
≠≠ 
Appointment
≠≠ )
.
≠≠) *
SettleAppointment
≠≠* ;
(
≠≠; <
vet
≠≠< ?
,
≠≠? @
pet
≠≠A D
,
≠≠D E
appointmentDto
≠≠F T
.
≠≠T U
ScheduledDate
≠≠U b
,
≠≠b c
appointmentDto
ÆÆ 
.
ÆÆ (
EstimatedDurationInMinutes
ÆÆ 9
)
ÆÆ9 :
;
ÆÆ: ;
if
ØØ 
(
ØØ 
appointment
ØØ 
.
ØØ 
	IsFailure
ØØ %
)
ØØ% &
{
∞∞ 
return
±± 

BadRequest
±± !
(
±±! "
)
±±" #
;
±±# $
}
≤≤ 
var
¥¥ 
result
¥¥ 
=
¥¥ 
medicalHistory
¥¥ '
.
¥¥' (*
RegisterAppointmentToHistory
¥¥( D
(
¥¥D E
appointment
¥¥E P
.
¥¥P Q
Entity
¥¥Q W
)
¥¥W X
;
¥¥X Y
if
µµ 
(
µµ 
result
µµ 
.
µµ 
	IsFailure
µµ  
)
µµ  !
{
∂∂ 
return
∑∑ 

BadRequest
∑∑ !
(
∑∑! "
result
∑∑" (
.
∑∑( )
Error
∑∑) .
)
∑∑. /
;
∑∑/ 0
}
∏∏ 

unitOfWork
∫∫ 
.
∫∫ &
MedicalHistoryRepository
∫∫ /
.
∫∫/ 0
Update
∫∫0 6
(
∫∫6 7
medicalHistory
∫∫7 E
)
∫∫E F
;
∫∫F G

unitOfWork
ªª 
.
ªª #
AppointmentRepository
ªª ,
.
ªª, -
Add
ªª- 0
(
ªª0 1
appointment
ªª1 <
.
ªª< =
Entity
ªª= C
)
ªªC D
;
ªªD E

unitOfWork
ºº 
.
ºº 
SaveChanges
ºº "
(
ºº" #
)
ºº# $
;
ºº$ %
var
ææ  
createdAppointment
ææ "
=
ææ# $
new
ææ% (
AppointmentDto
ææ) 7
(
ææ7 8
)
ææ8 9
{
øø 
Id
¿¿ 
=
¿¿ 
appointment
¿¿  
.
¿¿  !
Entity
¿¿! '
.
¿¿' (
Id
¿¿( *
,
¿¿* +(
EstimatedDurationInMinutes
¡¡ *
=
¡¡+ ,
appointment
¡¡- 8
.
¡¡8 9
Entity
¡¡9 ?
.
¡¡? @(
EstimatedDurationInMinutes
¡¡@ Z
,
¡¡Z [
PetId
¬¬ 
=
¬¬ 
appointment
¬¬ #
.
¬¬# $
Entity
¬¬$ *
.
¬¬* +
PetId
¬¬+ 0
,
¬¬0 1
VetId
√√ 
=
√√ 
appointment
√√ #
.
√√# $
Entity
√√$ *
.
√√* +
VetId
√√+ 0
,
√√0 1
ScheduledDate
ƒƒ 
=
ƒƒ 
appointment
ƒƒ  +
.
ƒƒ+ ,
Entity
ƒƒ, 2
.
ƒƒ2 3
ScheduledDate
ƒƒ3 @
.
ƒƒ@ A
ToString
ƒƒA I
(
ƒƒI J
)
ƒƒJ K
,
ƒƒK L
TreatmentId
≈≈ 
=
≈≈ 
appointment
≈≈ )
.
≈≈) *
Entity
≈≈* 0
.
≈≈0 1
TreatmentId
≈≈1 <
}
∆∆ 
;
∆∆ 
Response
»» 
.
»» 
Headers
»» 
.
»» 
Add
»»  
(
»»  !
$str
»»! ?
,
»»? @
$str
»»A g
)
»»g h
;
»»h i
Response
…… 
.
…… 
Headers
…… 
.
…… 
Add
……  
(
……  !
$str
……! ?
,
……? @
$str
……A b
)
……b c
;
……c d
Response
   
.
   
Headers
   
.
   
Add
    
(
    !
$str
  ! >
,
  > ?
$str
  @ X
)
  X Y
;
  Y Z
return
ÀÀ 
Created
ÀÀ 
(
ÀÀ 
nameof
ÀÀ !
(
ÀÀ! "!
RegisterAppointment
ÀÀ" 5
)
ÀÀ5 6
,
ÀÀ6 7 
createdAppointment
ÀÀ8 J
)
ÀÀJ K
;
ÀÀK L
}
ÃÃ 	
[
ŒŒ 	
HttpPut
ŒŒ	 
(
ŒŒ 
$str
ŒŒ %
)
ŒŒ% &
]
ŒŒ& '
public
œœ 
IActionResult
œœ 
Update
œœ #
(
œœ# $
Guid
œœ$ (
vetClinicId
œœ) 4
,
œœ4 5
[
œœ6 7
FromBody
œœ7 ?
]
œœ? @ 
CreateVetClinicDto
œœA S
vetClinicDto
œœT `
)
œœ` a
{
–– 	
var
—— 
clinic
—— 
=
—— 

unitOfWork
—— #
.
——# $!
VetClinicRepository
——$ 7
.
——7 8
Get
——8 ;
(
——; <
vetClinicId
——< G
)
——G H
;
——H I
if
““ 
(
““ 
clinic
““ 
==
““ 
null
““ 
)
““ 
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
◊◊ 
result
◊◊ 
=
◊◊ 
clinic
◊◊ 
.
◊◊  
Update
◊◊  &
(
◊◊& '
vetClinicDto
◊◊' 3
.
◊◊3 4
Name
◊◊4 8
,
◊◊8 9
vetClinicDto
◊◊: F
.
◊◊F G
Address
◊◊G N
,
◊◊N O
vetClinicDto
◊◊P \
.
◊◊\ ]
NumberOfPlaces
◊◊] k
,
◊◊k l
vetClinicDto
ÿÿ 
.
ÿÿ 
ContactEmail
ÿÿ )
,
ÿÿ) *
vetClinicDto
ÿÿ+ 7
.
ÿÿ7 8
ContactPhone
ÿÿ8 D
)
ÿÿD E
;
ÿÿE F
if
ŸŸ 
(
ŸŸ 
result
ŸŸ 
.
ŸŸ 
	IsFailure
ŸŸ  
)
ŸŸ  !
{
⁄⁄ 
return
€€ 

BadRequest
€€ !
(
€€! "
result
€€" (
.
€€( )
Error
€€) .
)
€€. /
;
€€/ 0
}
‹‹ 

unitOfWork
ﬁﬁ 
.
ﬁﬁ !
VetClinicRepository
ﬁﬁ *
.
ﬁﬁ* +
Update
ﬁﬁ+ 1
(
ﬁﬁ1 2
result
ﬁﬁ2 8
.
ﬁﬁ8 9
Entity
ﬁﬁ9 ?
)
ﬁﬁ? @
;
ﬁﬁ@ A

unitOfWork
ﬂﬂ 
.
ﬂﬂ 
SaveChanges
ﬂﬂ "
(
ﬂﬂ" #
)
ﬂﬂ# $
;
ﬂﬂ$ %
Response
·· 
.
·· 
Headers
·· 
.
·· 
Add
··  
(
··  !
$str
··! ?
,
··? @
$str
··A g
)
··g h
;
··h i
Response
‚‚ 
.
‚‚ 
Headers
‚‚ 
.
‚‚ 
Add
‚‚  
(
‚‚  !
$str
‚‚! ?
,
‚‚? @
$str
‚‚A b
)
‚‚b c
;
‚‚c d
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
„„! >
,
„„> ?
$str
„„@ X
)
„„X Y
;
„„Y Z
return
‰‰ 
	NoContent
‰‰ 
(
‰‰ 
)
‰‰ 
;
‰‰ 
}
ÂÂ 	
[
ÁÁ 	
HttpPut
ÁÁ	 
(
ÁÁ 
$str
ÁÁ 6
)
ÁÁ6 7
]
ÁÁ7 8
public
ËË 
IActionResult
ËË 
	UpdateVet
ËË &
(
ËË& '
Guid
ËË' +
vetClinicId
ËË, 7
,
ËË7 8
Guid
ËË9 =
vetId
ËË> C
,
ËËC D
[
ËËE F
FromBody
ËËF N
]
ËËN O
VetDto
ËËP V
vetDto
ËËW ]
)
ËË] ^
{
ÈÈ 	
var
ÍÍ 
clinic
ÍÍ 
=
ÍÍ 

unitOfWork
ÍÍ #
.
ÍÍ# $!
VetClinicRepository
ÍÍ$ 7
.
ÍÍ7 8
Get
ÍÍ8 ;
(
ÍÍ; <
vetClinicId
ÍÍ< G
)
ÍÍG H
;
ÍÍH I
if
ÎÎ 
(
ÎÎ 
clinic
ÎÎ 
==
ÎÎ 
null
ÎÎ 
)
ÎÎ 
{
ÏÏ 
return
ÌÌ 
NotFound
ÌÌ 
(
ÌÌ  
)
ÌÌ  !
;
ÌÌ! "
}
ÓÓ 
var
 
vet
 
=
 

unitOfWork
  
.
  !
VetRepository
! .
.
. /
Get
/ 2
(
2 3
vetId
3 8
)
8 9
;
9 :
if
ÒÒ 
(
ÒÒ 
vet
ÒÒ 
==
ÒÒ 
null
ÒÒ 
)
ÒÒ 
{
ÚÚ 
return
ÛÛ 
NotFound
ÛÛ 
(
ÛÛ  
)
ÛÛ  !
;
ÛÛ! "
}
ÙÙ 
var
ˆˆ 
result
ˆˆ 
=
ˆˆ 
vet
ˆˆ 
.
ˆˆ 
Update
ˆˆ #
(
ˆˆ# $
vetDto
ˆˆ$ *
.
ˆˆ* +
Name
ˆˆ+ /
,
ˆˆ/ 0
vetDto
ˆˆ1 7
.
ˆˆ7 8
Surname
ˆˆ8 ?
,
ˆˆ? @
vetDto
ˆˆA G
.
ˆˆG H
	Birthdate
ˆˆH Q
,
ˆˆQ R
vetDto
ˆˆS Y
.
ˆˆY Z
Gender
ˆˆZ `
,
ˆˆ` a
vetDto
ˆˆb h
.
ˆˆh i
Email
ˆˆi n
,
ˆˆn o
vetDto
˜˜ 
.
˜˜ 
Phone
˜˜ 
,
˜˜ 
vetDto
˜˜ $
.
˜˜$ %
Specialisation
˜˜% 3
)
˜˜3 4
;
˜˜4 5
if
¯¯ 
(
¯¯ 
result
¯¯ 
.
¯¯ 
	IsFailure
¯¯  
)
¯¯  !
{
˘˘ 
return
˙˙ 

BadRequest
˙˙ !
(
˙˙! "
result
˙˙" (
.
˙˙( )
Error
˙˙) .
)
˙˙. /
;
˙˙/ 0
}
˚˚ 

unitOfWork
˝˝ 
.
˝˝ 
VetRepository
˝˝ $
.
˝˝$ %
Update
˝˝% +
(
˝˝+ ,
vet
˝˝, /
)
˝˝/ 0
;
˝˝0 1

unitOfWork
˛˛ 
.
˛˛ 
SaveChanges
˛˛ "
(
˛˛" #
)
˛˛# $
;
˛˛$ %
Response
ÄÄ 
.
ÄÄ 
Headers
ÄÄ 
.
ÄÄ 
Add
ÄÄ  
(
ÄÄ  !
$str
ÄÄ! ?
,
ÄÄ? @
$str
ÄÄA g
)
ÄÄg h
;
ÄÄh i
Response
ÅÅ 
.
ÅÅ 
Headers
ÅÅ 
.
ÅÅ 
Add
ÅÅ  
(
ÅÅ  !
$str
ÅÅ! ?
,
ÅÅ? @
$str
ÅÅA b
)
ÅÅb c
;
ÅÅc d
Response
ÇÇ 
.
ÇÇ 
Headers
ÇÇ 
.
ÇÇ 
Add
ÇÇ  
(
ÇÇ  !
$str
ÇÇ! >
,
ÇÇ> ?
$str
ÇÇ@ X
)
ÇÇX Y
;
ÇÇY Z
return
ÉÉ 
	NoContent
ÉÉ 
(
ÉÉ 
)
ÉÉ 
;
ÉÉ 
}
ÑÑ 	
[
ÜÜ 	
HttpPut
ÜÜ	 
(
ÜÜ 
$str
ÜÜ 6
)
ÜÜ6 7
]
ÜÜ7 8
public
áá 
IActionResult
áá 
	UpdatePet
áá &
(
áá& '
Guid
áá' +
vetClinicId
áá, 7
,
áá7 8
Guid
áá9 =
petId
áá> C
,
ááC D
[
ááE F
FromBody
ááF N
]
ááN O
PetDto
ááP V
petDto
ááW ]
)
áá] ^
{
àà 	
var
ââ 
clinic
ââ 
=
ââ 

unitOfWork
ââ #
.
ââ# $!
VetClinicRepository
ââ$ 7
.
ââ7 8
Get
ââ8 ;
(
ââ; <
vetClinicId
ââ< G
)
ââG H
;
ââH I
if
ää 
(
ää 
clinic
ää 
==
ää 
null
ää 
)
ää 
{
ãã 
return
åå 
NotFound
åå 
(
åå  
)
åå  !
;
åå! "
}
çç 
var
èè 
pet
èè 
=
èè 

unitOfWork
èè  
.
èè  !
PetRepository
èè! .
.
èè. /
Get
èè/ 2
(
èè2 3
petId
èè3 8
)
èè8 9
;
èè9 :
if
êê 
(
êê 
pet
êê 
==
êê 
null
êê 
)
êê 
{
ëë 
return
íí 
NotFound
íí 
(
íí  
)
íí  !
;
íí! "
}
ìì 
var
ïï 
result
ïï 
=
ïï 
pet
ïï 
.
ïï 
Update
ïï #
(
ïï# $
petDto
ïï$ *
.
ïï* +
Name
ïï+ /
,
ïï/ 0
petDto
ïï1 7
.
ïï7 8
	Birthdate
ïï8 A
,
ïïA B
petDto
ïïC I
.
ïïI J
Race
ïïJ N
,
ïïN O
petDto
ïïP V
.
ïïV W
Gender
ïïW ]
)
ïï] ^
;
ïï^ _
if
ññ 
(
ññ 
result
ññ 
.
ññ 
	IsFailure
ññ  
)
ññ  !
{
óó 
return
òò 

BadRequest
òò !
(
òò! "
result
òò" (
.
òò( )
Error
òò) .
)
òò. /
;
òò/ 0
}
ôô 

unitOfWork
õõ 
.
õõ 
PetRepository
õõ $
.
õõ$ %
Update
õõ% +
(
õõ+ ,
pet
õõ, /
)
õõ/ 0
;
õõ0 1

unitOfWork
úú 
.
úú 
SaveChanges
úú "
(
úú" #
)
úú# $
;
úú$ %
Response
ûû 
.
ûû 
Headers
ûû 
.
ûû 
Add
ûû  
(
ûû  !
$str
ûû! ?
,
ûû? @
$str
ûûA a
)
ûûa b
;
ûûb c
Response
üü 
.
üü 
Headers
üü 
.
üü 
Add
üü  
(
üü  !
$str
üü! ?
,
üü? @
$str
üüA b
)
üüb c
;
üüc d
Response
†† 
.
†† 
Headers
†† 
.
†† 
Add
††  
(
††  !
$str
††! >
,
††> ?
$str
††@ X
)
††X Y
;
††Y Z
return
°° 
	NoContent
°° 
(
°° 
)
°° 
;
°° 
}
¢¢ 	
[
§§ 	

HttpDelete
§§	 
(
§§ 
$str
§§ (
)
§§( )
]
§§) *
public
•• 
IActionResult
•• 
Delete
•• #
(
••# $
Guid
••$ (
vetClinicId
••) 4
)
••4 5
{
¶¶ 	
var
ßß 
	vetClinic
ßß 
=
ßß 

unitOfWork
ßß &
.
ßß& '!
VetClinicRepository
ßß' :
.
ßß: ;
Get
ßß; >
(
ßß> ?
vetClinicId
ßß? J
)
ßßJ K
;
ßßK L
if
®® 
(
®® 
	vetClinic
®® 
==
®® 
null
®® !
)
®®! "
{
©© 
return
™™ 
NotFound
™™ 
(
™™  
)
™™  !
;
™™! "
}
´´ 
var
≠≠ 
medicalHistorys
≠≠ 
=
≠≠  !

unitOfWork
≠≠" ,
.
≠≠, -&
MedicalHistoryRepository
≠≠- E
.
≠≠E F
All
≠≠F I
(
≠≠I J
)
≠≠J K
.
≠≠K L
Where
≠≠L Q
(
≠≠Q R
m
≠≠R S
=>
≠≠T V
m
≠≠W X
.
≠≠X Y
ClinicId
≠≠Y a
==
≠≠b d
vetClinicId
≠≠e p
)
≠≠p q
;
≠≠q r
if
ÆÆ 
(
ÆÆ 
medicalHistorys
ÆÆ 
!=
ÆÆ  "
null
ÆÆ# '
)
ÆÆ' (
{
ØØ 
foreach
∞∞ 
(
∞∞ 
var
∞∞ 
item
∞∞ !
in
∞∞" $
medicalHistorys
∞∞% 4
)
∞∞4 5
{
±± 

unitOfWork
≤≤ 
.
≤≤ &
MedicalHistoryRepository
≤≤ 7
.
≤≤7 8
Delete
≤≤8 >
(
≤≤> ?
item
≤≤? C
)
≤≤C D
;
≤≤D E
}
≥≥ 
}
¥¥ 
var
∂∂ 
vets
∂∂ 
=
∂∂ 

unitOfWork
∂∂ !
.
∂∂! "
VetRepository
∂∂" /
.
∂∂/ 0
All
∂∂0 3
(
∂∂3 4
)
∂∂4 5
.
∂∂5 6
Where
∂∂6 ;
(
∂∂; <
v
∂∂< =
=>
∂∂> @
v
∂∂A B
.
∂∂B C
ClinicId
∂∂C K
==
∂∂L N
vetClinicId
∂∂O Z
)
∂∂Z [
;
∂∂[ \
if
∑∑ 
(
∑∑ 
vets
∑∑ 
!=
∑∑ 
null
∑∑ 
)
∑∑ 
{
∏∏ 
foreach
ππ 
(
ππ 
var
ππ 
item
ππ !
in
ππ" $
vets
ππ% )
)
ππ) *
{
∫∫ 

unitOfWork
ªª 
.
ªª 
VetRepository
ªª ,
.
ªª, -
Delete
ªª- 3
(
ªª3 4
item
ªª4 8
)
ªª8 9
;
ªª9 :
}
ºº 
}
ΩΩ 
var
øø 
pets
øø 
=
øø 

unitOfWork
øø !
.
øø! "
PetRepository
øø" /
.
øø/ 0
All
øø0 3
(
øø3 4
)
øø4 5
.
øø5 6
Where
øø6 ;
(
øø; <
p
øø< =
=>
øø> @
p
øøA B
.
øøB C
ClinicId
øøC K
==
øøL N
vetClinicId
øøO Z
)
øøZ [
;
øø[ \
if
¿¿ 
(
¿¿ 
pets
¿¿ 
!=
¿¿ 
null
¿¿ 
)
¿¿ 
{
¡¡ 
foreach
¬¬ 
(
¬¬ 
var
¬¬ 
item
¬¬ !
in
¬¬" $
pets
¬¬% )
)
¬¬) *
{
√√ 

unitOfWork
ƒƒ 
.
ƒƒ 
PetRepository
ƒƒ ,
.
ƒƒ, -
Delete
ƒƒ- 3
(
ƒƒ3 4
item
ƒƒ4 8
)
ƒƒ8 9
;
ƒƒ9 :
}
≈≈ 
}
∆∆ 

unitOfWork
»» 
.
»» !
VetClinicRepository
»» *
.
»»* +
Delete
»»+ 1
(
»»1 2
	vetClinic
»»2 ;
)
»»; <
;
»»< =

unitOfWork
…… 
.
…… 
SaveChanges
…… "
(
……" #
)
……# $
;
……$ %
Response
ÀÀ 
.
ÀÀ 
Headers
ÀÀ 
.
ÀÀ 
Add
ÀÀ  
(
ÀÀ  !
$str
ÀÀ! ?
,
ÀÀ? @
$str
ÀÀA a
)
ÀÀa b
;
ÀÀb c
Response
ÃÃ 
.
ÃÃ 
Headers
ÃÃ 
.
ÃÃ 
Add
ÃÃ  
(
ÃÃ  !
$str
ÃÃ! >
,
ÃÃ> ?
$str
ÃÃ@ X
)
ÃÃX Y
;
ÃÃY Z
Response
ÕÕ 
.
ÕÕ 
Headers
ÕÕ 
.
ÕÕ 
Add
ÕÕ  
(
ÕÕ  !
$str
ÕÕ! ?
,
ÕÕ? @
$str
ÕÕA b
)
ÕÕb c
;
ÕÕc d
return
ŒŒ 
	NoContent
ŒŒ 
(
ŒŒ 
)
ŒŒ 
;
ŒŒ 
}
œœ 	
[
—— 	

HttpDelete
——	 
(
—— 
$str
—— 9
)
——9 :
]
——: ;
public
““ 
IActionResult
““ 
	DeleteVet
““ &
(
““& '
Guid
““' +
vetClinicId
““, 7
,
““7 8
Guid
““9 =
vetId
““> C
)
““C D
{
”” 	
var
‘‘ 
clinic
‘‘ 
=
‘‘ 

unitOfWork
‘‘ #
.
‘‘# $!
VetClinicRepository
‘‘$ 7
.
‘‘7 8
Get
‘‘8 ;
(
‘‘; <
vetClinicId
‘‘< G
)
‘‘G H
;
‘‘H I
if
’’ 
(
’’ 
clinic
’’ 
==
’’ 
null
’’ 
)
’’ 
{
÷÷ 
return
◊◊ 
NotFound
◊◊ 
(
◊◊  
)
◊◊  !
;
◊◊! "
}
ÿÿ 
var
⁄⁄ 
vet
⁄⁄ 
=
⁄⁄ 

unitOfWork
⁄⁄  
.
⁄⁄  !
VetRepository
⁄⁄! .
.
⁄⁄. /
Get
⁄⁄/ 2
(
⁄⁄2 3
vetId
⁄⁄3 8
)
⁄⁄8 9
;
⁄⁄9 :
if
€€ 
(
€€ 
vet
€€ 
==
€€ 
null
€€ 
)
€€ 
{
‹‹ 
return
›› 
NotFound
›› 
(
››  
)
››  !
;
››! "
}
ﬁﬁ 

unitOfWork
‡‡ 
.
‡‡ 
VetRepository
‡‡ $
.
‡‡$ %
Delete
‡‡% +
(
‡‡+ ,
vet
‡‡, /
)
‡‡/ 0
;
‡‡0 1

unitOfWork
·· 
.
·· 
SaveChanges
·· "
(
··" #
)
··# $
;
··$ %
Response
„„ 
.
„„ 
Headers
„„ 
.
„„ 
Add
„„  
(
„„  !
$str
„„! ?
,
„„? @
$str
„„A a
)
„„a b
;
„„b c
Response
‰‰ 
.
‰‰ 
Headers
‰‰ 
.
‰‰ 
Add
‰‰  
(
‰‰  !
$str
‰‰! ?
,
‰‰? @
$str
‰‰A b
)
‰‰b c
;
‰‰c d
Response
ÂÂ 
.
ÂÂ 
Headers
ÂÂ 
.
ÂÂ 
Add
ÂÂ  
(
ÂÂ  !
$str
ÂÂ! >
,
ÂÂ> ?
$str
ÂÂ@ X
)
ÂÂX Y
;
ÂÂY Z
return
ÊÊ 
	NoContent
ÊÊ 
(
ÊÊ 
)
ÊÊ 
;
ÊÊ 
}
ÁÁ 	
[
ÈÈ 	

HttpDelete
ÈÈ	 
(
ÈÈ 
$str
ÈÈ 9
)
ÈÈ9 :
]
ÈÈ: ;
public
ÍÍ 
IActionResult
ÍÍ 
	DeletePet
ÍÍ &
(
ÍÍ& '
Guid
ÍÍ' +
vetClinicId
ÍÍ, 7
,
ÍÍ7 8
Guid
ÍÍ9 =
petId
ÍÍ> C
)
ÍÍC D
{
ÎÎ 	
var
ÏÏ 
clinic
ÏÏ 
=
ÏÏ 

unitOfWork
ÏÏ #
.
ÏÏ# $!
VetClinicRepository
ÏÏ$ 7
.
ÏÏ7 8
Get
ÏÏ8 ;
(
ÏÏ; <
vetClinicId
ÏÏ< G
)
ÏÏG H
;
ÏÏH I
if
ÌÌ 
(
ÌÌ 
clinic
ÌÌ 
==
ÌÌ 
null
ÌÌ 
)
ÌÌ 
{
ÓÓ 
return
ÔÔ 
NotFound
ÔÔ 
(
ÔÔ  
)
ÔÔ  !
;
ÔÔ! "
}
 
var
ÚÚ 
pet
ÚÚ 
=
ÚÚ 

unitOfWork
ÚÚ  
.
ÚÚ  !
PetRepository
ÚÚ! .
.
ÚÚ. /
Get
ÚÚ/ 2
(
ÚÚ2 3
petId
ÚÚ3 8
)
ÚÚ8 9
;
ÚÚ9 :
if
ÛÛ 
(
ÛÛ 
pet
ÛÛ 
==
ÛÛ 
null
ÛÛ 
)
ÛÛ 
{
ÙÙ 
return
ıı 
NotFound
ıı 
(
ıı  
)
ıı  !
;
ıı! "
}
ˆˆ 

unitOfWork
¯¯ 
.
¯¯ 
PetRepository
¯¯ $
.
¯¯$ %
Delete
¯¯% +
(
¯¯+ ,
pet
¯¯, /
)
¯¯/ 0
;
¯¯0 1

unitOfWork
˘˘ 
.
˘˘ 
SaveChanges
˘˘ "
(
˘˘" #
)
˘˘# $
;
˘˘$ %
Response
˚˚ 
.
˚˚ 
Headers
˚˚ 
.
˚˚ 
Add
˚˚  
(
˚˚  !
$str
˚˚! ?
,
˚˚? @
$str
˚˚A a
)
˚˚a b
;
˚˚b c
Response
¸¸ 
.
¸¸ 
Headers
¸¸ 
.
¸¸ 
Add
¸¸  
(
¸¸  !
$str
¸¸! ?
,
¸¸? @
$str
¸¸A b
)
¸¸b c
;
¸¸c d
Response
˝˝ 
.
˝˝ 
Headers
˝˝ 
.
˝˝ 
Add
˝˝  
(
˝˝  !
$str
˝˝! >
,
˝˝> ?
$str
˝˝@ X
)
˝˝X Y
;
˝˝Y Z
return
˛˛ 
	NoContent
˛˛ 
(
˛˛ 
)
˛˛ 
;
˛˛ 
}
ˇˇ 	
}
ÄÄ 
}ÅÅ Î6
ìD:\Facultate\Anul_3\.NET\VetAppointment_S12\VetAppointment - APIs + Tests\VetAppointment - Working\VetAppointment.API\Controllers\VetsController.cs
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
;"" 
Response$$ 
.$$ 
Headers$$ 
.$$ 
Add$$  
($$  !
$str$$! ?
,$$? @
$str$$A a
)$$a b
;$$b c
Response%% 
.%% 
Headers%% 
.%% 
Add%%  
(%%  !
$str%%! ?
,%%? @
$str%%A b
)%%b c
;%%c d
Response&& 
.&& 
Headers&& 
.&& 
Add&&  
(&&  !
$str&&! >
,&&> ?
$str&&@ X
)&&X Y
;&&Y Z
return'' 
Ok'' 
('' 
vets'' 
)'' 
;'' 
}(( 	
[** 	
HttpPost**	 
]** 
public++ 
IActionResult++ 
Create++ #
(++# $
[++$ %
FromBody++% -
]++- .
CreateVetDto++/ ;
vetDto++< B
)++B C
{,, 	
var-- 
vet-- 
=-- 
Vet-- 
.-- 
Create--  
(--  !
vetDto.. 
... 
Name.. 
,..  
vetDto// 
.// 
Surname// "
,//" #
vetDto00 
.00 
	Birthdate00 $
,00$ %
vetDto11 
.11 
Gender11 !
,11! "
vetDto22 
.22 
Email22  
,22  !
vetDto33 
.33 
Phone33  
,33  !
vetDto44 
.44 
Specialisation44 )
)55 
;55 
if77 
(77 
vet77 
.77 
	IsFailure77 
)77 
{88 
return99 

BadRequest99 !
(99! "
vet99" %
.99% &
Error99& +
)99+ ,
;99, -
}:: 
vetRepository<< 
.<< 
Add<< 
(<< 
vet<< !
.<<! "
Entity<<" (
)<<( )
;<<) *
vetRepository== 
.== 
SaveChanges== %
(==% &
)==& '
;==' (
var?? 
fullVet?? 
=?? 
new?? 
VetDto?? $
(??$ %
)??% &
{@@ 
IdAA 
=AA 
vetAA 
.AA 
EntityAA 
.AA  
IdAA  "
,AA" #
ClinicIdBB 
=BB 
vetBB 
.BB 
EntityBB %
.BB% &
ClinicIdBB& .
,BB. /
NameCC 
=CC 
vetCC 
.CC 
EntityCC !
.CC! "
NameCC" &
,CC& '
SurnameDD 
=DD 
vetDD 
.DD 
EntityDD $
.DD$ %
SurnameDD% ,
,DD, -
	BirthdateEE 
=EE 
vetEE 
.EE  
EntityEE  &
.EE& '
	BirthdateEE' 0
.EE0 1
ToStringEE1 9
(EE9 :
)EE: ;
,EE; <
GenderFF 
=FF 
vetFF 
.FF 
EntityFF #
.FF# $
GenderFF$ *
.FF* +
ToStringFF+ 3
(FF3 4
)FF4 5
,FF5 6
EmailGG 
=GG 
vetGG 
.GG 
EntityGG "
.GG" #
EmailGG# (
,GG( )
PhoneHH 
=HH 
vetHH 
.HH 
EntityHH "
.HH" #
PhoneHH# (
,HH( )
SpecialisationII 
=II  
vetII! $
.II$ %
EntityII% +
.II+ ,
SpecialisationII, :
.II: ;
ToStringII; C
(IIC D
)IID E
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
(OO! "
GetOO" %
)OO% &
,OO& '
fullVetOO( /
)OO/ 0
;OO0 1
}PP 	
}QQ 
}RR ¡
åD:\Facultate\Anul_3\.NET\VetAppointment_S12\VetAppointment - APIs + Tests\VetAppointment - Working\VetAppointment.API\Dtos\AppointmentDto.cs
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
}		 Î

ôD:\Facultate\Anul_3\.NET\VetAppointment_S12\VetAppointment - APIs + Tests\VetAppointment - Working\VetAppointment.API\Dtos\Create\CreateAppointmentDto.cs
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
} ı
íD:\Facultate\Anul_3\.NET\VetAppointment_S12\VetAppointment - APIs + Tests\VetAppointment - Working\VetAppointment.API\Dtos\Create\CreateDrugDto.cs
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
 â
ëD:\Facultate\Anul_3\.NET\VetAppointment_S12\VetAppointment - APIs + Tests\VetAppointment - Working\VetAppointment.API\Dtos\Create\CreatePetDto.cs
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
} „
ñD:\Facultate\Anul_3\.NET\VetAppointment_S12\VetAppointment - APIs + Tests\VetAppointment - Working\VetAppointment.API\Dtos\Create\CreatePetOwnerDto.cs
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
} â
úD:\Facultate\Anul_3\.NET\VetAppointment_S12\VetAppointment - APIs + Tests\VetAppointment - Working\VetAppointment.API\Dtos\Create\CreatePrescribedDrugDto.cs
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
}		 Õ
óD:\Facultate\Anul_3\.NET\VetAppointment_S12\VetAppointment - APIs + Tests\VetAppointment - Working\VetAppointment.API\Dtos\Create\CreateTreatmentDto.cs
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
} ¿	
óD:\Facultate\Anul_3\.NET\VetAppointment_S12\VetAppointment - APIs + Tests\VetAppointment - Working\VetAppointment.API\Dtos\Create\CreateVetClinicDto.cs
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
} ‡
ëD:\Facultate\Anul_3\.NET\VetAppointment_S12\VetAppointment - APIs + Tests\VetAppointment - Working\VetAppointment.API\Dtos\Create\CreateVetDto.cs
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
} ¨
ÖD:\Facultate\Anul_3\.NET\VetAppointment_S12\VetAppointment - APIs + Tests\VetAppointment - Working\VetAppointment.API\Dtos\DrugDto.cs
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
 ∞
èD:\Facultate\Anul_3\.NET\VetAppointment_S12\VetAppointment - APIs + Tests\VetAppointment - Working\VetAppointment.API\Dtos\MedicalHistoryDto.cs
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
} ©
ÑD:\Facultate\Anul_3\.NET\VetAppointment_S12\VetAppointment - APIs + Tests\VetAppointment - Working\VetAppointment.API\Dtos\PetDto.cs
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
}		 ∏
âD:\Facultate\Anul_3\.NET\VetAppointment_S12\VetAppointment - APIs + Tests\VetAppointment - Working\VetAppointment.API\Dtos\PetOwnerDto.cs
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
}		  
èD:\Facultate\Anul_3\.NET\VetAppointment_S12\VetAppointment - APIs + Tests\VetAppointment - Working\VetAppointment.API\Dtos\PrescribedDrugDto.cs
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
}		 ª
äD:\Facultate\Anul_3\.NET\VetAppointment_S12\VetAppointment - APIs + Tests\VetAppointment - Working\VetAppointment.API\Dtos\TreatmentDto.cs
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
}		 É
äD:\Facultate\Anul_3\.NET\VetAppointment_S12\VetAppointment - APIs + Tests\VetAppointment - Working\VetAppointment.API\Dtos\VetClinicDto.cs
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
} √
ÑD:\Facultate\Anul_3\.NET\VetAppointment_S12\VetAppointment - APIs + Tests\VetAppointment - Working\VetAppointment.API\Dtos\VetDto.cs
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
} ¬7
ÄD:\Facultate\Anul_3\.NET\VetAppointment_S12\VetAppointment - APIs + Tests\VetAppointment - Working\VetAppointment.API\Program.cs
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
builder 
. 
Services 
. 
AddDbContext 
< 
DatabaseContext -
>- .
(. /
options 
=> 
options 
. 
	UseSqlite  
(  !
builder 
. 
Configuration 
. 
GetConnectionString 1
(1 2
$str2 E
)E F
,F G
b 	
=>
 
b 
. 
MigrationsAssembly !
(! "
typeof" (
(( )
DatabaseContext) 8
)8 9
.9 :
Assembly: B
.B C
FullNameC K
)K L
) 	
) 
; 
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
.335 6
WithMethods44 
(44 
$str44 
,44 
$str44 !
,44! "
$str44# (
,44( )
$str44* 2
)442 3
.443 4
WithHeaders444 ?
(44? @
$str44@ N
,44N O
$str44P b
)44b c
;44c d
}55 
)55 
;55 
options77 
.77 
	AddPolicy77 
(77 
name77 
:77 
$str77 )
,77) *
builder77+ 2
=>773 5
{88 
builder99 
.99 
WithOrigins99 
(99 
$str99 4
)994 5
.995 6
WithMethods:: 
(:: 
$str:: 
,:: 
$str:: !
,::! "
$str::# (
,::( )
$str::* 2
)::2 3
.::3 4
WithHeaders::4 ?
(::? @
$str::@ N
,::N O
$str::P b
)::b c
;::c d
};; 
);; 
;;; 
}<< 
)<< 
;<< 
builder>> 
.>> 
Services>> 
.>> 
AddControllers>> 
(>>  
)>>  !
;>>! "
var@@ 
app@@ 
=@@ 	
builder@@
 
.@@ 
Build@@ 
(@@ 
)@@ 
;@@ 
ifCC 
(CC 
appCC 
.CC 
EnvironmentCC 
.CC 
IsDevelopmentCC !
(CC! "
)CC" #
)CC# $
{DD 
appEE 
.EE 

UseSwaggerEE 
(EE 
)EE 
;EE 
appFF 
.FF 
UseSwaggerUIFF 
(FF 
)FF 
;FF 
}GG 
appII 
.II 
UseHttpsRedirectionII 
(II 
)II 
;II 
appJJ 
.JJ 
UseCorsJJ 
(JJ 
$strJJ 
)JJ 
;JJ 
appLL 
.LL 
UseAuthorizationLL 
(LL 
)LL 
;LL 
appNN 
.NN 
MapControllersNN 
(NN 
)NN 
;NN 
appPP 
.PP 
RunPP 
(PP 
)PP 	
;PP	 
