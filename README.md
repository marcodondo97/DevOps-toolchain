# DevOps-demo

<h2> Introduzione </h2>
In questo repo è presente una dimostrazione minimale di una DevOps toolchain per una applicazione microservizi scritta in python.

Sono presenti 4 cartelle:

- App: contiene l'applicazione microservizi Docker scritta con Flask python.
- Inf: contiene il file Terraform con l'infrastruttura AWS Lightsail e il file Ansible per configurazione del server di monitoraggio Nagios.
- Test: contiene gli unit test dei 3 microservizi python.
- workflows: contiene la CICD (delivery) pipeline.

<h2> Descrizione delle cartelle </h2>

<h3> App </h3>
L'applicaizone python Flask è composta da 3 containers:

- apygateway: è il punto di accesso dei due altri servizi (API), mappato sulla porta 5000 permette di indirizzare le chiamate HTTP GET ai paths /service1 e /service2
- service1: il servizio 1, mappato sulla porta 5001. Restituisce una stringa json.
- service2: il servizio 2, mappato sulla porta 5002. Eestituisce una stringa json.

<h3> Inf </h3>
Sono presenti due cartelle:

- TerraformInf
- AnsibleConf


<h4> TerraformInf </h4>

Qui è presente il file Terraform per il provisioning dell'infrastruttura AWS Lightsail secondo un'approccio IaC, la quale è composta da:
- 1 istanza Amazon Linux 2, la quale serve da server di monitoraggio Nagios sull'infrastruttura.
- 1 indirizzo ip statico da collegare all'istanza.
- 1 container service con due nodi, che ospiterà l'applicazione microservizi python FLask.

<h4> AnsibleConf </h4>

Contiene il file Ansible per l'installazione e configurazione del server Nagios.
La configurazione prevede sia le sonde di defualt sullo stessa istanza che l'aggiunta di una semplice sonda (http_check) sull'endpoint del container.

<h3> Test </h3>
Contiene dei banali unit test sugli endpoints dei servizi. Verifica solo lo status di risposta è 200.

<h3> workflows </h3>

Contiene la CICD pieleine. Quando viene fatto un push sulla cartella App provvede a caricare in locale il container, fare i test e infine pusha l'immagine al container service di AWS.
Il deploy è manuale direttamante su console AWS.






  
