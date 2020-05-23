{application, 'antenna', [
	{description, "New project"},
	{vsn, "0.1.0"},
	{modules, ['antenna_app','antenna_handler','antenna_sup']},
	{registered, [antenna_sup]},
	{applications, [kernel,stdlib,cowboy,jiffy]},
	{mod, {antenna_app, []}},
	{env, []}
]}.