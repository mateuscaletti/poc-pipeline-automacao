## POC Pipeline de Automação com Jenkins
Proof of Concept de um pipeline de automação heterogêneo (windows e linux).

#### Organização
Os diretórios são organizados da seguinte maneira:
* **jenkins/**
  * **scripts-linux/** *scripts bash necessários para execução dos testes*
  * **scripts-windows/** *scripts bat ou vbs necessários para execução dos testes*
  * *Jenkinsfile-linux*
  * *Jenkinsfile-windows*
* **projects/** *onde são armazenados em subdiretórios os componentes a serem executados*
* **results/** *diretório em que são gerados os resultados dos testes*
* **thirdparty/** *componentes de terceiros que são necessários para a execução dos testes*