---
Projeto: terraform-aws-syspass
Descrição: Esse projeto tem o objetivo de provisionar uma instância EC2 com disco EBS de 20GB e Elastic IP estático. Ao executar o comando "terraform apply" para criar o server, será executado o script "bootstrap.sh" para configuração inicial como setar o nome do host, redefinir a senha do usuário (admin) e mudar a configuração do ssh (sshd_config) para podermos ter acesso ssh na execução do gerenciador de configuração Ansible.
Autor: Glauber GF (mcnd2)
Data: 2022-11-03
---

# Provisionar uma instância EC2 (_Elastic Cloud Computer_) na AWS com o Terraform

![Image](https://github.com/glaubergf/terraform-aws-syspass/blob/main/pictures/tf-syspass-server-ec2.png)

## Amazon Elastic Compute Cloud [**(EC2)**](https://docs.aws.amazon.com/pt_br/AWSEC2/latest/UserGuide/concepts.html)

O Amazon EC2 oferece instâncias em uma infraestrutura de computação segura, confiável, de alta performance e redimensionável para praticamente qualquer workload.

## Amazon Elastic Block Store [**(EBS)**](https://docs.aws.amazon.com/pt_br/AWSEC2/latest/UserGuide/AmazonEBS.html)

O Amazon EBS oferece volumes de armazenamento em bloco para usar com instâncias do EC2. Ele é ideal para aplicações no estilo de banco de dados que utilizam leituras e gravações aleatórias, bem como para aplicações com alta throughput que executam leituras e gravações longas e contínuas.

## Amazon Elastic IP [**(EIP)**](https://docs.aws.amazon.com/pt_br/AWSEC2/latest/UserGuide/elastic-ip-addresses-eip.html)

O Elastic IP é um endereço IPv4 estático projetado para computação em nuvem dinâmica. Um endereço IP elástico é alocado para a conta da AWS e será seu até que você o libere.

## Provisionando com o [**Terraform**](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)

O Terraform é uma ferramenta de software livre de IaC (_Infrastructure as Code_) criada pela HashiCorp.

Ela é uma ferramenta de programação declarativa, o Terraform permite aos desenvolvedores usar uma linguagem de configuração de alto nível chamada HCL (_HashiCorp Configuration Language_) para descrever a infraestrutura na cloud ou em implementação local de estado final desejada para executar um aplicativo. Em seguida, ele gera um plano para alcançar esse estado final e executa o plano para fornecer a infraestrutura.

Vamos ver alguns aspectos sobre o projeto nos 6 arquivos fundamentais que são:

* **main.tf** - Configurar o provedor de acesso AWS com seus parâmetros como região, perfil e credenciais de acesso.

* **ec2.tf** - Setar o tipo de instância e tamanho do disco de armazenamento, escolher o sistema operacional, ligar a instância ao grupo de segurança, criar e alocar um IP estático a instância, e por fim configurar o tipo de conexão com chave de acesso AWS.

* **sg.tf** - Gerencia o grupo de segurança, cria quaisquer regras especificadas na configuração. Dessa forma, apenas as regras especificadas na configuração são criadas.

* **output.tf** - Mostra os valores de saída com informações sobre a infraestrutura criada como IP e DNS públicos.

* **variables.tf** - Inclui alguns tipos de blocos para solicitar ou publicar valores nomeados. Um valor local atribui um nome a uma expressão, para que se possa usar o nome várias vezes em um módulo em vez de repetir a expressão.

* **config/sshd_config** - Configuração modificada dos parâmetros para o acesso ssh.

## Aplicando o projeto

Para aplicar o projeto, basta executar os comandos *terraform* com as sintaxes a seguir:

* **init** - _Preparar o diretório de trabalho para outros comandos._

```
terraform init
```

* **plan** - _Mostrar as alterações exigidas pela configuração atual._

```
terraform plan
```

* **apply** - _Criar ou atualizar infraestrutura._

```
terraform apply
```

* **destroy** - _Destruir a infraestrutura criada anteriormente._

```
terraform destroy
```

Caso queira executar os comandos *apply* e/ou *destroy* sem digitar **yes** para a confirmação, acrescente nos comandos o parâmetro **--auto-approve**, assim após executar o comando será executado sem pedir a interação da confirmação, não tem volta, rs!

* **--auto-approve** - *Ignorar a aprovação interativa do plano antes de aplicar.*

```
terraform apply --auto-approve
terraform destroy --auto-approve
```

## Licença

**GNU General Public License** (_Licença Pública Geral GNU_), **GNU GPL** ou simplesmente **GPL**.

[GPLv3](https://www.gnu.org/licenses/gpl-3.0.html)

------

Copyright (c) 2022 Glauber GF (mcnd2)

Este programa é um software livre: você pode redistribuí-lo e/ou modificar
sob os termos da GNU General Public License conforme publicada por
a Free Software Foundation, seja a versão 3 da Licença, ou
(à sua escolha) qualquer versão posterior.

Este programa é distribuído na esperança de ser útil,
mas SEM QUALQUER GARANTIA; sem mesmo a garantia implícita de
COMERCIALIZAÇÃO ou ADEQUAÇÃO A UM DETERMINADO FIM. Veja o
GNU General Public License para mais detalhes.

Você deve ter recebido uma cópia da Licença Pública Geral GNU
junto com este programa. Caso contrário, consulte <https://www.gnu.org/licenses/>.

*

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>