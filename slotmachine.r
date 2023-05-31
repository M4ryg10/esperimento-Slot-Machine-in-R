# Definizione dei simboli e dei premi presenti nella slot machine
simboli <- c("Q", "K", "A")
premi <- c(20, 45, 80)

# Numero di rulli
num_rulli <- 3

# Inserimento dell'importo dal giocatore
importo_giocatore <- as.numeric(readline("Inserisci l'importo giocatore: "))

# Numero di simulazioni
num_simulazioni <- 100000

# Inizializza contatori per vittorie, sconfitte e soldi guadagnati
vittorie <- 0
sconfitte <- 0
soldi_guadagnati <- 0

# Simula le partite
for (i in 1 :num_simulazioni) {
  
  # Genera una combinazione casuale di simboli sui rulli
  combinazione <- sample(simboli, num_rulli, replace = TRUE)
  
  # Verifica se la combinazione è vincente
  if (length(unique(combinazione)) == 1) {
    
    # Se tutti i simboli sono uguali, assegna il premio corrispondente
    premio <- premi[which(simboli == combinazione[1])]
    vittorie <- vittorie + 1
    soldi_guadagnati <- soldi_guadagnati + premio
  } else {
    sconfitte <- sconfitte + 1
  }
}

# Calcola la probabilità di vittoria e di sconfitta
prob_vittoria <- vittorie / num_simulazioni
prob_sconfitta <- sconfitte / num_simulazioni

# Calcola i soldi guadagnati rispetto all'importo del giocatore
soldi_guadagnati_totale <- importo_giocatore * prob_vittoria * premi[1]

# Stampa dei risultati
cat("Probabilità di vittoria:", prob_vittoria, "\n")
cat("Probabilità di sconfitta:", prob_sconfitta, "\n")
cat("Soldi guadagnati rispetto all'importo giocatore:", soldi_guadagnati_totale - importo_giocatore, "euro\n")
