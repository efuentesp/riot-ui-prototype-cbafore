<submit-button>
  <a href={opts.to} class={ btnType() }><i class={ btnIcon() }></i> { btnLabel() }</a>
	<script>
		this.goToRef = function(){
			toRef(opts.to);
		};

    var buttons = [
      { type: "create", button: { label: "Guardar", class: "btn btn-info float-right btn-style-citi", icon: "" } },
      { type: "update", button: { label: "Guardar", class: "btn btn-info float-right btn-style-citi", icon: "" } },
      { type: "delete", button: { label: "Eliminar", class: "btn btn-info float-right btn-style-citi", icon: "" } },
      { type: "unknown", button: { label: "...", class: "btn btn-info float-right btn-style-citi", icon: "" } },
      { type: "return", button: { label: "Cancelar", class: "afobnmx_bott", icon: "" } },
      { type: "add", button: { label: "", class: "btn btn-info float-right btn-style-citi", icon: "" } },
  	  { type: "search", button: { label: "Buscar", class: "btn btn-info float-right btn-style-citi", icon: "" } },
  	  { type: "custom", button: { label: opts.caption, class: "btn btn-info float-right btn-style-citi", icon: opts.icon } }
    ];

    this.btnLabel = function() {
      switch (opts.action) {
        case 'create':
          return buttons[0].button.label;
          break;
        case 'update':
          return buttons[1].button.label;
          break;
        case 'delete':
          return buttons[2].button.label;
          break;
        case 'return':
          return buttons[4].button.label;
          break;
        case 'add':
          return buttons[5].button.label;
		  break;
		case 'search':
          return buttons[6].button.label;
          break;
		case 'custom':
          return buttons[7].button.label;
          break;
        default:
          return opts.caption;
      }
    }

    this.btnType = function() {
      switch (opts.action) {
        case 'create':
          return buttons[0].button.class;
          break;
        case 'update':
          return buttons[1].button.class;
          break;
        case 'delete':
          return buttons[2].button.class;
          break;
        case 'return':
          return buttons[4].button.class;
          break;
        case 'add':
          return buttons[5].button.class;
          break;
		case 'search':
          return buttons[6].button.class;
          break;
		case 'custom':
          return buttons[7].button.class;
          break;
        default:
          return buttons[3].button.class;
      }
    }

    this.btnIcon = function() {
      switch (opts.action) {
        case 'create':
          return buttons[0].button.icon;
          break;
        case 'update':
          return buttons[1].button.icon;
          break;
        case 'delete':
          return buttons[2].button.icon;
          break;
        case 'return':
          return buttons[4].button.icon;
          break;
        case 'add':
          return buttons[5].button.icon;
          break;
		case 'search':
          return buttons[6].button.icon;
          break;
		case 'custom':
          return buttons[7].button.icon;
          break;
        default:
          return buttons[3].button.icon;
      }
    }
	</script>
</submit-button>
