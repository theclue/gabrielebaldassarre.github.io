---
title: "Approfondimento matematico sulla legge di potenza (power law)"
excerpt: "La legge di potenza è uno dei costrutti matematici che ricoprono massima importanza in Social Network Analysis. In questo articolo ci doteremo di tutti gli strumenti teorici e metodologici per applicarla allo studio delle reti"
header:
  overlay_image: /assets/images/powerlaw-overlay.jpg
  overlay_filter: 0.5
---

Le legge di potenza altri non è che una funzione matematica con un andamento esponenziale caratterizzato da un parametro che può essere sia negativo che positivo e che nella sua forma più generale si esprime come

$$ f(x) = ax^k $$

e di per sé non ha niente di speciale.

Diventa, però, interessante quando descrive una _distribuzione di probabilità_, ovvero la probabilità del verificarsi degli eventi misurati sull'ascissa. In questo frangente, si può osservare che tantissimi fenomeni fisici, dalla dimensione delle città a quella dei crateri da impatto, dalla magnitudine dei terremoti all'attenuazione acustiva, seguono qusto andamento. Quando applicati alla probabilità, la power law prende il nome di __Distribuzione di Pareto__ oppure __Legge di Zipf__.

Ma prima di addentrarci nello studio della legge di potenza, facciamo alcuni esempi chiarificatori di come si presentano, spesso, le grandezze in natura.

## Distribuzioni normali e distribuzioni di Pareto

Il modo più "naturale" in cui ci aspettiamo di misurare una grandezza è una distribuzione _centrale_, dove la maggior parte delle osservazioni si concentrano attorno a un valore tipico, il _valore medio_, e decadono molto velocemente in modo simmetrico ai due estremi. Molte distribuzioni, sia presenti in natura che costruite dall'uomo, hanno queste caratteristiche, che possono essere descritte, con un livello più o meno accettabile di approssimazione, con tutta una famiglia di modelli statistici, come la [distribuzione gaussiana](https://it.wikipedia.org/wiki/Distribuzione_normale), la [distribuzione binomiale](https://it.wikipedia.org/wiki/Distribuzione_binomiale) e la [quella di Poisson](https://it.wikipedia.org/wiki/Distribuzione_di_Poisson) che, dati una serie di parametri, è in grado di _spiegare_ e _descrivere_ la popolazione.

Qui sotto un paio di esempi di distribuzioni centrali.

{% include figure image_path="/assets/images/distribuzioni-centrali.svg" alt="Altezza degli uomini & Velocità media delle automobili" caption="Due esempi di distribuzioni normali, o gaussiane. Sulla destra, la distribuzione dell'altezza dei maschi americani nel censimeno del 1959-62. A sinistra, la velocità media osservata dagli autovelox montati sulle autostrade inglesi nel 2003. Entrambe si sviluppano attorno a un valore medio e mantenfono una differenza \\( x_{max} - x_{min} \\) tra i valori più grandi e più piccoli osservati relativamente modesta (fonte: [M. E. J. Newman](https://arxiv.org/abs/cond-mat/0412004))." %}

Non è detto, però, che le osservazioni si distribuiscano in modo simmetrico attorno ad un valore tipico. Alcune grandezze, infatti, si esprimono in popolazioni in cui si ha la maggioranza delle osservazioni su valori _bassi_ delle ascisse e presentano una lunga _coda_ sulla destra, con osservazioni che hanno valori della ascissa molto grandi, anche di diversi ordini di granzezza superiori. In effetti, hanno un andamento a decadimento esponenziale caratterizzato dall'esponente \\( -lambda \\). Qui sotto è riportato un esempio classico, preso direttamente dalla demoscopia.
