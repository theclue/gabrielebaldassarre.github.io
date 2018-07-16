---
title: "Una rete sociale fatta di comunità"
excerpt: "L'esperimento dei sei gradi di separazione ci conferma che il mondo è sorprendentemente _piccolo_ e _ben connesso_. Recentemente, però, si è scoperto che le reti sociali umane presentano una caratteristica ancora più affascinate, fondamentale per la loro stessa sopravvivenza: l'innata propensione ad organizzarsi in community."
header:
  overlay_image: /assets/images/community-network-overlay.png
  overlay_filter: 0.5
graph_: "graphs/smallworld-example-bare.html"
---

Nel corso di tutto il XX Secolo, i sociologi e gli studiosi di topologia e di reti ci hanno deliziato con modelli non solo sempre più credibili e realistici per descrivere una rete sociale, ma anche con sorprendenti similitudini e simmetrie con tante reti spontaneamente presenti in natura, in una sorta di elegante rappresentazione unificata della realtà.

Il caso più noto è certamente quello della [Teoria del mondo piccolo](https://it.wikipedia.org/wiki/Teoria_del_mondo_piccolo), quella dei sei gradi di separazione per intenderci, e della [Rete Small-World](https://en.wikipedia.org/wiki/Small-world_network) da essa descritta. Accompagnato da un [esperimento non proprio rigoroso](https://it.wikipedia.org/wiki/Sei_gradi_di_separazione), ma goloso dal punto di vista mediatico, qualche pellicola cinematografica e, in tempi più recenti, un po' di intrigo complottistico in salsa social, il modello è anche uno dei primi che si studia in Social Network Analysis. Ebbene, sotto opportune condizioni lo _Small-World_ si ritrova in tante reti, naturali e non, come quelle descritte dai neuroni del cervello, le reti di diffusione dell'energia elettrica, i commutatori telefoni, ecc., e questo ha contribuito non poco alla sua attrattiva per i non addetti ai lavori.

Sfortunatamente per gli hippie e per i fisici, però, il XXI Secolo si è aperto con una serie di studi che ci hanno mostrato una realtà un po' più complessa, che rompe, almeno per ora, la simmetria con neuroni, telefoni e relé e, forse, fa perdere un po' di fascino al tutto. Le reti sociali umane sono sì delle reti _Small-World_, ma hanno anche alcune caratteristiche addizionali che il modello dei sei gradi di separazione è incapace di descrivere.

Ma prima di parlare di questo modello più evoluto, vediamo innanzitutto brevemente come si è chiuso il XX Secolo in casa dei sociologi.

{% include figure image_path="/assets/images/stanley-milgram.jpg" alt="Stanley Milgram" caption="Stanley Milgram, lo psicologo statunitense che, nell'ambito dell'arcinoto esperimento, nel 1967 spedì lettere in giro per tutti gli Stati Uniti e dimostrò che viviamo in un mondo piccolo. Non tutti sanno, però, che né lui né i suoi collaboratori formalizzarono quanto appreso empiricamente dall'esperimento. Solo nel 1998 i matematici [Duncan J. Watts](https://it.wikipedia.org/wiki/Duncan_J._Watts) e [Steven Strogatz](https://it.wikipedia.org/wiki/Steven_Strogatz), all'epoca entrambi alla Cornell University, colmarono con un rigoroso modello matematico la lacuna dell'illustre, e discusso, predecessore (fonte: [Psychology Unlocked](http://www.psychologyunlocked.com/stanley-milgram/))." %}

## Cosa già sappiamo: le tre caratteristiche di una rete sociale

- tre caratteristiche delle reti sociali
- la quarta caratteristica
- come si presenta
- il modello
- esempi di reti reali
