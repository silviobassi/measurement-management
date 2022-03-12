# <u>**Requisitos**</u>

1. O Sistema deve cadastrar serviços com os seguintes dados: **discriminação de serviços, quantidade (unitária, metro linear, m², m³), valor unitário, verificado e descrição da verificação, quantidade de serviços executados (unitária, metro linear, m², m³)**
2. O Sistema deve somar o subtotal e total dos serviços cadastrados.
3. O Sistema deve buscar todos os serviços que estejam em processo de verificação.
4. O Sistema deve cadastrar todos os valores retirados do valor total dos serviços com os seguintes dados: **data, valor da retirada,**. O Sistema não deve permitir que os valores retirados sejam maiores que o total dos serviços.
5. O Sistema deve buscar o total das retiradas.
6. O Sistema deve buscar o total de retirada pendente subtraindo o total das retiradas do valor total dos serviços. Não deve permitir retiradas quando estas excederem o valor total dos serviços.
7. O Sistema deve somar o total de serviços executados, subtrai-los ao total de valores retirados e dar um alerta da pendência de valores pendentes ou não as retiradas.