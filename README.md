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
La cartella APP contiene l'applicaizone python Flask che è composta da 3 containers:

- apygateway: è il punto di accesso dei due altri servizi (API), mappato sulla porta 5000 permette di indirizzare le chiamate HTTP GET ai paths /service1 e /service2
- service1: il servizio 1, mappato sulla porta 5001. Restituisce una stringa json.
- service2: il servizio 2, mappato sulla porta 5002. Eestituisce una stringa json.

<img src="Img/MicroserviceDiagram.png" width="40%">

<h3> Inf </h3>
In Inf sono presenti due cartelle:

- TerraformInf
- AnsibleConf


<h4> TerraformInf </h4>

All'interno di TerraformInf è presente il file Terraform per il provisioning dell'infrastruttura AWS Lightsail secondo un'approccio IaC, la quale è composta da:
- 1 istanza Amazon Linux 2, la quale serve da server di monitoraggio Nagios sull'infrastruttura.
- 1 indirizzo ip statico da collegare all'istanza.
- 1 container service con due nodi, che ospiterà l'applicazione microservizi python Flask.
 <img src="Img/TerraformApply.png" width="50%">
  <img src="Img/InfAWS.png" width="50%">

<h4> AnsibleConf </h4>

La cartella AnsibleConf contiene il file Ansible per l'installazione e configurazione del server di monitoraggio Nagios. <br>
La configurazione prevede sia le sonde di defualt sulla stessa istanza (localhost) che l'aggiunta di un nuovo host (my-container-service-1) con una sonda sull'endpoint del container service (http_check). <br>
Inoltre è stato configurato il redirect Apache dalla root del sito al path /nagios. Così da poter accedere direttamante dall'IP pubblico. <br>
  <img src="Img/Nagios.png" width="80%">

<h3> Test </h3>
In Test ci sono dei banali unit test sugli endpoints dei servizi. Verifica solo se lo status di risposta è 200.
  <img src="Img/Service1.png" width="60%">
    <img src="Img/Service2.png" width="60%">

<h3> workflows </h3>

La cartella workflows contiene la CICD pipeline. Quando viene fatto un push sulla cartella App provvede a caricare in locale il container, fare i test e infine pusha l'immagine al container service di AWS.
Il deploy è manuale direttamante su console AWS.

  <img src="Img/CICDGitHubAction.png" width="80%">






  
