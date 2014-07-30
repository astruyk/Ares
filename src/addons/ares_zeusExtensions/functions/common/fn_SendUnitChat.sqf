_unit = _this select 0;
_channel = _this select 1;
_message = _this select 2;

switch(_channel) do {
	case "Group": {
		_unit groupChat _message;
	};
	case "Side": {
		_unit sideChat _message;
	};
	case "Global": {
		_unit globalChat _message;
	};
};