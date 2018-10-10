
def trader_des_jour(shares)
	i = 0;
	nom_entreprise = shares.flat_map { |day_table| day_table.keys }.uniq
	tabl_ord = nom_entreprise.map { |name| shares.map { |day_table| day_table[name] } }

	while i < tabl_ord.length
		trader_du_dimanche(tabl_ord[i], i, nom_entreprise);
		i += 1
	end
end

def trader_du_dimanche(tabl_ord, i, nom_entreprise)

	profit = 0;
	achat = nil;
	vente = nil;

	#établir le jour où l'on peut acheter
	(0...(tabl_ord.length - 1)).each do |jour_achat|
		#établir le jour où l'on peut vendre
		((jour_achat + 1)... tabl_ord.length).each do |jour_vente|
			#regarder le profit entre les 2 jours
			prix = tabl_ord[jour_vente] - tabl_ord[jour_achat];

			if prix > profit
				achat = jour_achat;
				vente = jour_vente;
				profit = prix;
			end
		end
	end

	puts "Entreprise #{nom_entreprise[i]} : [Meileur jour pour acheter : #{achat}, Meileur jour pour vendre : #{vente}] 
		  # Prix de vente : #{tabl_ord[vente]}$ - Prix d'achat : #{tabl_ord[achat]}$ == Marge de #{profit}$";
end

shares = [{ :GOO => 15, :MMM => 14, :ADBE => 12, :EA=> 13, :BA => 8, :KO => 10, :XOM => 20, :GPS => 7, :MCD => 11, :DIS => 15, :CRM => 6, :JNJ => 10 },
	{ :GOO => 8, :MMM => 20, :ADBE => 3, :EA=> 10, :BA => 5, :KO => 19, :XOM => 12, :GPS => 6, :MCD => 15, :DIS => 9, :CRM => 10, :JNJ => 17 },
	{ :GOO => 3, :MMM => 8, :ADBE => 15, :EA=> 5, :BA => 10, :KO => 5, :XOM => 15, :GPS => 13, :MCD => 10, :DIS => 18, :CRM => 5, :JNJ => 14 },
	{ :GOO => 17, :MMM => 3, :ADBE => 6, :EA=> 9, :BA => 15, :KO => 6, :XOM => 8, :GPS => 1, :MCD => 10, :DIS => 15, :CRM => 18, :JNJ => 3 },
	{ :GOO => 8, :MMM => 18, :ADBE => 4, :EA=> 6, :BA => 15, :KO => 18, :XOM => 3, :GPS => 12, :MCD => 19, :DIS => 3, :CRM => 7, :JNJ => 9 },
	{ :GOO => 10, :MMM => 12, :ADBE => 8, :EA=> 3, :BA => 18, :KO => 20, :XOM => 5, :GPS => 11, :MCD => 3, :DIS => 9, :CRM => 8, :JNJ => 15 },
	{ :GOO => 17, :MMM => 14, :ADBE => 2, :EA=> 17, :BA => 7, :KO => 13, :XOM => 1, :GPS => 15, :MCD => 15, :DIS => 10, :CRM => 9, :JNJ => 17 }];

trader_des_jour(shares);