---
title: "L'importanza degli individui in una rete"
excerpt: "Uno degli usi più comuni della Social Network Analysis è l'individuazione degli attori più importanti, a vario titolo, all'interno di una rete. A questo scopo, in questo articolo introdurremo le tre modalità più semplici di misura della __centralità__."
category: "Social Network Analysis"
header:
  overlay_image: /assets/images/centrality-overlay.png
  overlay_filter: 0.5
graph_bare: "graphs/smallworld-example-bare.html"
graph_degree: "graphs/smallworld-example-degree.html"
graph_betweeness: "graphs/smallworld-example-betweeness.html"
graph_closeness: "graphs/smallworld-example-closeness.html"
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

Nel concreto, andremo a introdurre tre misure per altrettante tipologie di centralità e lo faremo, a titolo d'esempio, su alcune reti "giocattolo", come quella qui sotto.

{% include {{ page.graph_bare }} %}

## Essere il più attivo di tutti: Degree Centrality

La definizione più semplice possibile di centralità è quella per cui l'attore centrale è, molto semplicemente, il più attivo di tutti all'interno di una rete, ovvero colui il quale ha il maggior numero di collegamenti da e verso altri nodi. Questa è la __Degree Centrality__ che, come è intuibile, può essere applicata sia a reti non direazionate che a reti direzionate (in questo caso le misure diventano due: __In-Degree Centrality__ e __Out-Degree Centrality__).

L'interpretazione della misura è molto semplice: gli individui con elevata degree centrality sono quelli che si trovano _vicini all'azione_ e sono quelli che godono della maggiore visibilità, nonché accesso al maggior quantitativo di risorse, perché il numero di contatti a cui possono attingere è più alto.

Vediamolo visualmente nella nostra rete giocattolo, dove la dimensione dei nodi è qui proporzionale al valore di Degree Centrality (In+Out). Si vede subito la prominenza, in termini di connessioni, dei nodi _4_, _14_ e _20_: i nodi più visibili della rete.

{% include {{ page.graph_degree }} %}

Ora, la misura è semplice e l'interpretazione immediata, ma contare semplicemente i collegamenti non fa, di per sé, un nodo importante. In particolare, questa misura non dice nulla circa il _tipo_ dei collegamenti, una cosa che non va trascurata. Rimedieremo subito.

## Essere fondamentale: Betweeness Centrality

Talvolta un nodo può risultare importante anche quando non ha un elevato numero di nodi da e verso di esso. Vediamo per esempio la rete qui sotto, in cui i numeri nei nodi rappresentano la degree centrality:

{% include figure image_path="/assets/images/toy.butterfly.png" alt="Butterfly Network - Degree Centrality" caption="A valori alti di degree centrality (i numeri all'interno dei nodi) non necessariamente corrispondono i nodi più importanti di una rete." %}

A buon senso, è abbastanza evidente che il nodo rosso è essenziale per la tenuta della rete anche se la sua degree centrality è più bassa rispetto a quella dei nodi verdi.
Il fatto è che le interazione tra gli individui in una rete non dipendono esclusivamente dai loro vicini più prossimi. Interazioni tra due nodi non adiacenti possono essere influenzate da altri attori della rete, soprattutto se questi giacciono nei possibili percorsi tra i due e possono quindi "metterci il becco". Questi attori hanno, potenzialmente la possibilità di esercitare un controllo sulla comunicazione proprio in virtù del fatto che, affinché la comunicazione sia possibile, è necessario il loro intervento. In altre parole sono __fondamentali__ per la comunicazione.

Come sappiamo, in una rete i percorsi possibili tra gli individui che la compongono sono infiniti. E sappiamo anche la legge del telefono senza fili: quanto più un percorso è lungo, tanto più l'informazione che giungerà a destinazione sarà distorta (e non è detto che arrivi). Bisogna tenerne conto.

Ebbene, la __Betweeness Centrality__ di un nodo fa esattamente questo: dato un nodo \\( A \\) e prese tutte le coppie possibili di nodi della rete, escluso il nodo \\( A \\) stesso, la betweeness centrality di \\( A \\) è il numero di tutti i _percorsi minimi_ che vi passano attraverso.

{% figure caption:"Il nodo rosso è un passaggio obbligato per tutti i percorsi che vogliano transitare da un lato all'altro della rete, mentre nessun percorso minimo ha bisogno dei nodi azzurri. Tanto più spesso un nodo si trova a giacere su un percorso minimo che collega coppie qualsiasi di altri nodi della rete, tanto più la sua betweeness centrality sarà alta." %}
![Butterfly Network - Betweeness Centrality](/assets/images/toy.butterfly.betweeness.png)
{% endfigure %}

Certo, il nodo rosso si trova in una situazione di forte _stress_, perché è un nodo che "tiene insieme" la rete (in questi casi si dice che il nodo ha forti _costrizioni sociali_, lo vedremo in uno dei prossimi articoli), ma il rovescio della medaglia è la situazione di relativa preminenza di cui gode: come anticipavamo, esso è un _connettore fondamentale_.

Come per il caso precedente, in caso di grafi direzionati avremo a disposizione due misure: la __Directed Betweeness Centrality__, che tiene conto del verso dei collegamenti per il calcolo dei percorsi minimi, e la __Undirected Betweeness Centrality__ che, invece, li ignora.

Esprimendo con la dimensione dei nodi la betweeness centrality alla nostra rete giocattolo, questo è il risultato:

{% include {{ page.graph_betweeness }} %}

Si nota subito come, in particolare, il nodo _14_, rispetto al calcolo precedente, ora abbia una prominenza maggiore in termini di betweeness; questo grazie alla sua funzione di connessione per la sottorete verde. Questo mentre gli altri nodi rossi, che pure avevano una degree piuttosto prominente, siano praticamente spariti; il loro ruolo di mediatori è vanificato dalla connessione diretta tra il nodo 14 e il nodo 20, più breve, e la loro betweeness ne è risultata compromessa.

## Essere efficiente: Closeness Centrality

Supponiamo il caso in cui siamo interessati a individuare i nodi in una rete che hanno più probabilità di reagire prontamente a un dato evento. Più che alla quantità di connessioni o alla capacità di essere fondamentali, in situazioni come queste ci interessa, probabilmente, una misura che tenga conto della _distanza_: vogliamo che il nostro telefono senza fili non abbia tanti intermediari; vogliamo essere _al centro della scena_.

Per farlo, ci serviamo della __Closeness Centrality__. L'idea di base è questa: tanto più tali attori sono __vicini__ a tutti gli altri, tanto più _reattivi_ essi saranno perché _minore_ sarà il numero di mediatori di cui avranno bisogno per trasferire un'informazione da un punto all'altro. In senso più generale, essi sono i nodi più __efficienti__ del flusso di comunicazione della rete (in gergo di comunicazione si parla di __reach__).

La closeness centrality misura questo concetto; è funzione, come dicevamo, della __distanza__ tra nodi e più nello specifico dato \\( A \\) il nodo di cui si vuole calcolare la closeness, essa è definita come _l'inverso delle somma delle distanze tra il nodo \\( A \\) e, ad uno ad uno, tutti gli altri nodi della rete_. Questo purché tra i due nodi ci sia un percorso possibile, ovvero fanno parte dello stesso grafo connesso. In caso contrario, la distanza tra i due è infinita e il suo contributo alla closeness (l'inverso) è zero.

Data l'importanza che ricopre, il nodo di un grafo (o di un sottografo) con la closeness centrality più alta viene chiamato __centro__ del grafo (sottografo) o, più spesso, __centroide__.

Illustriamo meglio il concetto con un paio di esempi di reti illustrative.

Il nodo rosso è un passaggio obbligato per tutti i percorsi che vogliano transitare da un lato all'altro della rete, mentre nessun percorso minimo ha bisogno dei nodi azzurri. Tanto più spesso un nodo si trova a giacere su un percorso minimo che collega coppie qualsiasi di altri nodi della rete, tanto più la sua betweeness centrality sarà alta.

![Butterfly Network - Betweeness Centrality](/assets/images/toy.butterfly.closeness.2.png)


Visualizziamo, per finire, la nostra rete giocattolo, da cui ci accorgiamo di un'altra importante caratteristica della misura: _dipende moltissimo dalla topologia della rete_.
In questo caso specifico, infatti, notiamo subito che più che stravolgere la nostra idea sugli hub ci "riabilita", paradossalmente, alcuni nodi periferici (azzurri, in basso) che hanno la fortuna di essere connessi a un grande hub. Ma ne parleremo meglio quando approfondiremo lo __studio della eccentricità__ e la __eigenvector centrality__.

{% include {{ page.graph_closeness }} %}

## Conclusioni e possibili interpretazioni pratiche

La centralità è un elemento fondamentale dello studio delle reti. Oltre ad essere, nella maggior parte dei casi, rapida e facile da calcolare, ci fornisce contemporaneamente informazioni sulla struttura della rete (sia locale che globale) che sul ruolo degli attori stessi. Come visto, esistono diverse misure della centralità in base al modello di status sociale che ci interessa studiare per i nodi della rete - altre misure più sofisticate saranno oggetto di ulteriori articoli di approfondimento.

Ma come usiamo e interpretiamo nella pratica la centralità? Non esiste una lista di _do and don't_, ma questo specchietto di ipotetiche "domande" possono, probabilmente, essere risolte studiando la centralità. Prendete questa tabella _cum grano salis_ mi raccomando, in quanto si tratta solo di spunti di riflessione per spingervi a ragionare sulla centralità e non ha certamente pretesa di essere esaustiva.

Il senso di questa tabella è __provate__.

Modellate una rete, definite il significato dei collegamenti tra i nodi. senza timore che tali relazioni possano sembrare eccentriche all'inizio, e misurate la centralità.

Se siete fortunati, queste misure vi diranno già tanto sui ruoli prominenti della rete. Ma anche se ciò non fosse, avrete raccolto informazioni preziose sulla rete e sulla credibilità del vostro modello e vi suggerirà se vale la pena continuare lo studio della rete o se dovete rivedere le vostre ipotesi.

La centralità, da questo punto di vista, è un vero coltellino svizzero.

|Misura di Centralità  |  Interpretazione                | Possibile Quesito                                                                                               |
|:---------------------|--------------------------------:|----------------------------------------------------------------------------------------------------------------:|
|Degree                | Nodi raggiungibili direttamente | Nella rete degli impresari musicali, chi di essi darà maggiori garanzie di riempire il cartellone di un evento? |
|Betweeness            | Nodi che fungono da mediatori   | In una rete di spie, attraverso quale di esse passerà il maggior numero di informazioni?                        |
|Closeness             | Nodi "rapidi" e/o efficienti    | In una rete di relazioni sessuali, quanto velocemente si diffonderà una epidemia a partire dal paziente zero?   |
