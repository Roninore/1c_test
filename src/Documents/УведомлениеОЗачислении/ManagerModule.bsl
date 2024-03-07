Процедура Печать(ТабДок, Ссылка) Экспорт
	//{{_КОНСТРУКТОР_ПЕЧАТИ(Печать)
	Запрос = Новый Запрос;
	Запрос.Текст =
	"ВЫБРАТЬ
	|	УведомлениеОЗачислении.Номер КАК Номер,
	|	УведомлениеОЗачислении.Дата КАК Дата,
	|	УведомлениеОЗачислении.Обучающийся КАК Обучающийся,
	|	УведомлениеОЗачислении.Класс КАК Класс,
	|	УведомлениеОЗачислении.ПриказОЗачислении КАК ПриказОЗачислении,
	|	УведомлениеОЗачислении.КлассныйРуководитель КАК КлассныйРуководитель
	|ИЗ
	|	Документ.УведомлениеОЗачислении КАК УведомлениеОЗачислении
	|ГДЕ
	|	УведомлениеОЗачислении.Ссылка В(&Ссылка)";
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
		
		ВыводУведомлениеОЗачисление(Выборка,ТабДок,Руководитель.Объект);

		ВставлятьРазделительСтраниц = Истина;
	КонецЦикла;
	//}}
КонецПроцедуры 





