# Programování zařízení Apple
Projekt 2

Autor: Jan Menšík

Programováno ve: ***SwiftUI***

Odkaz na projekt: [Github](https://github.com/Jonnymen/IZA_SwiftUI_Parkovaci_domy)

## Parkovací domy v Brně

Aplikace slouží k vyhledání parkovacích domů v Brně a sehnání informace ohledně cen parkovného, dostupnosti parkování a lokace parkovacího domu.

**Využití:**

V dnešní době, krátce po zavedení parkovacích modrých zón v centru města mají lidé, kteří potřebují navštívit centrum města problém se k němu v případě potřeby dostat autem. Na modrých zónách může návštěvník centra zaparkovat pouze na určitou krátkou dobu zadarmo, navíc parkovacích míst v centru je pouze malé množství. Následující čas je již placený a cena za parkování v modré zóně je vyšší, než byla cena dřívější, když modré zóny v Brně nebyli. Návštěvník tedy hledá alternativu, kde by mohl zaparkovat na delší dobu, aniž by za parkování platil vysokou cenu. Aplikace pomůže řidiči parkovací dům najít, zjistit, zda-li je v něm místo na parkování a odkáže ho do navigace, která ho k parkovacímu domu dovede. Řidič tak ví, že je schopen na určitém místě za konkrétně zmíněnou cenu zaparkovat.

**Hotová práce:**
- Stáhnutí informací o parkovacích domech ze stránky [parkovanivbrne.cz](https://www.parkovanivbrne.cz/parkovani-dalsi) (SwiftSoup)
- zobrazení seznamu parkovacích domů v hlavním okně aplikace
- informace o obsazenosti parkovacího domu
- informace o cenách parkování
- tlačítko pro odkázání do navigace (Apple Maps) ke konkrétnímu parkovacímu domu

**Nestihnuto:**
- ETA informace - časově-dojezdová vzdálenost z aktuální lokace k jednotlivým parkovacím domům (MapKit, CoreLocation)
- řazení parkovacích domů podle dojezdové vzdálenosti
- ukládání oblíbených parkovacích domů do samostatné obrazovky aplikace