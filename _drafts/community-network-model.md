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

Sfortunatamente per gli hippie e per i fisici, però, il XXI Secolo si è aperto con una serie di studi che ci hanno mostrato una realtà un po' più complessa, che rompe, almeno per ora, la simmetria con neuroni, telefoni e relé e, forse, fa perdere un po' di fascino al tutto. Le reti sociali umane sono sì delle reti _Small-World_, ma hanno anche alcune caratteristiche addizionali che il modello dei sei gradi di separazione è incapace di descrivere.

Ma prima di parlare di questo modello più evoluto, vediamo innanzitutto brevemente come si è chiuso il XX Secolo in casa dei sociologi.

{% include figure image_path="/assets/images/stanley-milgram.jpg" alt="Stanley Milgram" caption="Stanley Milgram, lo psicologo statunitense che, nell'ambito dell'arcinoto esperimento, nel 1967 spedì lettere in giro per tutti gli Stati Uniti e dimostrò che viviamo in un mondo piccolo. Non tutti sanno, però, che né lui né i suoi collaboratori formalizzarono quanto appreso empiricamente dall'esperimento. Solo nel 1998 i matematici [Duncan J. Watts](https://it.wikipedia.org/wiki/Duncan_J._Watts) e [Steven Strogatz](https://it.wikipedia.org/wiki/Steven_Strogatz), all'epoca entrambi alla Cornell University, colmarono con un rigoroso modello matematico la lacuna dell'illustre, e discusso, predecessore (foto: [Psychology Unlocked](http://www.psychologyunlocked.com/stanley-milgram/))." %}

## Cosa si sapeva già: le tre caratteristiche di una rete sociale

Per lungo tempo, tre sono state, in linea di principio, le caratteristiche che sembravano mettere d'accordo tutte (o quasi) le reti sociali sui quali si avevano dati strutturali attendibili:

- __La distanza media tra due nodi qualunque della rete è relativamente piccola.__ Questo è, nella sua essenza, lo _Small-World Effect_. In pratica, questo significa che, scelti due nodi della rete, essi sono connessi atteaverso un numero di nodi intermedi _molto piccolo_ in confronto alla dimensione della rete. Più precisamente, il __diametro__ della rete cresce su scala logaritmica rispetto al numero di vertici \\( n \\) della rete stessa. Questo comporta i famosi _sei gradi di separazione_ degli Anni '60 (scesi a 4.7 dall'avvento di Facebook), il diametro del World Wide Web, 19, e molti altri.
- __I nodi tendono a presentare una grande transitività.__ Si definisce _transitività_ il comportamento di una rete in cui se esiste un collegamento da un nodo _A_ a un nodo _B_ ed esiste un collegamento tra il medesimo nodo _A_ e un nodo _C_, vi sarà un'elevata probabilità che sia presente, o che si verrà a formare in futuro, un collegamento diretto tra _B_ e _C_. Questo avviene perché, se così non fosse, _A_ vivrebbe una situazione di perenne stress sociale, dovendo gestire due relazioni e nel contempo una efficace segregazione tra _B_ e _C_. Ne risulta una rete molto connessa, ovvero caratterizzata da un elevato _coefficiente di clustering_, e un gran numero di unità sociali "atomiche" formate da tre nodi (i "triangoli" _A-B-C_ dell'esempio).

< metti foto di una forbidden triad >

- __Le reti sono dinamiche e i nodi si fanno influenzare dai leader.__ Pensare alle reti come oggetti statici è un errore: le reti sociali si aggiornano di continuo introducendo nuovi nodi e nuovi collegamenti vengono a crearsi, mentre altri vengono recisi; solo che, talvolta, l'evoluzione della rete è lenta e le variazioni impercettibili al punto che ci sembra un oggetto statico e immutabile. Ebbene, quando una rete sociale è in espansione, si può osservare che i nuovi nodi entranti tenderanno a estrudere collegamenti verso un nodo della rete che presenta già molti nodi in ingresso (ovvero ha una [degree centrality]({% post_url 2018-07-02-importanza-individui-rete-centralita %}) molto alta). Questo comportamento, chiamato __attaccamento preferenziale__ crea delle strutture di rete in cui pochi nodi molto influenti, gli _hub_, detengono la maggior parte dei collegamenti attivi. Il comportamento è da attribuirsi, in parte, all'atteggiamento __omofilo__ delle organizzazioni sociali umane: tendiamo ad instaurare connessione ai nodi simili a noi, e i più rappresentativi di un modello umano diventeranno automaticamente i più popolari.

A queste tre caratteristiche possiamo aggiungerne un'altra che, pur senza avere validità generale, è spesso presente: la __Ciclicalità__. Spiegata in poche parole: se in una rete direzionata esiste un collegamento orientato da un nodo _A_ a un nodo _B_, vi sarà  un'elevata probabilità che sia presente, o che verrà a crearsi, un collegamento orientato da _B_ ad _A_.

## L'importanza delle community locali

Innanzitutto una precisazione: non è che solo nel XXI secolo i ricercatori si siano accorti che gli esseri umani tendono a individuare delle community più o meno isolate all'interno di una rete più grande. Questa è una scoperta ben più antica, con cui sociologi, antropologi e, in tempi ancor più remoti, persino filosofi si sono confrontati.

Quello che, però, è successo a partire dal 2003, con il lavoro di Mark Newman e Juyong Park, due fisici all'epoca entrambi all'University of Michingan, è stato mettere in discussione il modo con cui le comunità erano state descritte nei modelli di analisi delle reti, ovvero attraverso una semplice clusterizzazione gerarchica che andava a creare community basate sul "peso" delle relazioni tra i nodi, via via più grandi.

< foto di un cluster gerarchico >

Ebbene, questo modello non si è dimostrato adeguato per la rappresentazione delle reti umane, almeno in senso generale; tende, infatti, a isolare i nodi periferici (e i nuovi venuti) e a dipingerli come più isolati dalla community rispetto a quanto, su base sperimentale, effettivamente si è potuto misurare. In pratica, basando la coesione di una community sul _peso_ dei collegamenti (quale che sia la misura o l'attributo scelto come peso) si manca di rappresentare alcune dinamiche che invece in una community sono ben presenti, come il [ruolo]({% post_url 2018-07-02-importanza-individui-rete-centralita %}) dei nodi centrali di una community e l'omofilia che è molto forte all'interno della community stessa.

Questi concetti, sublimano nella quarta proprietà delle reti, quella che riguarda l'importanza delle comunità locali:

- __Le reti sociali uman

- il modello
- esempi di reti reali
