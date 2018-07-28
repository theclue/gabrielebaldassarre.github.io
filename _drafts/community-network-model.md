---
title: "Una rete sociale fatta di comunità"
excerpt: "L'esperimento dei sei gradi di separazione ci conferma che il mondo è sorprendentemente _piccolo_ e _ben connesso_. Recentemente, però, si è scoperto che le reti sociali umane presentano una caratteristica ancora più affascinate, fondamentale per la loro stessa sopravvivenza: l'innata propensione ad organizzarsi in community."
header:
  overlay_image: /assets/images/community-network-overlay.jpg
  overlay_filter: 0.5
graph_: "graphs/smallworld-example-bare.html"
---

Nel corso di tutto il XX Secolo, i sociologi e gli studiosi di topologia e di reti ci hanno deliziato con modelli non solo sempre più credibili e realistici per descrivere una rete sociale, ma anche con sorprendenti similitudini e simmetrie con tante reti spontaneamente presenti in natura, in una sorta di elegante rappresentazione unificata della realtà.

Il caso più noto è certamente quello della [Teoria del mondo piccolo](https://it.wikipedia.org/wiki/Teoria_del_mondo_piccolo), quella dei sei gradi di separazione per intenderci, e della [Rete Small-World](https://en.wikipedia.org/wiki/Small-world_network) da essa descritta. Accompagnato da un [esperimento non proprio rigoroso](https://it.wikipedia.org/wiki/Sei_gradi_di_separazione), ma goloso dal punto di vista mediatico, qualche pellicola cinematografica e, in tempi più recenti, un po' di intrigo complottistico in salsa social, il modello è anche uno dei primi che si studia in Social Network Analysis. Ebbene, sotto opportune condizioni lo _Small-World_ si ritrova in tante reti, naturali e non, come quelle descritte dai neuroni del cervello, le reti di diffusione dell'energia elettrica, i commutatori telefoni, ecc., e questo ha contribuito non poco alla sua attrattiva per i non addetti ai lavori.

Sfortunatamente per gli hippie e per i fisici, però, il XXI Secolo si è aperto con una serie di studi che ci hanno mostrato una realtà un po' più complessa, che rompe, almeno per ora, la simmetria con neuroni, telefoni e relé e, forse, fa perdere un po' di fascino al tutto. Le reti sociali umane sono sì delle reti _Small-World_, ma hanno anche alcune caratteristiche uniche.

Ma prima di parlare di questo modello più evoluto, vediamo innanzitutto brevemente come si è chiuso il XX Secolo in casa dei sociologi.

{% include figure image_path="/assets/images/stanley-milgram.jpg" alt="Stanley Milgram" caption="Stanley Milgram, lo psicologo statunitense che, nell'ambito dell'arcinoto esperimento, nel 1967 spedì lettere in giro per tutti gli Stati Uniti e dimostrò che viviamo in un mondo piccolo. Non tutti sanno, però, che prima di lui l'esistenza dello _Small-World effect_ era stata speculata dallo scrittore ungherese [Frigyers Karinthy](http://www.eastjournal.net/archives/74471) mentre [Ithiel de Sola Pool](https://en.wikipedia.org/wiki/Ithiel_de_Sola_Pool) e Manfred Kochen colmarono, nel 1978 e con un rigoroso  modello matematico, le lacune dell'illustre, e discusso, predecessore (foto: [Psychology Unlocked](http://www.psychologyunlocked.com/stanley-milgram/))." %}

## Cosa si sapeva già: le tre caratteristiche di una rete sociale

Per lungo tempo, tre sono state, in linea di principio, le caratteristiche che sembravano mettere d'accordo tutte (o quasi) le reti sociali sui quali si avevano dati attendibili. Queste caratteristiche riscontrate nelle reti hanno consentito di costruire modelli via via più complessi e realistici e che descrivono in maniera sempre più accurata la complessità delle relazioni umane.

### Viviamo in un mondo piccolo

Questa caratteristica, dimostrata empiricamente con l'esperimento di Milgram, suggerisce che _la distanza media tra due nodi qualunque della rete è relativamente piccola._ Tradotto, questo significa che, scelti due nodi della rete, essi sono connessi attraverso un numero di nodi intermedi _molto piccolo_ se confrontato con la dimensione della rete stessa.

Più precisamente, il __diametro__ della rete è, sì, proporzionale al numero di nodi, ma cresce su scala solo logaritmica rispetto al numero di nodi \\( n \\). Questo comporta che al crescere del numero di nodi di una rete, il diametro cresce, ma più lentamente.

Qui è racchiusa l'essenza dei  _sei gradi di separazione_. E' una caratteristica che non è di esclusivo appannaggio delle reti sociali, ma è stata riscontrata anche in reti di informazioni, reti tecnologiche e persino reti biologiche. Oltre ai succitati sei gradi dell'esperimento di Milgram (scesi, sembrerebbe, a 4.7 dall'avvento di Facebook), diametri contenuti il propozione alle dimensioni della rete si hanno nel World Wide Web (stimato in circa 19), nelle connesisoni neuronali e in molte altre circostanze.

### Gli amici dei miei amici sono miei amici

Così come il DNA è costruito da una sequenza di quattro basi elementari (adenina, guanina,...) così anche le reti sociali hanno le loro "basi". Queste basi sono le differenti combinazioni di collegamenti possibili tra __tre__ nodi della rete, scelti casualmente.

Il motivo per cui l'elemento più atomico di organizzazione delle comunità sociali sia il triangolo è ancora oggetto di studi e non vi ci addentreremo in questa sete. Fatto sta, che, come una catena di DNA è descritta da una lunga sequenza di basi, una rete sociale può essere descritta da una lunga _sequenza di triangoli_. Questi triangoli prendono il nome di _triadi_ o, più spesso, di __clique__ (in italiano orribilmente traducibile con 'cricca'). E queste _clique_ non sono, tipicamente, oggetti statici; le relazioni evolvono nel tempo e la struttura della rete con esso. Con essa, quindi, cambiano le clique.

{% include figure image_path="/assets/images/forbidden-triad.png" alt="Forbidden Triad" caption="Una serie di clique. In effetti, diverse possono essere le configurazioni con cui si presenta una triade aperta o chiusa. L'unica caratterizzata da una certa instabilità è quella di sinistra: la probabilità che collassi, presto o tardi, in una delle due configurazioni più a destra è molto alta." %}

Il motivo per cui avviene questa "risoluzione" della clique ha cause fisiche: minimizzazione dell'energia. Troppo dispendiosa di energie, infatti, è la situazione del nodo _A_, costretto a mantenere due canali segregati con _C_ e _B_ in una situazione di perenne stress sociale. Molto più facile risolverla o interrompendo la relazione con uno dei due vicini (_C_, in questo caso) oppure facendo sì che i due nodi isolati entrino in contatto.

La "forza" che eventualmente spinge verso la seconda delle ipotesi appena descritte è la  __transitività__ ed è una caratteristica osservabile in molte reti sociali e anche in alcune reti di informazioni (come gli scambi di email in un'azienda). Detto anche __clustering__, perché spinge la rete a organizzarsi in _grappoli_ strettamente connessi, è modellizabile con degli opportuni coefficienti che, in linea di principio, hanno lo scopo di misurare la _densità e la tipologia di clique_ in una rete.

### Follow the leader

Pensare alle reti come oggetti statici è un errore: le reti sociali si aggiornano di continuo introducendo nuovi nodi e nuovi collegamenti vengono a crearsi, mentre altri vengono recisi; solo che, talvolta, l'evoluzione della rete è lenta e le variazioni impercettibili al punto che ci sembra un oggetto statico e immutabile.

Ebbene, quando una rete sociale è in espansione, si può osservare che i nuovi nodi entranti tenderanno a estrudere collegamenti verso i nodi della rete che ne presentano già molti altri, come se la popolarità di un nodo _attirasse_ a sé i nuovi arrivati. Questo comportamento, chiamato __attaccamento preferenziale__ crea delle strutture di rete in cui pochi nodi molto influenti, gli __hub__, o se vogliamo i _leader_, detengono un numero di collegamenti attivi molto superiore alla media degli altri nodi della rete.

Capire se ci troviamo di fronte a una rete di questo tipo, che per inciso prende il nome di __scale-free__,  non è difficile: basta studiare la distribuzione della [degree centrality]({% post_url 2018-07-02-importanza-individui-rete-centralita %}) di tutti i nodi della rete. In una rete non _scale-free_ non abbiamo motivo di sospettare la presenza di _hub_ privilegiati perché la probabilità di un nodo di avere _k_ connessioni sarebbe identica per tutti i nodi della rete. E, in effetti, la degree centrality di distribuisce secondo una distribuzione simmetrica (la binomiale, nella fattispecie) attorno alla degree centrality media.

Una rete _scale-free_ munita, come detto, di _hubs_ presenterà, invece, una distribuzione con una coda molto lunga sulla destra, dove ci sono nodi con una degree centrality di molto superiore alla media. Più precisamente, la degree centrality segue la [legge di potenza](https://it.wikipedia.org/wiki/Legge_di_potenza), o __power law__.

{% include figure image_path="/assets/images/powerlaw.gif" alt="Bell-shape & Power Law" caption="La distribuzione del numero dei collegamenti dei nodi per una rete non _scale-free_ (a sinistra) con una _scale-free_ (a destra). Sull'asse delle ascisse il numero di connessioni _k_ di un nodo, sulle ordinate la percentuale di nodi tra tutti quelli della rete ad avere esattamente _k_ connessioni. In una rete non _scale-free_ si ha il tipico andamento a campana di una binomiale (o di una Poisson o anche di una normale, a seconda delle approssimazioni applicate al modello) con la maggior parte dei nodi avente un numero di nodi vicino alla media e scarsa probabilità di avere degli _hub_ o dei nodi fortemente disconessi. Una rete _scale-free_, invece, ha l'andamento tipico di una power law, con la maggior parte dei nodi ad avere poche connessioni e pochi nodi ad avere un numero di connessioni _k_ molto maggiori della media." %}

Solo una puntualizzazione sul nome: queste reti si chiamano __scale-free__ perché la pendenza della retta caratteristica del modello di regressione costruito sulla distribuzione della centralità è _invariante alla scala_,  cioè non varia al variare del numero dei nodi, come visto negli esempi qui sopra. Solo, tuttavia, questa grandezza presenta questa caratteristica, mentre tipicamente le altre grandezze caratteristiche (strutturali o attributi legati ai nodi) sono genericamente _non invarianti__.


## L'importanza delle community locali

Innanzitutto una precisazione: non è che solo nel XXI secolo i ricercatori si siano accorti che gli esseri umani tendono a individuare delle community più o meno con le altre regioni della rete. Questa è una scoperta ben più antica, con cui sociologi, antropologi e, in tempi ancor più remoti, persino filosofi si sono confrontati. Quello che, però, mancava era un'adeguata rappresentazione mediante un modello che potesse essere utilizzato in Social Network Analysis.

Un primo modello di come si vengono a creare e alimentare le community in una rete è stato il cosiddetto _modello gerarchico_, che come il modello suggerisce pensa alle community come gerarchie di dimensioni crescenti, come gli organigrammi delle aziende. Ma ben presto si è scoperto che questo modello era troppo schematico per rappresentare correttamente la realtà.

Ma è stato a partire dal 2003, con il lavoro di Mark Newman e Juyong Park, due fisici all'epoca entrambi all'University of Michingan, che 

- __Le reti sociali uman

- il modello
- esempi di reti reali
