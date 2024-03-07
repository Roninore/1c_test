Процедура Печать(ТабДок, Ссылка) Экспорт
	//{{_КОНСТРУКТОР_ПЕЧАТИ(Печать)
	Запрос = Новый Запрос;
	Запрос.Текст =
	"ВЫБРАТЬ
	|	СправкаВоенкомат.Номер КАК Номер,
	|	СправкаВоенкомат.Дата КАК Дата,
	|	СправкаВоенкомат.ГодПоступления КАК ГодПоступления,
	|	СправкаВоенкомат.Обучающийся КАК Обучающийся,
	|	СправкаВоенкомат.Класс КАК Класс
	|ИЗ
	|	Документ.СправкаВоенкомат КАК УниверсальнаяСправка
	|ГДЕ
	|	СправкаВоенкомат.Ссылка В (&Ссылка)";
	Запрос.Параметры.Вставить("Ссылка", Ссылка);
	Выборка = Запрос.Выполнить().Выбрать();
	
	ЗапросКонстанта = Новый Запрос("Выбрать Константы.РуководительОрганизации Как Объект Из Константы");
	Руководитель = ЗапросКонстанта.Выполнить().Выбрать();
	Если Не Руководитель.Следующий() Тогда
		Сообщить("Ошибка: Не удалось получить данные о руководителе организации");
		Возврат;
    КонецЕсли;
	
	ТабДок.Очистить();

	ВставлятьРазделительСтраниц = Ложь;
	Пока Выборка.Следующий() Цикл
		Если ВставлятьРазделительСтраниц Тогда
			ТабДок.ВывестиГоризонтальныйРазделительСтраниц();
		КонецЕсли;
		
		ВыводСправкаВоенкомат(Выборка,ТабДок,Руководитель.Объект);

		ВставлятьРазделительСтраниц = Истина;
	КонецЦикла;
	//}}
КонецПроцедуры 





