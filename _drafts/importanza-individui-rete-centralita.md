---
title: "L'importanza degli individui in una rete"
excerpt: "Uno degli usi più comuni della Social Network Analysis è l'individuazione degli attori più importanti, a vario titolo, all'interno di una rete. In questo articolo introdurremo le modalità di misurazione più semplici, che si applicano alle reti non direzionate, per poi fornire alcuni esempi di applicazioni pratiche."
header:
  overlay_image: /assets/images/centrality-overlay.png
  overlay_filter: 0.5
graph_sw_bare: "graphs/smallworld-example-bare.html"
---

Tutti coloro che si approcciano alla Social Network Analysis si aspettano che questa disciplina li aiuti a capire quali sono gli individui più _prominenti_ in una data rete sociale. Una richiesta più che ovvia, dato che la SNA per definizione studia le relazioni tra gli attori proprio con questa finalità. Gli strumenti a disposizione per rispondere a domande di questo tipo sono moltissimi: alcuni sono semplici, altri estremamente sofisticati; tutti molto utili, in effetti. Ma prima di addentrarci nello specifico bisogna porsi una domanda fondamentale: cosa intendiamo per _prominenza_ in una rete sociale?

## Prestigio, centralità, capacità di influenzare

La domanda, forse ci siete arrivati, è palesemente faziosa. Si può parlare di prominenza come _la capacità di un attore di essere [estremamente coinvolto in relazioni](https://books.google.it/books?id=CAm2DpIqRUIC&lpg=PR21&ots=HwIlui3zSg&dq=social%20network%20analysis%20methods%20and%20applications%20stanley&lr&hl=it&pg=PA173#v=onepage&q&f=false) con gli altri attori della rete_, ma è una definizione fine a se stessa.

La verità è che non esiste un concetto unico di prominenza né un'unica modalità per isolare i nodi "importanti" in una rete; la misura è, piuttosto, contestuale alla _funzione_ che ci aspettiamo dagli attori stessi e al volume e il tipo di informazioni a cui essi hanno accesso e di cui abbiamo bisogno.

* Siamo interessati ai nodi che sono in grado meglio di altri di trasferire un'informazione? In tal caso, cerchiamo i nodi che siano al __centro__ della rete (a vario titolo).
* Vogliamo isolare i nodi che siano percepiti come punto di riferimento della rete? Allora forse siamo interessati al __prestigio__.
* Ci interessa coinvolgere i nodi chiave che più di altri possono influenzare, con le loro scelte, ampie zone della rete? Probabilmente quello che ci serve è il __brokeraggio__.
* ...

La lista potrebbe continuare per un bel po' perché pressoché infiniti sono i modelli interpretativi che possiamo costruire sopra una rete sociale. Come insegna il   [costruzionismo](http://www.lavorosociale.com/archivio/n/articolo/costruzionismo-sociale), la nostra interpretazione della realtà sociale crea dei modelli. E questi modelli possono essere analizzati e le loro proprietà misurate.

Ma torniamo alla lista; per cominciare, perché è il problema più semplice, ma comunque ricchissimo di applicazioni pratiche, in questo articolo affronteremo il primo punto: quello della __misura della centralità__.

Nel concreto, andremo a introdurre tre misure per altrettante tipologie di centralità e lo faremo, a titolo d'esempio, su una rete non direzionata. La possiamo vedere qui sotto.

{% include {{ page.graph_sw_bare }} %}

## Essere al centro della scena: Degree Centrality
