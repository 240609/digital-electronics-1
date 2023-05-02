# Vysílač a přijímač Morseovy abecedy

### Členové týmu

* David Bartoň (koncepce projektu; signalTransmitter.vhd)
* Šimon Bárta (signalTransmitter.vhd; top.vhd; tb_MorseDecoder.vhd)
* Jakub Fojtík (7seg_decoder.vhd; tb_MorseDecoder.vhd)

## Teoretický popis a vysvětlení

Naším úkolem bylo vytvořit vysílač a přijímač Morseovy abecedy pomocí vývojové desky Nexys A7-50T v jazyce VHDL. Chtěli jsme použít jedno tlačítko, které by vysílalo 1 pro HIGH a 0 pro LOW pomocí časových intervalů dlouhých 250 ms. Jeden interval 250 ms by měl být tečka a mezera mezi nimi, 1000 ms by měla být čárka. Tyto znaky (tečka, čárka, mezera) se pak zapíší do pole 4 dvojčísel. Pole je pak dlouhé 8 bitů a každá dvojčíslice představuje znak: 00 = nic, 01 = tečka, 10 = čárka. Tato osmibitová čísla se pak použijí v našem příkazu case-when k rozsvícení správného písmene z abecedy na sedmisegmentovém displeji.



## Hardwareový popis

Po stisknutí prostředního tlačítka BTNC na desce Nexys A7-50T by měl být shift register v našem kódu schopen rozpoznat naše písmeno a zobrazit ho na sedmisegmentovém displeji. Bohužel se nám nepodařilo implementovat vstup na naši desku, takže nemůžeme písmena zobrazit.

## Softwareový popis

Náš software by měl být schopen zapamatovat si osmibitové číslo pomocí posuvných registrů v characterRecognizer.vhd a poté ho vypsat na sedmisegmentový displej.

![Diagram](top_structure.jpg)

### Komponenty simulace

Nepodařilo se nám udělat fungující simulace. 

## Pokyny

1. Mačkáním tlačítka se vysílá Morseův kód.
2. Výstup Morseova kódu se nám zobrazí na sedmisegmentovém displeji. 

## Zdroje

1. [Morse code translated to 7-segment display](https://fakoo.de/en/siekoo.html)
2. [Better shift register than our first](https://www.instructables.com/Basys-3-Morse-Decoder/)
3. [Idea of timing and using shift registers](https://www.researchgate.net/publication/305379385_Morse_code_decoder_design_in_VHDL_using_FPGA_Spartan_3E_development_kit) 
