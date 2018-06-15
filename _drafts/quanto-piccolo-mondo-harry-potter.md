---
title: "Quanto piccolo è il mondo di Harry Potter?"
excerpt: "This post should [...]"
header:
  overlay_image: /assets/images/harry-potter-philosophers-overlay.png
  overlay_filter: 0.5 # same as adding an opacity of 0.5 to a black background
---

Venti anni fa, nel 1998, usciva in Italia _"Harry Potter e la Pietra Filosofale"_, il primo della serie di romanzi partoriti dalla penna di [J. K. Rowling](https://www.jkrowling.com/) che sarà destinata a cambiare per sempre sia la narrativa _young adults_ che il genere fantasy tout cour. Ammetto di aver scoperto relativamente tardi i volumi; e questo, credo, mi ha permesso di apprezzarli maggiormente e cogliere delle interessanti sfumature.

Affascinato dal mondo incredibilmente immersivo creato dalla Rowling, dalla narrazione generazionale e dalle relazioni tra i personaggi, mi sono subito chiesto: ma il mondo di Harry è a tutti gli effetti uno _small world?_

Ebbene, la Social Network Analysis può essere applicata anche al mondo della letteratura e dei romanzi; i risultati sono, come vedremo subito, stimolanti e, talvolta, inaspettati.

Se, invece, siete più interessati ai dettagli tecnici con cui ho preparato e studiato il testo per costruire la rete, vi consiglio di saltare alla sezione relativa, più in basso, dove troverete anche ampi rimandi al codice sorgente disponibile su Github.

Il testo  utilizzato per l'analisi è la versione ePub in lingua inglese, acquistata dal [sito ufficiale](https://www.pottermore.com/).

## Una prima occhiata a "La pietra Filosofale"

Il primo volume, quello di cui ci occuperemo qui, ha più che altro lo scopo di introdurre i personaggi e delineare i ruoli (l'eroe, il supporto, l'antagonista, ecc.); lascia intravedere il sottobosco di personaggi che gravitano attorno alla Scuola di Magia e di Stregoneria di Hogwarts, ma non ne approfondisce ancora le relazioni. Questo non è un problema: ciò che ci interessa, in effetti, sono le _conversazioni_; solo se i personaggi sono stati coinvolti almeno in una conversazione, infatti, questi potranno essere considerati come aventi una reciproca relazione sociale.

{% include figure image_path="/assets/images/harry-potter-philosophers-timeline.png" alt="Timeline delle conversazioni dei 15 personaggi principali in Harry Potter e la Pietra Filosofale" caption="Top 15 Personaggi e loro linee di dialogo, in ordine decrescente" %}

Dallo lettura delle sequenze dei dialoghi, vediamo immediatamente che il libro si concentra attorno alle vicende del protagonista, Harry; egli è, infatti, presente in quasi tutte le conversazioni. La rete, c'è da aspettarsi, avrà spiccate caratteristiche di una ego-network, forse sarà addirittura una rete a stella.
