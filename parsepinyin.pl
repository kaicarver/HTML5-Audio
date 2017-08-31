
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

my $pinyin = '0, Wǒ zhīdào lǘ qí jiǎotàchē shì yīzhǒng hěn hǎo de yùndòng, zhōumò jiàrì, chángcháng gēn tàitài qí jiǎotàchē dào jiāowài qù. 
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

push @words, $1 while $pinyin =~ /(([mM]iu|[pmPM]ou|[bpmBPM](o|e(i|ng?)?|a(ng?|i|o)?|i(e|ng?|a[no])?|u))|([fF](ou?|[ae](ng?|i)?|u))|([dD](e(i|ng?)|i(a[on]?|u))|[dtDT](a(i|ng?|o)?|e(i|ng)?|i(a[on]?|e|ng|u)?|o(ng?|u)|u(o|i|an?|n)?))|([nN]eng?|[lnLN](a(i|ng?|o)?|e(i|ng)?|i(ang|a[on]?|e|ng?|u)?|o(ng?|u)|u(o|i|an?|n)?|üe?))|([ghkGHK](a(i|ng?|o)?|e(i|ng?)?|o(u|ng)|u(a(i|ng?)?|i|n|o)?))|([zZ]h?ei|[czCZ]h?(e(ng?)?|o(ng?|u)?|ao|u?a(i|ng?)?|u?(o|i|n)?))|([sS]ong|[sS]hua(i|ng?)?|[sS]hei|[sS][h]?(a(i|ng?|o)?|en?g?|ou|u(a?n|o|i)?|i))|([rR]([ae]ng?|i|e|ao|ou|ong|u[oin]|ua?n?))|([jqxJQX](i(a(o|ng?)?|[eu]|ong|ng?)?|u(e|a?n)?))|(([aA](i|o|ng?)?|[oO]u?|[eE](i|ng?|r)?))|([wW](a(i|ng?)?|o|e(i|ng?)?|u))|[yY](a(o|ng?)?|e|in?g?|o(u|ng)?|u(e|a?n)?))/gi;

say join ' ', @words;

