�}
UD:\10.12.2022\VetAppointment\VetAppointment.API\Controllers\AppointmentsController.cs
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
.H I
ResultI O
;O P
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
.H I
ResultI O
;O P
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
.''[ \
Result''\ b
;''b c
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
.--b c
Result--c i
;--i j
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
ResultTTF L
.TTL M
SelectTTM S
(TTS T
appointmentTTT _
=>TT` b
newTTc f
AppointmentDtoTTg u
(TTu v
)TTv w
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
.hhF G
ResulthhG M
;hhM N
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
}�� �M
ND:\10.12.2022\VetAppointment\VetAppointment.API\Controllers\DrugsController.cs
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
Result- 3
.3 4
Select4 :
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
{'' 	
var(( 
drug(( 
=(( 
drugRepository(( %
.((% &
Get((& )
((() *
drugId((* 0
)((0 1
.((1 2
Result((2 8
;((8 9
if** 
(** 
drug** 
==** 
null** 
)** 
{++ 
return,, 
NotFound,, 
(,,  
),,  !
;,,! "
}-- 
var// 
drugDto// 
=// 
new// 
DrugDto// %
{00 
Id11 
=11 
drug11 
.11 
Id11 
,11 
Name22 
=22 
drug22 
.22 
Name22  
,22  !
Quantity33 
=33 
drug33 
.33  
Quantity33  (
,33( )
	UnitPrice44 
=44 
drug44  
.44  !
	UnitPrice44! *
}55 
;55 
Response77 
.77 
Headers77 
.77 
Add77  
(77  !
$str77! ?
,77? @
$str77A a
)77a b
;77b c
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
return:: 
Ok:: 
(:: 
drugDto:: 
):: 
;:: 
};; 	
[== 	
HttpPost==	 
]== 
public>> 
IActionResult>> 
Create>> #
(>># $
[>>$ %
FromBody>>% -
]>>- .
CreateDrugDto>>/ <
drugDto>>= D
)>>D E
{?? 	
var@@ 
drug@@ 
=@@ 
Drug@@ 
.@@ 
Create@@ "
(@@" #
drugDtoAA 
.AA 
NameAA  
,AA  !
drugDtoBB 
.BB 
QuantityBB $
,BB$ %
drugDtoCC 
.CC 
	UnitPriceCC %
)DD 
;DD 
ifFF 
(FF 
drugFF 
.FF 
	IsFailureFF 
)FF 
{GG 
returnHH 

BadRequestHH !
(HH! "
drugHH" &
.HH& '
ErrorHH' ,
)HH, -
;HH- .
}II 
drugRepositoryKK 
.KK 
AddKK 
(KK 
drugKK #
.KK# $
EntityKK$ *
)KK* +
;KK+ ,
drugRepositoryLL 
.LL 
SaveChangesLL &
(LL& '
)LL' (
;LL( )
ResponseNN 
.NN 
HeadersNN 
.NN 
AddNN  
(NN  !
$strNN! ?
,NN? @
$strNNA a
)NNa b
;NNb c
ResponseOO 
.OO 
HeadersOO 
.OO 
AddOO  
(OO  !
$strOO! ?
,OO? @
$strOOA b
)OOb c
;OOc d
ResponsePP 
.PP 
HeadersPP 
.PP 
AddPP  
(PP  !
$strPP! >
,PP> ?
$strPP@ X
)PPX Y
;PPY Z
returnQQ 
CreatedQQ 
(QQ 
nameofQQ !
(QQ! "
GetQQ" %
)QQ% &
,QQ& '
drugQQ( ,
.QQ, -
EntityQQ- 3
)QQ3 4
;QQ4 5
}RR 	
[TT 	

HttpDeleteTT	 
(TT 
$strTT #
)TT# $
]TT$ %
publicUU 
IActionResultUU 
DeleteUU #
(UU# $
GuidUU$ (
drugIdUU) /
)UU/ 0
{VV 	
varWW 
drugWW 
=WW 
drugRepositoryWW %
.WW% &
GetWW& )
(WW) *
drugIdWW* 0
)WW0 1
.WW1 2
ResultWW2 8
;WW8 9
ifXX 
(XX 
drugXX 
==XX 
nullXX 
)XX 
{YY 
returnZZ 
NotFoundZZ 
(ZZ  
)ZZ  !
;ZZ! "
}[[ 
drugRepository]] 
.]] 
Delete]] !
(]]! "
drug]]" &
)]]& '
;]]' (
drugRepository^^ 
.^^ 
SaveChanges^^ &
(^^& '
)^^' (
;^^( )
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
(cc 
)cc 
;cc 
}dd 	
[ff 	
HttpPutff	 
(ff 
$strff  
)ff  !
]ff! "
publicgg 
IActionResultgg 
Updategg #
(gg# $
Guidgg$ (
drugIdgg) /
,gg/ 0
[gg1 2
FromBodygg2 :
]gg: ;
CreateDrugDtogg< I
drugDtoggJ Q
)ggQ R
{hh 	
varii 
drugii 
=ii 
drugRepositoryii %
.ii% &
Getii& )
(ii) *
drugIdii* 0
)ii0 1
.ii1 2
Resultii2 8
;ii8 9
ifjj 
(jj 
drugjj 
==jj 
nulljj 
)jj 
{kk 
returnll 
NotFoundll 
(ll  
)ll  !
;ll! "
}mm 
drugoo 
.oo 
Updateoo 
(oo 
drugDtooo 
.oo  
Nameoo  $
,oo$ %
drugDtooo& -
.oo- .
Quantityoo. 6
,oo6 7
drugDtooo8 ?
.oo? @
	UnitPriceoo@ I
)ooI J
;ooJ K
drugRepositoryqq 
.qq 
Updateqq !
(qq! "
drugqq" &
)qq& '
;qq' (
drugRepositoryrr 
.rr 
SaveChangesrr &
(rr& '
)rr' (
;rr( )
Responsett 
.tt 
Headerstt 
.tt 
Addtt  
(tt  !
$strtt! ?
,tt? @
$strttA a
)tta b
;ttb c
Responseuu 
.uu 
Headersuu 
.uu 
Adduu  
(uu  !
$struu! ?
,uu? @
$struuA b
)uub c
;uuc d
Responsevv 
.vv 
Headersvv 
.vv 
Addvv  
(vv  !
$strvv! >
,vv> ?
$strvv@ X
)vvX Y
;vvY Z
returnww 
Okww 
(ww 
drugww 
)ww 
;ww 
}xx 	
}yy 
}zz �=
YD:\10.12.2022\VetAppointment\VetAppointment.API\Controllers\MedicalHistoriesController.cs
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
class &
MedicalHistoriesController +
:, -
ControllerBase. <
{ 
private 
readonly 
IUnitOfWork $

unitOfWork% /
;/ 0
public &
MedicalHistoriesController )
() *
IUnitOfWork* 5

unitOfWork6 @
)@ A
=>B D
thisE I
.I J

unitOfWorkJ T
=U V

unitOfWorkW a
;a b
[ 	
HttpGet	 
] 
public 
IActionResult 
Get  
(  !
)! "
{ 	
var 
medicalHistories  
=! "

unitOfWork# -
.- .$
MedicalHistoryRepository. F
. 
All 
( 
) 
. 
Result 
. 
Select 
( 
history  
=>! #
new$ '
MedicalHistoryDto( 9
{: ;
Id< >
=? @
historyA H
.H I
IdI K
,K L
ClinicIdM U
=V W
historyX _
._ `
ClinicId` h
}i j
)k l
;l m
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
return 
Ok 
( 
medicalHistories &
)& '
;' (
} 	
[ 	
HttpPost	 
( 
$str 7
)7 8
]8 9
public   
IActionResult   
Post   !
(  ! "
Guid  " &
medicalHistoryId  ' 7
,  7 8
[  9 :
FromBody  : B
]  B C 
CreateAppointmentDto  D X
appointmentDto  Y g
)  g h
{!! 	
var"" 
medicalHistory"" 
=""  

unitOfWork""! +
.""+ ,$
MedicalHistoryRepository"", D
.""D E
Get""E H
(""H I
medicalHistoryId""I Y
)""Y Z
.""Z [
Result""[ a
;""a b
if## 
(## 
medicalHistory## 
==## !
null##" &
)##& '
{$$ 
return%% 
NotFound%% 
(%%  
)%%  !
;%%! "
}&& 
var(( 
pet(( 
=(( 

unitOfWork((  
.((  !
PetRepository((! .
.((. /
Get((/ 2
(((2 3
appointmentDto((3 A
.((A B
PetId((B G
)((G H
.((H I
Result((I O
;((O P
if)) 
()) 
pet)) 
==)) 
null)) 
))) 
{** 
return++ 
NotFound++ 
(++  
)++  !
;++! "
},, 
var.. 
vet.. 
=.. 

unitOfWork..  
...  !
VetRepository..! .
.... /
Get../ 2
(..2 3
appointmentDto..3 A
...A B
VetId..B G
)..G H
...H I
Result..I O
;..O P
if// 
(// 
vet// 
==// 
null// 
)// 
{00 
return11 
NotFound11 
(11  
)11  !
;11! "
}22 
var44 
appointment44 
=44 
Appointment44 )
.44) *
SettleAppointment44* ;
(44; <
vet55 
,55 
pet66 
,66 
appointmentDto77 
.77 
ScheduledDate77 ,
,77, -
appointmentDto88 
.88 &
EstimatedDurationInMinutes88 9
)99 
;99 
if:: 
(:: 
appointment:: 
.:: 
	IsFailure:: %
)::% &
{;; 
return<< 

BadRequest<< !
(<<! "
appointment<<" -
.<<- .
Error<<. 3
)<<3 4
;<<4 5
}== 
var?? 
result?? 
=?? 
medicalHistory?? '
.??' ((
RegisterAppointmentToHistory??( D
(??D E
appointment??E P
.??P Q
Entity??Q W
)??W X
;??X Y
if@@ 
(@@ 
result@@ 
.@@ 
	IsFailure@@  
)@@  !
{AA 
returnBB 

BadRequestBB !
(BB! "
resultBB" (
.BB( )
ErrorBB) .
)BB. /
;BB/ 0
}CC 

unitOfWorkEE 
.EE !
AppointmentRepositoryEE ,
.EE, -
AddEE- 0
(EE0 1
appointmentEE1 <
.EE< =
EntityEE= C
)EEC D
;EED E

unitOfWorkFF 
.FF 
SaveChangesFF "
(FF" #
)FF# $
;FF$ %
varHH 
fullAppointmentHH 
=HH  !
newHH" %
AppointmentDtoHH& 4
{II 
IdJJ 
=JJ 
appointmentJJ  
.JJ  !
EntityJJ! '
.JJ' (
IdJJ( *
,JJ* +
ScheduledDateKK 
=KK 
appointmentKK  +
.KK+ ,
EntityKK, 2
.KK2 3
ScheduledDateKK3 @
.KK@ A
ToStringKKA I
(KKI J
)KKJ K
,KKK L&
EstimatedDurationInMinutesLL *
=LL+ ,
appointmentLL- 8
.LL8 9
EntityLL9 ?
.LL? @&
EstimatedDurationInMinutesLL@ Z
,LLZ [
VetIdMM 
=MM 
appointmentMM #
.MM# $
EntityMM$ *
.MM* +
VetIdMM+ 0
,MM0 1
PetIdNN 
=NN 
appointmentNN #
.NN# $
EntityNN$ *
.NN* +
PetIdNN+ 0
,NN0 1
TreatmentIdOO 
=OO 
appointmentOO )
.OO) *
EntityOO* 0
.OO0 1
TreatmentIdOO1 <
,OO< =
MedicalHistoryIdPP  
=PP! "
appointmentPP# .
.PP. /
EntityPP/ 5
.PP5 6
MedicalHistoryIdPP6 F
}QQ 
;QQ 
ResponseSS 
.SS 
HeadersSS 
.SS 
AddSS  
(SS  !
$strSS! ?
,SS? @
$strSSA a
)SSa b
;SSb c
ResponseTT 
.TT 
HeadersTT 
.TT 
AddTT  
(TT  !
$strTT! ?
,TT? @
$strTTA b
)TTb c
;TTc d
ResponseUU 
.UU 
HeadersUU 
.UU 
AddUU  
(UU  !
$strUU! >
,UU> ?
$strUU@ X
)UUX Y
;UUY Z
returnVV 
CreatedVV 
(VV 
nameofVV !
(VV! "
PostVV" &
)VV& '
,VV' (
fullAppointmentVV) 8
)VV8 9
;VV9 :
}WW 	
}XX 
}YY �T
RD:\10.12.2022\VetAppointment\VetAppointment.API\Controllers\PetOwnersController.cs
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
. 
Result 
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
.YY7 8
ResultYY8 >
;YY> ?
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
}vv �
MD:\10.12.2022\VetAppointment\VetAppointment.API\Controllers\PetsController.cs
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
. 
Result 
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
}&& �0
XD:\10.12.2022\VetAppointment\VetAppointment.API\Controllers\PrescribedDrugsController.cs
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
. 
Result 
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
.//9 :
Result//: @
;//@ A
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
}LL ȕ
SD:\10.12.2022\VetAppointment\VetAppointment.API\Controllers\TreatmentsController.cs
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
IUnitOfWork $

unitOfWork% /
;/ 0
public  
TreatmentsController #
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
[ 	
HttpGet	 
] 
public 
IActionResult 
Get  
(  !
)! "
{ 	
var 

treatments 
= 

unitOfWork '
.' (
TreatmentRepository( ;
. 
All 
( 
) 
. 
Result 
. 
Select 
( 
t 
=> 
new "
TreatmentDto# /
{0 1
Id2 4
=5 6
t7 8
.8 9
Id9 ;
,; <
Description= H
=I J
tK L
.L M
DescriptionM X
}Y Z
)[ \
;\ ]
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
( 

treatments  
)  !
;! "
} 	
[ 	
HttpPost	 
] 
public 
IActionResult 
Create #
(# $
[$ %
FromBody% -
]- .
CreateTreatmentDto/ A
treatmentDtoB N
)N O
{   	
var!! 
treat!! 
=!! 
	Treatment!! !
.!!! "
Create!!" (
(!!( )
treatmentDto!!) 5
.!!5 6
Description!!6 A
)!!A B
;!!B C
if"" 
("" 
treat"" 
."" 
	IsFailure"" 
)""  
{## 
return$$ 

BadRequest$$ !
($$! "
treat$$" '
.$$' (
Error$$( -
)$$- .
;$$. /
}%% 

unitOfWork'' 
.'' 
TreatmentRepository'' *
.''* +
Add''+ .
(''. /
treat''/ 4
.''4 5
Entity''5 ;
)''; <
;''< =

unitOfWork(( 
.(( 
SaveChanges(( "
(((" #
)((# $
;(($ %
var** 
fullTreatment** 
=** 
new**  #
TreatmentDto**$ 0
(**0 1
)**1 2
{++ 
Id,, 
=,, 
treat,, 
.,, 
Entity,, !
.,,! "
Id,," $
,,,$ %
Description-- 
=-- 
treat-- #
.--# $
Entity--$ *
.--* +
Description--+ 6
}.. 
;.. 
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
return33 
Created33 
(33 
nameof33 !
(33! "
Get33" %
)33% &
,33& '
fullTreatment33( 5
)335 6
;336 7
}44 	
[66 	
HttpPost66	 
(66 
$str66 6
)666 7
]667 8
public77 
IActionResult77 
AddDrugsToTreatment77 0
(770 1
Guid771 5
treatmentId776 A
,77A B
[88 
FromBody88 
]88 
List88 
<88 
PrescribedDrugDto88 -
>88- .
prescribedDrugDtos88/ A
)88A B
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
}>> 
var@@ 
drugs@@ 
=@@ 
prescribedDrugDtos@@ *
.AA 
SelectAA 
(AA 
dAA 
=>AA 
PrescribedDrugAA +
.AA+ ,
CreateAA, 2
(AA2 3
dAA3 4
.AA4 5
QuantityAA5 =
,AA= >

unitOfWorkAA? I
.AAI J
DrugRepositoryAAJ X
.AAX Y
GetAAY \
(AA\ ]
dAA] ^
.AA^ _
DrugIdAA_ e
)AAe f
.AAf g
ResultAAg m
)AAm n
)AAo p
.AAp q
ToListAAq w
(AAw x
)AAx y
;AAy z
ifBB 
(BB 
drugsBB 
.BB 
AnyBB 
(BB 
pBB 
=>BB 
pBB  
.BB  !
	IsFailureBB! *
)BB* +
)BB+ ,
{CC 
returnDD 

BadRequestDD !
(DD! "
)DD" #
;DD# $
}EE 
varGG 
resultGG 
=GG 
	treatmentGG "
.GG" #"
AppendDrugsToTreatmentGG# 9
(GG9 :
drugsGG: ?
.GG? @
SelectGG@ F
(GGF G
dGGG H
=>GGI K
dGGL M
.GGM N
EntityGGN T
)GGT U
.GGU V
ToListGGV \
(GG\ ]
)GG] ^
)GG^ _
;GG_ `
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
}KK 
drugsMM 
.MM 
ForEachMM 
(MM 
dMM 
=>MM 

unitOfWorkMM )
.MM) *$
PrescribedDrugRepositoryMM* B
.MMB C
AddMMC F
(MMF G
dMMG H
.MMH I
EntityMMI O
)MMO P
)MMP Q
;MMQ R

unitOfWorkNN 
.NN 
SaveChangesNN "
(NN" #
)NN# $
;NN$ %
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
returnSS 
	NoContentSS 
(SS 
)SS 
;SS 
}TT 	
[VV 	
HttpPutVV	 
(VV 
$strVV %
)VV% &
]VV& '
publicWW 
IActionResultWW 
UpdateTreatmentWW ,
(WW, -
GuidWW- 1
treatmentIdWW2 =
,WW= >
[WW? @
FromBodyWW@ H
]WWH I
CreateTreatmentDtoWWJ \
treatmentDtoWW] i
)WWi j
{XX 	
varYY 
	treatmentYY 
=YY 

unitOfWorkYY &
.YY& '
TreatmentRepositoryYY' :
.YY: ;
GetYY; >
(YY> ?
treatmentIdYY? J
)YYJ K
.YYK L
ResultYYL R
;YYR S
ifZZ 
(ZZ 
	treatmentZZ 
==ZZ 
nullZZ !
)ZZ! "
{[[ 
return\\ 
NotFound\\ 
(\\  
)\\  !
;\\! "
}]] 
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
}cc 

unitOfWorkee 
.ee 
TreatmentRepositoryee *
.ee* +
Updateee+ 1
(ee1 2
	treatmentee2 ;
)ee; <
;ee< =

unitOfWorkff 
.ff 
SaveChangesff "
(ff" #
)ff# $
;ff$ %
Responsehh 
.hh 
Headershh 
.hh 
Addhh  
(hh  !
$strhh! ?
,hh? @
$strhhA a
)hha b
;hhb c
Responseii 
.ii 
Headersii 
.ii 
Addii  
(ii  !
$strii! ?
,ii? @
$striiA b
)iib c
;iic d
Responsejj 
.jj 
Headersjj 
.jj 
Addjj  
(jj  !
$strjj! >
,jj> ?
$strjj@ X
)jjX Y
;jjY Z
returnkk 
	NoContentkk 
(kk 
)kk 
;kk 
}ll 	
[nn 	
HttpPutnn	 
(nn 
$strnn L
)nnL M
]nnM N
publicoo 
IActionResultoo !
UpdateDrugInTreatmentoo 2
(oo2 3
Guidoo3 7
treatmentIdoo8 C
,ooC D
GuidooE I
prescribedDrugIdooJ Z
,ooZ [
[pp 
FromBodypp 
]pp 
PrescribedDrugDtopp (
prescribedDrugDtopp) :
)pp: ;
{qq 	
varrr 
	treatmentrr 
=rr 

unitOfWorkrr &
.rr& '
TreatmentRepositoryrr' :
.rr: ;
Getrr; >
(rr> ?
treatmentIdrr? J
)rrJ K
.rrK L
ResultrrL R
;rrR S
ifss 
(ss 
	treatmentss 
==ss 
nullss !
)ss! "
{tt 
returnuu 
NotFounduu 
(uu  
)uu  !
;uu! "
}vv 
varxx 
drugPrescribedxx 
=xx  

unitOfWorkxx! +
.xx+ ,$
PrescribedDrugRepositoryxx, D
.xxD E
GetxxE H
(xxH I
prescribedDrugIdxxI Y
)xxY Z
.xxZ [
Resultxx[ a
;xxa b
ifyy 
(yy 
drugPrescribedyy 
==yy !
nullyy" &
)yy& '
{zz 
return{{ 
NotFound{{ 
({{  
){{  !
;{{! "
}|| 
var~~ 
drug~~ 
=~~ 

unitOfWork~~ !
.~~! "
DrugRepository~~" 0
.~~0 1
Get~~1 4
(~~4 5
prescribedDrugDto~~5 F
.~~F G
DrugId~~G M
)~~M N
.~~N O
Result~~O U
;~~U V
if 
( 
drug 
== 
null 
) 
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
}�� ��
SD:\10.12.2022\VetAppointment\VetAppointment.API\Controllers\VetClinicsController.cs
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
;:: 
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
(??! "
GetAllVetClinics??" 2
)??2 3
,??3 4

fullClinic??5 ?
)??? @
;??@ A
}@@ 	
[CC 	
HttpGetCC	 
]CC 
publicDD 
IActionResultDD 
GetAllVetClinicsDD -
(DD- .
)DD. /
{EE 	
varFF 

vetClinicsFF 
=FF 

unitOfWorkFF '
.FF' (
VetClinicRepositoryFF( ;
.GG 
AllGG 
(GG 
)GG 
.GG 
ResultGG 
.HH 
SelectHH 
(HH 
vetII 
=>II 
newII 
VetClinicDtoII +
(II+ ,
)II, -
{JJ 
IdKK 
=KK 
vetKK  
.KK  !
IdKK! #
,KK# $
NameLL 
=LL 
vetLL "
.LL" #
NameLL# '
,LL' (
AddressMM 
=MM  !
vetMM" %
.MM% &
AddressMM& -
,MM- .
NumberOfPlacesNN &
=NN' (
vetNN) ,
.NN, -
NumberOfPlacesNN- ;
,NN; <
ContactEmailOO $
=OO% &
vetOO' *
.OO* +
ContactEmailOO+ 7
,OO7 8
ContactPhonePP $
=PP% &
vetPP' *
.PP* +
ContactPhonePP+ 7
,PP7 8
RegistrationDateQQ (
=QQ) *
vetQQ+ .
.QQ. /
RegistrationDateQQ/ ?
,QQ? @
MedicalHistoryIdRR (
=RR) *
vetRR+ .
.RR. /
MedicalHistoryIdRR/ ?
}SS 
)TT 
;TT 
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
(YY 

vetClinicsYY  
)YY  !
;YY! "
}ZZ 	
[\\ 	
HttpGet\\	 
(\\ 
$str\\ %
)\\% &
]\\& '
public]] 
IActionResult]] 
GetById]] $
(]]$ %
Guid]]% )
vetClinicId]]* 5
)]]5 6
{^^ 	
var__ 
clinic__ 
=__ 

unitOfWork__ #
.__# $
VetClinicRepository__$ 7
.__7 8
Get__8 ;
(__; <
vetClinicId__< G
)__G H
.__H I
Result__I O
;__O P
if`` 
(`` 
clinic`` 
==`` 
null`` 
)`` 
{aa 
returnbb 
NotFoundbb 
(bb  
)bb  !
;bb! "
}cc 
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
(hh 
clinichh 
)hh 
;hh 
}ii 	
[kk 	
HttpGetkk	 
(kk 
$strkk *
)kk* +
]kk+ ,
publicll 
IActionResultll 
GetVetsByClinicIdll .
(ll. /
Guidll/ 3
vetClinicIdll4 ?
)ll? @
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
vartt 
vetstt 
=tt 
clinictt 
.tt 
Vetstt "
.uu 
Selectuu 
(uu 
vetuu 
=>uu 
newuu "
VetDtouu# )
(uu) *
)uu* +
{vv 
Idww 
=ww 
vetww 
.ww 
Idww 
,ww  
ClinicIdxx 
=xx 
vetxx "
.xx" #
ClinicIdxx# +
,xx+ ,
Nameyy 
=yy 
vetyy 
.yy 
Nameyy #
,yy# $
Surnamezz 
=zz 
vetzz !
.zz! "
Surnamezz" )
,zz) *
	Birthdate{{ 
={{ 
vet{{  #
.{{# $
	Birthdate{{$ -
.{{- .
ToString{{. 6
({{6 7
){{7 8
,{{8 9
Specialisation|| "
=||# $
vet||% (
.||( )
Specialisation||) 7
.||7 8
ToString||8 @
(||@ A
)||A B
,||B C
Email}} 
=}} 
vet}} 
.}}  
Email}}  %
,}}% &
Gender~~ 
=~~ 
vet~~  
.~~  !
Gender~~! '
.~~' (
ToString~~( 0
(~~0 1
)~~1 2
,~~2 3
Phone 
= 
vet 
.  
Phone  %
,% &
}
�� 
)
�� 
;
�� 
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
�� 
vets
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
�� 
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
�� 
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
�� 
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
�� 
.
�� 
VetRepository
�� $
.
��$ %
Add
��% (
(
��( )
doctor
��) /
.
��/ 0
Entity
��0 6
)
��6 7
;
��7 8

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
�� 
doctor
�� 
.
�� 
Entity
�� $
.
��$ %
Name
��% )
,
��) *
Surname
�� 
=
�� 
doctor
��  
.
��  !
Entity
��! '
.
��' (
Surname
��( /
,
��/ 0
Specialisation
�� 
=
��  
doctor
��! '
.
��' (
Entity
��( .
.
��. /
Specialisation
��/ =
.
��= >
ToString
��> F
(
��F G
)
��G H
,
��H I
	Birthdate
�� 
=
�� 
doctor
�� "
.
��" #
Entity
��# )
.
��) *
	Birthdate
��* 3
.
��3 4
ToString
��4 <
(
��< =
)
��= >
,
��> ?
Gender
�� 
=
�� 
doctor
�� 
.
��  
Entity
��  &
.
��& '
Gender
��' -
.
��- .
ToString
��. 6
(
��6 7
)
��7 8
,
��8 9
Email
�� 
=
�� 
doctor
�� 
.
�� 
Entity
�� %
.
��% &
Email
��& +
,
��+ ,
Phone
�� 
=
�� 
doctor
�� 
.
�� 
Entity
�� %
.
��% &
Phone
��& +
,
��+ ,
Id
�� 
=
�� 
doctor
�� 
.
�� 
Entity
�� "
.
��" #
Id
��# %
,
��% &
}
�� 
;
�� 
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
�� 
Created
�� 
(
�� 
nameof
�� !
(
��! "
RegisterVet
��" -
)
��- .
,
��. /
	createVet
��0 9
)
��9 :
;
��: ;
}
�� 	
[
�� 	
HttpPost
��	 
(
�� 
$str
�� 2
)
��2 3
]
��3 4
public
�� 
IActionResult
�� !
RegisterAppointment
�� 0
(
��0 1
Guid
��1 5
vetClinicId
��6 A
,
��A B
[
��C D
FromBody
��D L
]
��L M"
CreateAppointmentDto
��N b
appointmentDto
��c q
)
��q r
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
.
��a b
Result
��b h
;
��h i
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
.
��H I
Result
��I O
;
��O P
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
.
��H I
Result
��I O
;
��O P
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
�� 
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
�� 	
HttpPut
��	 
(
�� 
$str
�� 6
)
��6 7
]
��7 8
public
�� 
IActionResult
�� 
	UpdatePet
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
,
��C D
[
��E F
FromBody
��F N
]
��N O
PetDto
��P V
petDto
��W ]
)
��] ^
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
�� 
var
�� 
result
�� 
=
�� 
pet
�� 
.
�� 
Update
�� #
(
��# $
petDto
��$ *
.
��* +
Name
��+ /
,
��/ 0
petDto
��1 7
.
��7 8
	Birthdate
��8 A
,
��A B
petDto
��C I
.
��I J
Race
��J N
,
��N O
petDto
��P V
.
��V W
Gender
��W ]
)
��] ^
;
��^ _
if
�� 
(
�� 
result
�� 
.
�� 
	IsFailure
��  
)
��  !
{
�� 
return
�� 

BadRequest
�� !
(
��! "
result
��" (
.
��( )
Error
��) .
)
��. /
;
��/ 0
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
Update
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
[
�� 	

HttpDelete
��	 
(
�� 
$str
�� (
)
��( )
]
��) *
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
.
��K L
Result
��L R
;
��R S
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
��K L
Result
��L R
.
��R S
Where
��S X
(
��X Y
m
��Y Z
=>
��[ ]
m
��^ _
.
��_ `
ClinicId
��` h
==
��i k
vetClinicId
��l w
)
��w x
;
��x y
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
��5 6
Result
��6 <
.
��< =
Where
��= B
(
��B C
v
��C D
=>
��E G
v
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
}�� �6
MD:\10.12.2022\VetAppointment\VetAppointment.API\Controllers\VetsController.cs
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
. 
Select 
( 
v 
=> 
new 
VetDto #
(# $
)$ %
{ 
Id 
= 
v 
. 
Id !
,! "
Name 
= 
v  
.  !
Name! %
,% &
Surname 
=  !
v" #
.# $
Surname$ +
,+ ,
	Birthdate !
=" #
v$ %
.% &
	Birthdate& /
./ 0
ToString0 8
(8 9
)9 :
,: ;
Gender 
=  
v! "
." #
Gender# )
.) *
ToString* 2
(2 3
)3 4
,4 5
Email 
= 
v  !
.! "
Email" '
,' (
Phone 
= 
v  !
.! "
Phone" '
,' (
Specialisation &
=' (
v) *
.* +
Specialisation+ 9
.9 :
ToString: B
(B C
)C D
}   
)!! 
;!! 
Response## 
.## 
Headers## 
.## 
Add##  
(##  !
$str##! ?
,##? @
$str##A a
)##a b
;##b c
Response$$ 
.$$ 
Headers$$ 
.$$ 
Add$$  
($$  !
$str$$! ?
,$$? @
$str$$A b
)$$b c
;$$c d
Response%% 
.%% 
Headers%% 
.%% 
Add%%  
(%%  !
$str%%! >
,%%> ?
$str%%@ X
)%%X Y
;%%Y Z
return&& 
Ok&& 
(&& 
vets&& 
)&& 
;&& 
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
]**- .
CreateVetDto**/ ;
vetDto**< B
)**B C
{++ 	
var,, 
vet,, 
=,, 
Vet,, 
.,, 
Create,,  
(,,  !
vetDto-- 
.-- 
Name-- 
,--  
vetDto.. 
... 
Surname.. "
,.." #
vetDto// 
.// 
	Birthdate// $
,//$ %
vetDto00 
.00 
Gender00 !
,00! "
vetDto11 
.11 
Email11  
,11  !
vetDto22 
.22 
Phone22  
,22  !
vetDto33 
.33 
Specialisation33 )
)44 
;44 
if66 
(66 
vet66 
.66 
	IsFailure66 
)66 
{77 
return88 

BadRequest88 !
(88! "
vet88" %
.88% &
Error88& +
)88+ ,
;88, -
}99 
vetRepository;; 
.;; 
Add;; 
(;; 
vet;; !
.;;! "
Entity;;" (
);;( )
;;;) *
vetRepository<< 
.<< 
SaveChanges<< %
(<<% &
)<<& '
;<<' (
var>> 
fullVet>> 
=>> 
new>> 
VetDto>> $
(>>$ %
)>>% &
{?? 
Id@@ 
=@@ 
vet@@ 
.@@ 
Entity@@ 
.@@  
Id@@  "
,@@" #
ClinicIdAA 
=AA 
vetAA 
.AA 
EntityAA %
.AA% &
ClinicIdAA& .
,AA. /
NameBB 
=BB 
vetBB 
.BB 
EntityBB !
.BB! "
NameBB" &
,BB& '
SurnameCC 
=CC 
vetCC 
.CC 
EntityCC $
.CC$ %
SurnameCC% ,
,CC, -
	BirthdateDD 
=DD 
vetDD 
.DD  
EntityDD  &
.DD& '
	BirthdateDD' 0
.DD0 1
ToStringDD1 9
(DD9 :
)DD: ;
,DD; <
GenderEE 
=EE 
vetEE 
.EE 
EntityEE #
.EE# $
GenderEE$ *
.EE* +
ToStringEE+ 3
(EE3 4
)EE4 5
,EE5 6
EmailFF 
=FF 
vetFF 
.FF 
EntityFF "
.FF" #
EmailFF# (
,FF( )
PhoneGG 
=GG 
vetGG 
.GG 
EntityGG "
.GG" #
PhoneGG# (
,GG( )
SpecialisationHH 
=HH  
vetHH! $
.HH$ %
EntityHH% +
.HH+ ,
SpecialisationHH, :
.HH: ;
ToStringHH; C
(HHC D
)HHD E
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
(NN! "
GetNN" %
)NN% &
,NN& '
fullVetNN( /
)NN/ 0
;NN0 1
}OO 	
}PP 
}QQ �
FD:\10.12.2022\VetAppointment\VetAppointment.API\Dtos\AppointmentDto.cs
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

SD:\10.12.2022\VetAppointment\VetAppointment.API\Dtos\Create\CreateAppointmentDto.cs
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
LD:\10.12.2022\VetAppointment\VetAppointment.API\Dtos\Create\CreateDrugDto.cs
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
KD:\10.12.2022\VetAppointment\VetAppointment.API\Dtos\Create\CreatePetDto.cs
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
PD:\10.12.2022\VetAppointment\VetAppointment.API\Dtos\Create\CreatePetOwnerDto.cs
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
VD:\10.12.2022\VetAppointment\VetAppointment.API\Dtos\Create\CreatePrescribedDrugDto.cs
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
QD:\10.12.2022\VetAppointment\VetAppointment.API\Dtos\Create\CreateTreatmentDto.cs
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
QD:\10.12.2022\VetAppointment\VetAppointment.API\Dtos\Create\CreateVetClinicDto.cs
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
KD:\10.12.2022\VetAppointment\VetAppointment.API\Dtos\Create\CreateVetDto.cs
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
?D:\10.12.2022\VetAppointment\VetAppointment.API\Dtos\DrugDto.cs
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
ID:\10.12.2022\VetAppointment\VetAppointment.API\Dtos\MedicalHistoryDto.cs
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
>D:\10.12.2022\VetAppointment\VetAppointment.API\Dtos\PetDto.cs
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
CD:\10.12.2022\VetAppointment\VetAppointment.API\Dtos\PetOwnerDto.cs
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
ID:\10.12.2022\VetAppointment\VetAppointment.API\Dtos\PrescribedDrugDto.cs
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
DD:\10.12.2022\VetAppointment\VetAppointment.API\Dtos\TreatmentDto.cs
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
DD:\10.12.2022\VetAppointment\VetAppointment.API\Dtos\VetClinicDto.cs
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
} �
>D:\10.12.2022\VetAppointment\VetAppointment.API\Dtos\VetDto.cs
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
} �6
:D:\10.12.2022\VetAppointment\VetAppointment.API\Program.cs
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
builder 
. 
Services 
. 
AddDbContext 
< 
DatabaseContext -
>- .
(. /
options 
=> 
options 
. 
	UseSqlite  
(  !
builder 
. 
Configuration 
. 
GetConnectionString 1
(1 2
$str2 E
)E F
,F G
b 	
=>
 
b 
. 
MigrationsAssembly !
(! "
typeof" (
(( )
DatabaseContext) 8
)8 9
.9 :
Assembly: B
.B C
FullNameC K
)K L
) 	
) 
; 
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
