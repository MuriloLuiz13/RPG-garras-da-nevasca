programa {
  inclua biblioteca Util --> u
  inclua biblioteca Texto --> tx
  funcao inicio() {             
    inteiro classe = 2//classe bandido
    inteiro bandido[3]
    bandido[0] = 2 //força
    bandido[1] = 15 //vida
    bandido[2] = 2 //classe

    inteiro dragao[5]
    dragao[0] = 6 //força
    dragao[1] = 50 //vida
    dragao[2] = 4 //inteligencia
    dragao[3] = 20 //MP(magic points)
    dragao[4] = 3 //classe

    inteiro classe
    cadeia nome = "", class = ""
    escreva("Bem vindo ao RPG: Garras da Nevasca, onde é contada a história de seu aventureiro, e de como ele parte em sua jornada para tentar libertar uma região de se seu algoz gelído.\n")
    enquanto(tx.numero_caracteres(nome) < 3 ou tx.numero_caracteres(nome) > 20){
      escreva("Antes de tudo, precisa estabelecer o nome e classe de seu aventureiro!\n")
      escreva("Nome: ")
      leia(nome)
      se(tx.numero_caracteres(nome) < 3){
        escreva("seu nome precisa ter pelo menos 3 caracteres\n\n")
      }
      senao se(tx.numero_caracteres(nome) > 20){
        escreva("seu nome precisa ter menos que 21 caracteres\n\n")
      }
    }
    cadeia escolhendo
    faca{
    escreva("Escolha sua classe pelos números indicados:\n1-Guerreiro\n2-Mago\n")
    leia(escolhendo)
    se(escolhendo == "1"){
      classe = 1
      escolhendo = ""
    }
    senao se(escolhendo == "2"){
      classe = 2
      escolhendo = ""
    }
    senao{
      escreva("digite um valor válido\n\n")
    }
    }enquanto(classe != 1 e classe != 2)
    inteiro personagem[6]
    se(classe == 1) {//atribuição de valores do guerreiro 
      class = "guerreiro"
      personagem[0] = 4 //força
      personagem[1] = 30 //vida
      personagem[2] = 0 //inteligência
      personagem[3] = 0 //MP(magic points)
      personagem[4] = 0 //classe
      personagem[5] = 0 //item
    }
    se(classe == 2){//atribuição de valores mago
      class = "mago"
      personagem[0] = 1 //força
      personagem[1] = 20 //vida
      personagem[2] = 5 //inteligência
      personagem[3] = 25 //MP(magic points)
      personagem[4] = 1 //classe
      personagem[5] = 0 //item
    }
    escreva("Você é um "+class+"!\n")
    u.aguarde(1000) // Sei lá oq
    escreva("Em uma taverna afastada, uma missão urgente circulava entre os aventureiros sobre a floresta encantada, agora conhecida por ser a moradia de uma temivel fera, conhecida como Dragonfrost.\n")
    u.aguarde(4000) // Aguarde
    escreva("Sem perder tempo, ", nome, " parte em sua aventura.")
    u.aguarde(3000) // Aguardar para fazer descrição mais dinâmica
    escreva("\nPorém logo na entrada da floresta um bandido o encontra.")
    u.aguarde(1500) //e
    escreva("\nÉ uma cilada!\n")
    cadeia ok = ""
    u.aguarde(1500) //Aguardar aqui também, nois pode tirar esses aguarde tudo se quiser
    enquanto(ok != "ok"){
      escreva("Digite (ok) para continuar: ")
      leia(ok)
    }
    ok = ""
    inteiro combate = combate(personagem,bandido)
    personagem[5] += u.sorteia(1,3)
    u.aguarde(3000) //Adicionado tempo de espera pós combate
    se(combate == 0){
      //Morte
      lapide()
      retorne
    }
    escreva("\n\nAgora com o bandido derrotado, o(a) ", class, " descansa durante a noite, se recuperando totalmente antes de partir para enfrentar o dragão.")//Diálogo interno mudado
    u.aguarde(3000) // 
    escreva("\nMas o bandido havia uma certa quantidade de frascos, talvez seja melhor verificar.")
    cadeia inventario = ""
    u.aguarde(5000) //Adicionado tempo de espera pós combate
    enquanto(inventario != "s" e inventario != "n"){
      escreva("\nDeseja verificar seu inventário? Escreva S/N.\n")
      leia(inventario)
    }
    se(inventario == "s"){
      escreva("Você tem "+personagem[5]+" frascos.\n")
    }
    u.aguarde(1000)
    escreva("Caminhando até a caverna, você vê a besta dormindo.")
    u.aguarde(3000) // Aguardar pra dar suspense
    escreva(" Mas acaba pisando em um graveto, acordando a fera.")
    u.aguarde(3000)
    escreva("\nVocê se prepara para o combate.\n") //Diálogo interno também mudado
    u.aguarde(1500)
    enquanto(ok != "ok"){
    escreva("Digite (ok) para continuar: ")
    leia(ok)
    }
    ok = ""
    combate = combate(personagem,dragao)
    u.aguarde(3000)
    se(combate == 1){
      escreva("\n\nVocê consegue derrotar o dragão.")
      u.aguarde(3000)
      escreva(" Libertando a região e ganhando uma recompensa suficiente para viver o restante da vida com luxo! Fim.\n")
      u.aguarde(4000)
      vitoria()
    }
    senao{
      //Morte
      lapide()
      retorne
    }
  }
  funcao inteiro combate(inteiro persona[],inteiro inimigo[]) {
    inteiro turnoP
    inteiro escolhaA
    escreva("O combate começa!\n")
    enquanto(persona[1] > 0 e inimigo[1] > 0){//loop do combate
      u.aguarde(1000)
      cadeia escolhendo
      faca{
        escreva("\nVocê tem\nHP "+persona[1]+"\nMP "+persona[3]+"\n")
        u.aguarde(500)
        escreva("Faça sua ação de acordo com o número:\n")
        escreva("1-Ataque  2-Itens\n")
        leia(escolhendo)
        se(escolhendo == "1"){
          turnoP = 1
          escolhendo = ""
        }
        senao se(escolhendo == "2"){
          turnoP = 2
          escolhendo = ""
        }
        senao{
          escreva("digite um valor válido\n")
        }
      }enquanto(turnoP != 1 e turnoP != 2)
      se(persona[4] == 1){//combate do mago
      se(turnoP == 1) {//escolha ataque
        faca{
        escreva("Qual tipo de ataque?\n1-Físico     2-Bola de Fogo (gasta 10MP)\n")
        leia(escolhendo)
        se(escolhendo == "1"){
          escolhaA = 1
          escolhendo = ""
        }
        senao se(escolhendo == "2"){
          escolhaA = 2
          escolhendo = ""
        }
        senao{
          escreva("digite um valor válido\n\n")
        }
        u.aguarde(800)
        }enquanto(escolhaA != 1 e escolhaA != 2)
        se(escolhaA == 1){//ataque mago
        inteiro dado = d20()
        escreva("\n")
        u.aguarde(500)
        escreva("Você tirou "+ dado +". ")
        u.aguarde(500)
          se(dado > 10){//cheque dado
            inteiro dano0= d4()+persona[0]
            inimigo[1] -= dano0
            escreva("Você deu "+dano0+" de dano.\n")
            u.aguarde(1000) // Aguardar pós dano
            se(inimigo[1] <=0){
              escreva("Você derrotou o inimigo!\n")
            }
            senao{
            escreva("Seu inimigo está com "+ inimigo[1] +" de HP.\n")
            }
          }
          senao {
            escreva("Você errou!\n")
          }
        }
          senao se(escolhaA == 2){//bola de fogo
            se (persona[3] >= 10) {
              inteiro dado = d20()
              escreva("\n")
              u.aguarde(500)  
              escreva("Você tirou "+ dado +". ")
              u.aguarde(500)
              se(dado >= 5){
              inteiro dano01 = d12()+persona[2]
              inimigo[1] -= dano01
              persona[3] -= 10
              escreva("Você deu "+dano01+" de dano.\n")
              u.aguarde(1000) // Aguardar pós dano
              se(inimigo[1] <= 0){
                escreva("Você derrotou o inimigo!\n")
              }
              senao{
              escreva("Seu inimigo está com "+ inimigo[1]+" de HP.\n")
                }
              // Confirmação de se inimigo morreu ou não (Mudado)
              }
              senao{
                escreva("Você errou!\n")
                persona[3] -= 10
              }
            }
            senao{
              escreva("Você não tem MP...\n")
            }
          }
          }
        senao se(turnoP == 2){//item mago
          u.aguarde(1000) // Tempo de espera adicionado, mas algo está dando errado aqui quando tenta usar item quando contra o dragão
          se(persona[5] > 0){
            persona[3] += 10
            persona[5] -= 1
            escreva("Você usou o item e recuperou 10 MP!\n")
          }
          senao{
            escreva("Você não possui itens.\n")
            }
          }
          }
          senao{//combate guerreiro
            se(turnoP == 1){
            inteiro dado = d20()
            escreva("\n")
            u.aguarde(500)
            escreva("Você tirou "+ dado +". ")
            u.aguarde(500) // Aguardar para algo aí
            se(dado > 10) {
              inteiro dano02 = d8()+persona[0]
              inimigo[1] -= dano02
              escreva("Você deu "+dano02+" de dano.\n")
              u.aguarde(1000) // Aguardar para o resultado do dano (Mudado)
              se(inimigo[1] <= 0){
                escreva("Você derrotou o inimigo!")
              }
              senao{
              escreva("Seu inimigo está com "+ inimigo[1] +" de HP.\n")
              }
              // Confirmação de se inimigo morreu ou não (Mudado)
            }
            senao{
              escreva("Você errou!\n\n")
            }
            }
            senao se(turnoP == 2){//item guerreiro
              u.aguarde(800) // Tempo de espera adicionado
              se(persona[5] > 0){
              persona[0] += 8
              persona[5] -= 1
              escreva("Você usou o item e agora se sente mais poderoso! (+8 de dano)\n")
            }
            senao{
              escreva("Você não possui itens.\n")
            }
          }
      }
      se(inimigo[1] <= 0){
        pare
      }
      senao{
        u.aguarde(1000) // Aguardar para turno do inimigo (mudado também)
        escreva("Turno do inimigo:\n")
        u.aguarde(1000) // Mesmo coiso que o anterior, mas na luta do dragão tava dando algo de errado
        se(inimigo[2] == 2){
          inteiro dado = d20()
          se(dado > 10) {
            inteiro dano03 = d6()+inimigo[0]
            persona[1] -= dano03
            escreva("O inimigo deu "+dano03+" de dano.\n")
          }
          senao{
            escreva("O inimigo errou!\n\n")
        }
        }
        senao{
          inteiro escolhendo = u.sorteia(1,2)
          se(escolhendo == 1){//garrada
            inteiro dado = d20()
            se(dado > 10){
              inteiro dano04 = d10()+inimigo[0]
              persona[1] -= dano04
              escreva("O inimigo deu "+dano04+" de dano.\n")
            }
            senao{
              escreva("O inimigo errou!\n\n")
            }
          }
          senao{//baforada
            inteiro dado = d20()
            u.aguarde(1000)
            escreva("o dragão se prepara para dar uma baforada\n")
            se(dado > 10){
              u.aguarde(1800)
              escreva("o dragão enche a sala com suas chamas\n")
              inteiro dano05 = d12()+inimigo[2]
              persona[1] -= dano05
              escreva("O inimigo deu "+dano05+" de dano.\n")
            }
            senao{
              escreva("O inimigo errou!\n")
            }
          }
        }
      }
      }
      se(persona[1] <= 0){//se vc morrer
        retorne 0
      }
      senao{
        retorne 1
      }
  }
  funcao inteiro d20(){
    retorne u.sorteia(1,20)
  }
  funcao inteiro d4(){
    retorne u.sorteia(1,4)
  }
  funcao inteiro d8(){
    retorne u.sorteia(1,8)
  }
  funcao inteiro d6(){
    retorne u.sorteia(1,6)
  }
  funcao inteiro d10(){
    retorne u.sorteia(1,10)
  }
  funcao inteiro d12(){
    retorne u.sorteia(1,12)
  }
  funcao vazio lapide(){
    escreva("É o fim.\n")
    u.aguarde(3000)
      escreva("                                 _____  _____\n")
      u.aguarde(75)
escreva("                                <     `/     |\n")
u.aguarde(75)
escreva("                                 >          (\n")
u.aguarde(75)
escreva("                                |   _     _  |\n")
u.aguarde(75)
escreva("                                |  |_) | |_\\ |\n")
u.aguarde(75)
escreva("                                |  | \\ | |   |\n")
u.aguarde(75)
escreva("                                |            |\n")
u.aguarde(75)
escreva("                 ______.______%_|            |__________  _____\n")
u.aguarde(75)
escreva("               _/                                       \\|     |\n")
u.aguarde(75)
escreva("              |             V O C Ê    M O R R E U             <\n")
u.aguarde(75)
escreva("              |_____.-._________              ____/|___________|\n")
u.aguarde(75)
escreva("                                |            |\n")
u.aguarde(75)
escreva("                                |            |\n")
u.aguarde(75)
escreva("                                |            |\n")
u.aguarde(75)
escreva("                                |            |\n")
u.aguarde(75)
escreva("                                |   _        <\n")
u.aguarde(75)
escreva("                                |__/         |\n")
u.aguarde(75)
escreva("                                 / `--.      |\n")
u.aguarde(75)
escreva("                               %|            |%\n")
u.aguarde(75)
escreva("                           |/.%%|          -< @%%%\n")
u.aguarde(75)
escreva("                           `\%`@|     v      |@@%@%%    - mfj\n")
u.aguarde(75)
escreva("                         .%%%@@@|%    |    % @@@%%@%%%%\n")
u.aguarde(75)
escreva("                    _.%%%%%%@@@@@@%%_/%\_%@@%%@@@@@@@%%%%%%")
  }
funcao vazio vitoria(){
escreva("     ⣠⠤⠤⣄⣠⡤⠤⠤⠤⠤⠤⠤⠤⠤⢤⣄⣠⠤⠤⣄⠀⠀⠀⠀\n")
u.aguarde(150)
escreva("⠀⠀⠀⡜⢁⡶⠶⢤⡇⠀⠈⠉⠉⠉⠉⠉⠉⠁⠀⠸⡦⠾⠶⡄⢳⠀⠀⠀\n")
u.aguarde(150)
escreva("⠀⠀⠀⡇⢸⠀⠀⠀⡃⠀⠀ V O C Ê⠀⠀ ⠀⡇⠀  ⠀⡇⢸ ⠀⠀\n")
u.aguarde(150)
escreva("⠀⠀⠀⢧⠘⣆⠀⠀⡇⠀⠀V E N C E U ⢰⠇⠀  ⠇⣸⠀⠀⠀\n")
u.aguarde(150)
escreva("⠀⠀⠀⠈⢦⡘⠦⣀⠹⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡞⣀⡴⠋⡰⠃⠀⠀⠀\n")
u.aguarde(150)
escreva("⠀⠀⠀⠀⠀⠙⠦⣌⡙⠻⣄⠀⠀⠀⠀⠀⠀⠀⠀⣠⠞⠋⣁⡴⠚⠁⠀⠀⠀⠀\n")
u.aguarde(150)
escreva("⠀⠀⠀⠀⠀⠀⠀  ⠉⠚⠳⣄⠀⠀⠀⠀⣠⠞⠋⠉⠉⠀⠀⠀⠀⠀⠀⠀\n")
u.aguarde(150)
escreva("⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢳⡀⠀⡼⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀\n")
u.aguarde(150)
escreva("⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡇⠸⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀\n")
u.aguarde(150)
escreva("⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡜⠀⠀⢳⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀\n")
u.aguarde(150)
escreva("⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣞⣀⣀⣀⣀⣳⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀\n")
u.aguarde(150)
escreva("⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⠉⠉⠉⠉⠉⠉⢹⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀\n")
u.aguarde(150)
escreva("⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡷⠤⠤⠤⠤⠤⠤⠼⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀\n")
u.aguarde(150)
escreva("⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠓⠒⠒⠒⠒⠒⠒⠒⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀\n")
u.aguarde(150)
escreva("⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀\n")
u.aguarde(150)
escreva("⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿")
  }
}
