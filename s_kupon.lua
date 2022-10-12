mysql = exports.mysql
local oyuncu = {}
local kupon_bakiye = 1000000 -- kupon bakiyesini belirleyin
addCommandHandler("kupon",
	function(thePlayer, cmd, kupon)
        local serial = getPlayerSerial(thePlayer)
		if not kupon then
			outputChatBox("#FF0000[!]#FFFFFFKupon kodunuzu girmediniz. #00FFFF/kupon #00FFFF[kod]", thePlayer, 0, 0, 0, true)
			return
		end
        if oyuncu[serial] and oyuncu[serial] + 60*60*60*48*1000 > getTickCount() then
		outputChatBox("#FF0000[!]#FFFFFFBu kodu bir daha kullanamazsınız", thePlayer, 0, 0, 0, true)
		return
	end
		if kupon == "MESAJ" and not getElementData(resourceRoot, "H52D-5324-F532" .. getElementData(thePlayer, "account:id")) then
			exports.global:giveMoney(thePlayer, kupon_bakiye)
			outputChatBox("#FF0000[!]#FFFFFFKuponunuzdan 1.000.000 TL kazandınız!", thePlayer, 0, 0, 0, true)
			triggerClientEvent(thePlayer, "showImage", thePlayer)
			setElementData(resourceRoot, "15357595" .. getElementData(thePlayer, "account:id"), true)
                oyuncu[serial] = getTickCount()
		else
			exports["bildirim"]:addNotification(thePlayer, "Kuponunuzu zaten bozdurdunuz veya kupon kodunuz yanlış.", "error")
		end
	end
)

function rastgeleSans (percent) -- returns true a given percentage of calls
	assert(percent >= 0 and percent <= 100) -- sanity check
	return percent >= math.random(1, 100)   -- 1 succeeds 1%, 50 succeeds 50%,
end