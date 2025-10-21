return {
	cmd = { "jdtls" },

	settings = {
		java = {
			configuration = {
				runtimes = {
					{
						name = "JavaSE-1.8",
						path = "/usr/lib/jvm/java-8-openjdk",
					},
					{
						name = "JavaSE-25",
						path = "/usr/lib/jvm/default",
						default = true,
					},
				},
			},
		},
	},

	init_options = {
		bundles = {},
	},
}
