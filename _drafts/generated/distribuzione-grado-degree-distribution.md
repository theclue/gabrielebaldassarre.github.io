---
title: "Radiografia di una rete: il grado (degree distribution)"
excerpt: "La trama dei legami in una rete può descrivere la rete in una moltitudine di modi. Tra tutti, però, è l'analisi del _grado_ che fornisce le informazioni più preziose: classificare una rete in base alle sue proprietà e fornire indicazioni sulla sua formazione e la sua evoluzione."
header:
  overlay_filter: 0.5
  overlay_image: /assets/images/degree-distribution-overlay.jpg
  teaser: /assets/images/degree-distribution-teaser.jpg
editor_options:
  chunk_output_type: inline
---

Una rete sociale è un _sistema complesso_ perché le informazioni che fornisce sono sia relative ai suoi individui (i _nodi_ della rete) sia alle eventuali relazioni presenti tra coppie di essi (le _connessioni_) che, nel loro insieme, ne definiscono la struttura. Così come, insomma, di un nodo disponiamo di tutta una serie di attributi, ad esempio, demografici (sesso, razza, età...) che lo collocano in uno specifico segmento di individui, grazie alla struttura della rete stessa e una serie di misure, come quelle della [centralità]({% post_url SNA/2018-07-02-importanza-individui-rete-centralita %}), possiamo misurarne il ruolo, il prestigio, l'importanza, ecc.

Tra le misure derivate dalla struttura della rete, un ruolo importantissimo ricopre il __grado__ (_degree_), ovvero il numero di connessioni possedute da ciascuno dei nodi della rete. Nella sua accezione più semplice è un numero intero maggiore di zero che non tiene conto del "peso" delle relazioni né del "verso" delle stesse (reti __non direzionate__, in cui le connessioni hanno un senso _da-a_). In caso di reti __direzionate__, invece, la grandezza si sdoppia in due complementari:

* La __in-degree__, che misura il numero di connessioni __entranti__ in un nodo;
* La __out-degree__, che misura il numero di connessioni __uscenti__ da un nodo.

A titolo di esempio, quella qui sotto è una rete non direzionata di tipo [small-world]({% post_url generated/2018-08-17-reti-smallworld %}), generata casualmente; l'etichetta sotto ognuno dei nodi rappresenta, appunto, il _grado_.

![plot of chunk smallworld-degree](/assets/figures/smallworld-degree-1.svg)

![plot of chunk smallworld-degree-directed](/assets/figures/smallworld-degree-directed-1.svg)
