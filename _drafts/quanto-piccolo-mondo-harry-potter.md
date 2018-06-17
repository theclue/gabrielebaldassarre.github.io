---
title: "Quanto piccolo è il mondo di Harry Potter?"
excerpt: "This post should [...]"
header:
  overlay_image: /assets/images/harry-potter-philosophers-overlay.png
  overlay_filter: 0.5 # same as adding an opacity of 0.5 to a black background
---

Venti anni fa, nel 1998, usciva in Italia _"Harry Potter e la Pietra Filosofale"_, il primo della serie di romanzi partoriti dalla penna di [J. K. Rowling](https://www.jkrowling.com/) che sarà destinata a cambiare per sempre sia la narrativa _young adults_ che il genere fantasy tout cour. Ammetto di aver scoperto relativamente tardi i volumi; e questo, credo, mi ha permesso di apprezzarli maggiormente e cogliere delle interessanti sfumature.

Affascinato dal mondo incredibilmente immersivo creato dalla Rowling, dalle vicende e dalle relazioni tra i personaggi, mi sono subito chiesto: ma il mondo di Harry è a tutti gli effetti uno _small world?_

Ebbene, molte tecniche di Social Network Analysis possono essere applicate anche alla fiction e alle letteratura, purché adeguatamente "preparate"; i risultati sono, come vedremo subito, stimolanti e, talvolta, inaspettati.

Se, invece, siete più interessati ai dettagli tecnici, saltate alla sezione relativa, più in basso, dove troverete anche ampi rimandi al codice sorgente disponibile su Github.

Il testo  utilizzato per l'analisi è la versione ePub in lingua inglese, acquistata dal [sito ufficiale](https://www.pottermore.com/).

## Una prima occhiata a "La pietra Filosofale"

Il primo volume della serie ha più che altro lo scopo di introdurre i personaggi e delinearne i ruoli (l'eroe, il supporto, l'antagonista, [eccetera](https://it.wikipedia.org/wiki/Narratologia)); introduce i personaggi che gravitano attorno alla Scuola di Magia e di Stregoneria di Hogwarts, ma non ne approfondisce le relazioni. Questo non è un problema: ciò che ci interessa, in effetti, non è l'importanza narrativa degli attori, ma le loro _conversazioni_; solo se i personaggi sono stati coinvolti almeno in una conversazione, infatti, questi potranno dire di avere una reciproca relazione sociale.

{% include figure image_path="/assets/images/harry-potter-philosophers-timeline.png" alt="Timeline delle conversazioni dei 15 personaggi principali in Harry Potter e la Pietra Filosofale" caption="Top 15 Personaggi e loro linee di dialogo, in ordine decrescente" %}

Dallo lettura delle sequenze dei dialoghi, vediamo immediatamente che il libro si concentra attorno alle vicende del protagonista, Harry; egli è, infatti, presente in quasi tutte le conversazioni. La rete, c'è da aspettarsi, avrà spiccate caratteristiche di una ego-network, forse sarà addirittura una rete (quasi) a stella. Non c'è da stupirsi: tutta la storia si svolge attorno a Harry e tutte le reti sociali espresse hanno nel giovane mago se non il centro nevralgico, almeno uno spettatore privilegiato.

Poiché la mia ipotesi di lavoro è stata di considerare tutti i personaggi riscontrati in una conversazione come una _clique_ non diretta, mi aspetto, inoltre, una rete con un elevato coefficiente di clustering e un _average degree_ piuttosto alto. Vediamola subito.

{% include figure image_path="/assets/images/harry-potter-philosophers-network.png" caption="La rete individuata dai personaggi del libro in base alle loro conversazioni" caption="Harry Potter e la Pietra Filosofale - rete costruita con Gephi" %}

Chiaramente Harry è al centro della rete e forma una _clique_ molto stretta con, come prevedibile, Ron ed Hermione - gli altri due principali protagonisti del romanzo. Anche Hagrid ha un ruolo di primo piano, così come la Professoressa McGonagall, mentre di altri personaggi di primo piano della saga, almeno dal punto di vista narrativo, non diresti che hanno un rapporto stretto con Harry, a giudicare dalle conversazioni che i due hanno tenuto insieme (Albus Silente su tutti). Comunque sia, con i suoi 33 segmenti su 36 nodi totali, Harry è inequivocabilmente al centro di una ego-rete fortemente stellata.
