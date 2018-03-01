
use v5.10;
use utf8;
use warnings;
use strict;
use List::MoreUtils qw(uniq);
use Data::Dumper;

#my $re = qr/foo|bar/;

my $hanzi = '０、我知道騎腳踏車是一種很好的運動，週末假日，常常跟太太騎腳踏車到郊外去。
１、我的腳踏車是朋友送給我的，雖然看起來很舊，可是騎起來還不錯。
２、今天腳踏車有點怪怪的，不知道怎麼搞的，我一騎上去，車子就往旁邊歪。上車一看，原來後台沒氣了，只好把車推倒車行去，借個打氣筒打打氣。
３、老闆說我的車打氣沒用，因為車胎破了個小洞，爆胎了。怎麼又爆胎了？我上個禮拜才補過的。
４、我請老闆想辦法再幫我補一補，可是老闆說這部車的內胎已經補了兩次，不值得再補了，不如換個內胎比較划得來（划算）。
５、後來老闆發現腳踏板也壞了，鍊條也鬆了，所以建議我買部新車，他說現在的變速車騎起來又快又輕鬆。
６、我當然知道變速車好，可是這個月沒錢買。所以拜託老闆先幫我把舊車修理修理，等下個月再說吧！';

my $pinyin = '0, Wǒ wǒ zhīdào qí jiǎotàchē shì yīzhǒng hěn hǎo de yùndòng, zhōumò jiàrì, chángcháng gēn tàitài qí jiǎotàchē dào jiāowài qù. 
1, Wǒ de jiǎotàchē shì péngyǒu sòng gěi wǒ de, suīrán kànqǐlái hěn jiù, kěshì qíqǐlái hái bùcuò. 
2, Jīntiān jiǎotàchē yǒudiǎn guài guài de, bù zhīdào zěnme gǎo de, wǒ yī qí shàngqù, chēzi jiù wǎng pángbiān wāi. Shàng chē yī kàn, yuánlái hòutái méi qìle, zhǐhǎo bǎ chē tuīdǎo chē xíng qù, jiè gè dǎqìtǒng dǎdǎqì. 
3, Lǎobǎn shuō wǒ de chē dǎqì méi yòng, yīnwèi chētāi pòle gè xiǎo dòng, bàotāile. Zěnme yòu bàotāile? Wǒ shàng gè lǐbài cái bǔguò de. 
4, Wǒ qǐng lǎobǎn xiǎng bànfǎ zài bāng wǒ bǔ yī bǔ, kěshì lǎobǎn shuō zhè bù chē de nèitāi yǐjīng bǔle liǎng cì, bù zhídé zài bǔle, bùrú huàngè nèitāi bǐjiào huádélái (huásuàn). 
5, Hòulái lǎobǎn fāxiàn jiǎotàbǎn yě huàile, liàntiáo yě sōngle, suǒyǐ jiànyì wǒ mǎi bù xīn chē, tā shuō xiànzài de biànsùchē qíqǐlái yòu kuài yòu qīngsōng. 
6, Wǒ dāngrán zhīdào biànsùchē hǎo, kěshì zhège yuè méi qián mǎi. Suǒyǐ bàituō lǎobǎn xiān bāng wǒ bǎ jiù chē xiūlǐ xiūlǐ, děng xià gè yuè zàishuō ba!';

# just to extract all the tone-marked characters
my $test = $pinyin;
#$test =~ tr/a-zA-Z0-9 ,.!()?\n//d;
#say $test;
#say join '', uniq sort split //, $test;

# 
$pinyin =~ tr/āáǎàēéěèīíǐìōóǒòūúǔùǖǘǚǜ/aaaaeeeeiiiioooouuuuüüüü/;

#say $pinyin;

my @words;

my $re = '(([mM]iu|[pmPM]ou|[bpmBPM](o|e(i|ng?)?|a(ng?|i|o)?|i(e|ng?|a[no])?|u))|([fF](ou?|[ae](ng?|i)?|u))|([dD](e(i|ng?)|i(a[on]?|u))|[dtDT](a(i|ng?|o)?|e(i|ng)?|i(a[on]?|e|ng|u)?|o(ng?|u)|u(o|i|an?|n)?))|([nN]eng?|[lnLN](a(i|ng?|o)?|e(i|ng)?|i(ang|a[on]?|e|ng?|u)?|o(ng?|u)|u(o|i|an?|n)?|üe?))|([ghkGHK](a(i|ng?|o)?|e(i|ng?)?|o(u|ng)|u(a(i|ng?)?|i|n|o)?))|([zZ]h?ei|[czCZ]h?(e(ng?)?|o(ng?|u)?|ao|u?a(i|ng?)?|u?(o|i|n)?))|([sS]ong|[sS]hua(i|ng?)?|[sS]hei|[sS][h]?(a(i|ng?|o)?|en?g?|ou|u(a?n|o|i)?|i))|([rR]([ae]ng?|i|e|ao|ou|ong|u[oin]|ua?n?))|([jqxJQX](i(a(o|ng?)?|[eu]|ong|ng?)?|u(e|a?n)?))|(([aA](i|o|ng?)?|[oO]u?|[eE](i|ng?|r)?))|([wW](a(i|ng?)?|o|e(i|ng?)?|u))|[yY](a(o|ng?)?|e|in?g?|o(u|ng)?|u(e|a?n)?))';
push @words, $1 while $pinyin =~ /$re/gi;

say join ' ', @words;

my @syllables = qw/
ba	pa	ma	fa	da	ta	na	la	ga	ka	ha	za	ca	sa	zha	cha	sha	 	 	 	 	a
bo	po	mo	fo	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	o
 	 	me	 	de	te	ne	le	ge	ke	he	ze	ce	se	zhe	che	she	re	 	 	 	e
bai	pai	mai	 	dai	tai	nai	lai	gai	kai	hai	zai	cai	sai	zhai	chai	shai	 	 	 	 	ai
bei	pei	mei	fei	dei	tei	nei	lei	gei	kei	hei	zei	 	 	zhei	 	shei	 	 	 	 	ei
bao	pao	mao	 	dao	tao	nao	lao	gao	kao	hao	zao	cao	sao	zhao	chao	shao	rao	 	 	 	ao
 	pou	mou	fou	dou	tou	nou	lou	gou	kou	hou	zou	cou	sou	zhou	chou	shou	rou	 	 	 	ou
ban	pan	man	fan	dan	tan	nan	lan	gan	kan	han	zan	can	san	zhan	chan	shan	ran	 	 	 	an
bang	pang	mang	fang	dang	tang	nang	lang	gang	kang	hang	zang	cang	sang	zhang	chang	shang	rang	 	 	 	ang
																					er
ben	pen	men	fen	den	 	nen	 	gen	ken	hen	zen	cen	sen	zhen	chen	shen	ren	 	 	 	en
beng	peng	meng	feng	deng	teng	neng	leng	geng	keng	heng	zeng	ceng	seng	zheng	cheng	sheng	reng	 	 	 	eng
 	 	 	 	dong	tong	nong	long	gong	kong	hong	zong	cong	song	zhong	chong	 	rong	 	 	 	 
bu	pu	mu	fu	du	tu	nu	lu	gu	ku	hu	zu	cu	su	zhu	chu	shu	ru	 	 	 	wu 
 	 	 	 	 	 	 	 	gua	kua	hua	 	 	 	zhua	chua	shua	rua	 	 	 	wa 
 	 	 	 	duo	tuo	nuo	luo	guo	kuo	huo	zuo	cuo	suo	zhuo	chuo	shuo	ruo	 	 	 	wo 
 	 	 	 	 	 	 	 	guai	kuai	huai	 	 	 	zhuai	chuai	shuai	 	 	 	 	wai 
 	 	 	 	dui	tui	 	 	gui	kui	hui	zui	cui	sui	zhui	chui	shui	rui	 	 	 	wei  
 	 	 	 	duan	tuan	nuan	luan	guan	kuan	huan	zuan	cuan	suan	zhuan	chuan	shuan	ruan	 	 	 	wan 
 	 	 	 	 	 	 	 	guang	kuang	huang	 	 	 	zhuang	chuang	shuang	 	 	 	 	wang 
 	 	 	 	dun	tun	nun	lun	gun	kun	hun	zun	cun	sun	zhun	chun	shun	run	 	 	 	wen  
 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	weng 
bi	pi	mi	 	di	ti	ni	li	 	 	 	zi 	ci 	si 	zhi 	chi 	shi 	ri 	ji	qi	xi	yi 
 	 	 	 	dia	 	 	lia	 	 	 	 	 	 	 	 	 	 	jia	qia	xia	ya 
bie	pie	mie	 	die	tie	nie	lie	 	 	 	 	 	 	 	 	 	 	jie	qie	xie	ye 
biao	piao	miao	 	diao	tiao	niao	liao	 	 	 	 	 	 	 	 	 	 	jiao	qiao	xiao	yao 
 	 	miu	 	diu	 	niu	liu	 	 	 	 	 	 	 	 	 	 	jiu	qiu	xiu	you 
bian	pian	mian	 	dian	tian	nian	lian	 	 	 	 	 	 	 	 	 	 	jian	qian	xian	yan 
 	 	 	 	 	 	niang	liang	 	 	 	 	 	 	 	 	 	 	jiang	qiang	xiang	yang 
bin	pin	min	 	 	 	nin	lin	 	 	 	 	 	 	 	 	 	 	jin	qin	xin	yin 
bing	ping	ming	 	ding	ting	ning	ling	 	 	 	 	 	 	 	 	 	 	jing	qing	xing	ying 
 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	jiong	qiong	xiong	yong 
 	 	 	 	 	nü	lü	 	 	 	 	 	 	 	 	 	 	ju 	qu 	xu 	yu 
 	 	 	 	 	nüe	lüe	 	 	 	 	 	 	 	 	 	 	jue 	que 	xue 	yue 
 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	juan 	quan 	xuan 	yuan 
 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	jun 	qun 	xun 	yun 
/;

#say $re;

#say scalar @syllables, " legal pinyin syllables";
#say join '|', @syllables;

use Regexp::Assemble;

my $ra = Regexp::Assemble->new;
$ra->add(@syllables);
say $ra->re;
my $ree = $ra->re;

@words = [];
$pinyin = lc $pinyin;
push @words, $1 while $pinyin =~ /($ree)/gim;
say "hi";
say join ' ', @words;

@words = [];
$pinyin = <<END;
guānzìzài púsà<br>
xíng shēn bōrěbōluómìduō shí<br>
zhàojiàn wǔyùn jiē kōng<br>
dù yīqiè kǔ è<br>
shèlìzi<br>
sè bùyì kōng<br>
kōng bùyì sè<br>
sè jíshì kōng<br>
kōng jíshì sè<br>
shòu xiǎng xíng shí yìfù rúshì<br>
shèlìzi<br>
shì zhū fǎ kōng xiāng<br>
bùshēng bùmiè<br>
bùgòu bùjìng<br>
bùzēng bùjiǎn<br>
shì gù kōngzhōng wúsè<br>
wú shòu xiǎng xíng shí<br>
wú yǎn ěr bí shé shēn yì<br>
wú sè shēng xiāng wèi chù fǎ<br>
wú yǎnjiè nǎizhì wúyìshí jiè<br>
wú wúmíng yì wú wúmíng jǐn<br>
nǎizhì wú lǎosǐ yì wú lǎosǐ jǐn<br>
wú kǔ jí miè dào<br>
wú zhì yì wú dé<br>
yǐ wú suǒ dé gù<br>
pútísàduǒ yī bōrě bōluómìduō<br>
gù xīn wú guà ài<br>
wú guà ài gù<br>
wú yǒu kǒngbù<br>
yuǎnlí diāndǎo mèngxiǎng<br>
jiùjìng nièpán<br>
sānshì zhū fú<br>
yī bōrě bōluómìduō gù<br>
dé ānòuduōluó sānmiǎo sānpútí<br>
gù zhī bōrě bōluómìduō<br>
shì dàshén zhòu<br>
shì dàmíng zhòu<br>
shì wú shàng zhòu<br>
shì wú děng děng zhòu<br>
néng chú yīqiè kǔ<br>
zhēnshí bù xū<br>
gù shuō bōrě bōluómìduō zhòu<br>
jí shuō zhòu yuē:<br>
jiēdì jiēdì bōluójiēdì bōluósēngjiēdì<br>
pútí sàpóhē
END

my $char;
while ($pinyin =~ /([āáǎàēéěèīíǐìōóǒòūúǔùǖǘǚǜ])/gmi) {
    $char = $1;
    #say "<$'>";
    my $nl = '';
    #say "xx ", substr($', 0, 5);
    $nl = "***\n" if ($' =~ /^.?<br>/);
    
    $char = 1 if ($char =~ /[āēīōūǖ]/);
    $char = 2 if ($char =~ /[áéíóúǘ]/);
    $char = 3 if ($char =~ /[ǎěǐǒǔǚ]/);
    $char = 4 if ($char =~ /[àèìòùǜ]/);
    print "$char $nl";
}
say "";

$pinyin =~ tr/āáǎàēéěèīíǐìōóǒòūúǔùǖǘǚǜ/aaaaeeeeiiiioooouuuuüüüü/;
push @words, $1 while $pinyin =~ /($ree)/gim;
say "hi";
say join ' ', @words;
