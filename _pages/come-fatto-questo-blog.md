---
title: "Come funziona questo blog"
permalink: /blog-architettura-contenuti-piattaforma/
excerpt: "Architettura, piattaforma, contenuti.<br />Diario di sviluppo di un blog completamente _open_."
header:
  overlay_image: /assets/images/blog-foundations-overlay.jpg
  overlay_filter: 0.3
share: true
related: false
toc: true
---

Per diversi anni, il motore sotto il cofano del mio blog è stato Wordpress, da me installato e manutenuto su un server virtuale su Digital Ocean. Ma con il passare del tempo, quella piattaforma ha tradito, secondo me, lo spirito originario ed è diventato un CMS general-purpose, mastodontico, lento e impegnativo dal punto di vista della gestione e della sicurezza. Anche solo la scelta (e il setup) del tema, operazione che in teoria dovrebbe essere quasi divertente, diventa lunga e noiosa. Tutto ciò è decisamente troppo, secondo me, per un blog, sia in termini economici che di tempo.

Quello che mi serviva era un sistema snello, che richiedesse poche risorse server per essere eseguito, zero manutenzione e preoccupazione per la security, economico ma che soprattutto __si integrasse perfettamente con i tool che utilizzo per le analisi dei dati__.

Così, dopo molte ricerche, sono arrivato all'architettura che potete vedere schematizzata qui in basso. Essa ha risolto tutti i miei problemi ed è praticamente a costo zero.

{% include figure image_path="/assets/images/gabrielebaldassarre-architettura.svg" alt="Schema architetturale del blog" %}

### My personal Dev Box

{% include figure image_path="/assets/images/gabrielebaldassarre-architettura-zoomdev.svg" alt="Schema architetturale del blog - dev box" %}

Il primo blocco funzionale dell'architettura è la mia macchina locale di sviluppo, un Apple Macintosh. Sono in molti, tra quelli che fanno il mio mestiere (il data scientist, a proposito) a usare una macchina Apple, perché sotto l'interfaccia grafica di OSX pulsa un cuore Unix che è uno strumento inestimabile per chi si trova ad analizzare dati. Il setup della postazione è fatto tutto a riga di comando e utilizzando massivamente [brew](https://brew.sh/index_it), di modo che la configurazione sia automatica e replicabile all'infinito, eseguendo [questo shell script](https://gist.github.com/theclue/c5c9a479e239058321973d9ec2fe7787).

Su tale macchina, tra le altre cose, trova posto [R](https://www.r-project.org/), che è il linguaggio che prediligo per fare Social Network Analysis (e anche tutto il resto, a dire il vero) e il suo IDE di sviluppo ideale [RStudio](https://www.rstudio.com/), più tutti i package che mi servono per le analisi tra cui non mancano praticamente mai [igraph](http://igraph.org/r/) e [tidyverse](https://www.tidyverse.org/). 

Per il comparto grafico, mi piace utilizzare [Inkscape](https://inkscape.org/it/), un software di grafica vettoriale open source molto maturo. Su mac è ancora funestato da alcuni bug fastidiosi ma sopportabili (dovuti a xquartz), ma su Windows e Linux il suo funzionamento è perfetto. Lo uso per generare diagrammi e icone che poi utilizzo nel blog dopo averli salvati in .SVG.

I post (o le pagine) del blog sono creati direttamente in RStudio sotto forma di file [RMarkdown](https://rmarkdown.rstudio.com/), ovvero in un dialetto markdown che consente di inframmezzare testo e codice scritti, appunto, in markdown con blocchi scritti in R. In questo modo, ho tutto ciò che riguarda un articolo, sia il testo che tutto il codice per condurne le analisi ad esso pertinenti (compresa la generazione grafici e plot) in un unico file. L'estensione di questi file è __.Rmd__.

Questo mi consente di migliorare il flusso di authoring e di eventuali update o correzioni degli articoli, perché elimina la necessità di copiare gli output degli script in R (risultati, tabelle, grafici,...) dalla viewport di output di RStudio all'articolo in draft e viceversa.

Naturalmente il codice R deve essere eseguito e i file .Rmd renderizzati in un formato comprensibile al web server, per poter essere pubblicati.

A questo ci pensa [knitr](https://yihui.name/knitr/), un sofisticato motore di rendering di markup che può analizzare i file RMarkdown e renderizzarli in diversi formati di uscita, come .html, pdf, ecc. Per la verità, knitr è pensato come motore di generazione di _report_, ma è flessibile abbastanza da poter essere utilizzato anche per produrre pagine per un blog, scegliendo il giusto formato di output.

Non solo, knitr è distribuito come package R, quindi la compilazione dei file .Rmd può essere fatta direttamente in RStudio.

A titolo di esempio di come funziona il flusso, questa stessa pagina è partita come un file .Rmd e quello che segue è un pezzo di codice R che, eseguito da knitr, ha automticamente generato un file SVG con il grafico e inserito il codice nella pagina, qui in basso.


{% highlight r %}
par(mar = c(4, 4, .1, .1), bg = 'transparent')
plot(cars, pch = 19, col = 'red', cex = .5)  #
{% endhighlight %}

![Grafico a dispersione del dataset Cars](/assets/figures/cars-1.svg)

Come formato di output di knitr ho impostato, come si può vedere, quello del markdown standard .Md. Tra poco sarà chiaro il perché.

Ultimo elemento presente nella mia configurazione locale è il package R [blogdown](https://bookdown.org/yihui/blogdown/), dello stesso autore di knitr, il vulcanico data scientist [Yihui Xie](https://en.wikipedia.org/wiki/Yihui_Xie). Senza scegliere in dettagli tecnici, questo package aggiunge a RStudio tutta una serie di add-in utili per facilitare la creazione di file .Rmd finalizzati ad essere pubblicati su di un blog e offre una batteria di script per facilitare la creazione e la gestione del blog direttamente da RStudio (caratteristiche che però io ho deciso di non usare).

Tutti i file prodotti da knitr e da Inkscape (.Md, .svg, ma anche i file sorgenti .Rmd, immagini, ecc.) e i file di configurazione della piattaforma di blogging (che vedremo tra un istante) sono versionati tramite git su [un repository Github](https://github.com/theclue/gabrielebaldassarre.com).

Per ciò che concerne il comparto grafico, non dovrò preoccuparmi di device presenti e futuri, di risoluzione e di immagini sgranate. Utilizzare Inkscape e avendo istruito knitr a generare tutti i grafici in formato SVG, cioè vettoriali, mi terrà al sicuro per _decenni_. L'unica accortezza è quella di sincerarmi che le (poche) immagini PNG siano retina-ready.

### Github Server

{% include figure image_path="/assets/images/gabrielebaldassarre-architettura-zoomgithub.svg" alt="Schema architetturale del blog - Github" %}

Ho sempre pensato che fosse stupido che un blog, che tutto sommato è un sito "quasi statico" (essendo aggiornato molto di rado), fosse servito attraverso CMS pensati per siti fortemente dinamici (come e-commerce, social network, forum, ecc.). D'altra parte, non è pensabile, nel 2018, aprire Dreamweaver e crearsi un sito in HTML da zero.

Così, per questo blog, ho scelto di usare [Jekyll](https://jekyllrb.com/), un CMS molto leggero scritto in [ruby](https://www.ruby-lang.org/it/), un po' hard-core, sicuramente pensato per chi sa il fatto suo. Ha tutte le funzioni che un CMS moderno, una serie di plugin essenziali ma ben testati e una caratteristica unica.

Jekyll è installato localmente.

Il suo funzionamento è semplice: lanciato il suo eseguibile in una directory che ospita un sito Jekyll (con i suoi file di configurazione, il tema, plugin, oltre naturalmente a tutto il contenuto di pagine, post, ecc.), questi si preoccuperà di _staticizzarlo_. In altre parole, di generare tutte le pagine HTML a partire da file Markdown (ecco spiegato perché ho configurato knitr in questo modo), di generare i file di archivio e l'home page, di spostare tutte le immagini nelle sottodirectory di competenza e così via.
Una volta caricata la versione statica del sito su un server Web, per esempio su Amazon, avremmo finito. Basterebbe anche un server Web economico, perché servire un sito statico non richiede molte risorse.

Ad ogni aggiornamento del sito avrei avuto, tuttavia, bisogno di rigenerare localmente la sua versione statica per poi caricalo sul server web di mia scelta. Mi sembrava un'attività noiosa e ripetitiva.

Con Github è, però, stato possibile adottare una soluzione più elegante.

Github offre, infatti, un servizio chiamato [Github Pages](https://pages.github.com/) a corredo dei repository che è stato pensato per fornire agli sviluppatori di uno spazio web per la documentazione dei codici sorgenti da essi prodotti. Interi siti, volendo.

Poiché questo servizio __supporta Jekyll__, è sufficiente un commit sul repository Github su cui versiono il sito e questo viene automaticamente rigenerato dall'istanza Jekyll in esecuzione sui server di Github Pages e, se non ci sono stati errori nel processo, pubblicato sui loro server web. E quindi online.

Tutto in automatico. E tutto gratis.

Github non è, per la verità, l'unico attore a produrre questo tipo di servizio di _continuos integration_. Ma tutte le alternative che ho vagliato richiedevano un maggiore impegno per la messa in opera degli script di build & deploy, che vanno scritti da zero. Questa versatilità spesso è utile, per esempio se si preferisce che il deploy sia fatto su server che non siano quelli di Github Pages, magari su soluzioni a pagamento più performanti. Questo blog non ha i volumi di traffico tali da giustificare questo lavoro, così sono rimasto su Github e ho risparmiato tempo e soldi.
{: .notice--primary}

### Cloudflare

{% include figure image_path="/assets/images/cf-logo-h.svg" alt="Cloudflare Logo" %}

Per quanto affidabile, Github Pages è pur sempre un servizio gratuito e si sa che i servizi gratuiti, prima o poi, inciampano. Fortunatamente ho scoperto i servizi davvero interessanti offerti da [Cloudflare](https://www.cloudflare.com/it-it/).

I servizi più utili sono innanzitutto quello di DNS Server, attraverso il quale ho potuto far puntare il nome a dominio di questo blog sul server di Gtihub Pages, e quello di caching geografico. Gestendo entrambi questi servizi, Cloudfront si preoccupa di tenere allineato un mirror del sito stesso sui loro server dislocati in diversi punti del pianeta e di servirlo ai visitatori dai nodi più vicini geograficamente, riducendo il carico sul server sorgente (Github). La versione gratuita del servizio ha diverse limitazioni, ma è del tutto adeguata per un blog personale (e per la verità, lo sarebbe anche per siti ben più complessi e importanti).

Per finire, avrete notato che questo blog è servito tramite https.

Anche questo è un servizio messo a disposizione da Cloudflare, che si preoccupa di emettere (sempre gratis) un certificato SSL per i siti dei suoi utenti e di ridirezionare, impostando il loro proxy, tutte le connessioni su https (se penso a quanto costava avere un sito in https solo 3 anni fa mi vengono i brividi)

### Analytics e Privacy

{% include figure image_path="/assets/images/eu_gdpr.svg" alt="European General Data Processing Regulation" %}

Avrete notato che su questo sito _non vi è alcuna cookie policy_, né tanto meno la noiosa barra di presa visione che affligge noi europei da qualche anno. Non è una svista; ci tengo alla privacy dei miei visitatori così come tengo alla mia.

Su questo sito raccolgo dei dati di traffico attraverso Google Analytics. Non posso non farlo, è il mio mestiere cercare di capire qualcosa dai numeri. Ma lo faccio in modo rispettoso e rigido, al punto che non ho bisogno di documentare le condizioni perché non c'è niente da documentare:

* Il sito supporta la [direttiva Do Not Track](https://it.wikipedia.org/wiki/Do_Not_Track). Quasi nessun sito lo fa, perché non è obbligatoria, ma i browser moderni la implementano tutti. Non c'è bisogno di impazzire stilando cookie policy o facendo comparire inutili popup: se non vuoi essere tracciato mentre navigi su questo sito, abilita la direttiva sulle impostazioni del browser e non lo sarai.
* L'indirizzo IP non è salvato su Google Analytics. Per default lo è, anche se non è visualizzabile in chiaro nei report, e la legge non è chiara a riguardo. Io, però, ho preferito disabilitarlo perché _non serve a niente_. La sua utilità massima è consentire di stilare i report geografici, costruiti geolocalizzando gli IP. Inutile in senso assoluto, ancora di più in un blog scritto esclusivamente in italiano.

E, come avrete visto, non ci sono banner su questo sito. E, quindi, non ci sono cookie di profilazione.

### Get involved

L'intera architettura, il blog, il suo contenuto, hanno una caratteristica in comune: sono _open_. Tutti i codici sorgenti, non solo del blog Jekyll ma anche dei contenuti degli articoli, così come gli stessi script in R sono disponibili [sul repository su Github di cui abbiamo parlato](https://github.com/theclue/gabrielebaldassarre.com) e sono rilasciati su licenza MIT, che è una licenza molto permissiva.

Questo blog funziona come un progetto _open source_ in cui tutti vengono ascoltati e posso portare il proprio punto di vista.

Credo che i blog a carattere scientifico, e questo in modo particolare, abbiano solo da guadagnare da un approccio libero e collaborativo.

Questo significa che se trovate una inesattezza negli articoli, qualcosa che non funziona, un baco, oppure pensate che un concetto debba essere espresso meglio, o che abbia detto una scemenza cosmica o, ancora meglio, volete pubblicare qualcosa, anche un intero articolo, non tenetevi la cosa per voi.

[Potete segnalarmelo](https://github.com/theclue/gabrielebaldassarre.com/issues), certo.

Ma ancora meglio, potete [fare il fork del repository](https://help.github.com/articles/fork-a-repo/), modificare ciò che ritenete giusto e pubblicare qui ciò che avete scritto attraverso una [pull request](https://help.github.com/articles/creating-a-pull-request/). O usarlo per i vostri scopi, se fossero diversi.

Io trovo che sia una cosa fantastica. Voi no?
