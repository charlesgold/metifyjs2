var metify = {
	version: '2.0.0'
	,appInit: function(){
		this.runApp();
	}
	,appData: {
		//remove or hide
		hideMode: 'remove'
	}
	,mfClass: 'metify'
	,mfRawContent: 'mf-content-raw'
	,mfMetaKeys: 'mf-meta-key'
	,runApp: function(){
		var _this = this;

		//see if we should do anything.
		if(this.metifyCheck()>0){
			this.metifyIt();
		}
		this.removeRaw();
	}
	,metifyCheck: function(){
		var m = document.getElementById(this.mfRawContent).getElementsByClassName(this.mfClass);
		//*set object which holds metas (elem with metify class) DOM
		this.appData.meta = m;		
		return m.length;
	}
	,metifyIt: function(){
		//interate through metify elements		
		for(var i=0;i<this.appData.meta.length;i++){
			//get metaKey
			var mK = this.appData.meta[i].getAttribute(this.mfMetaKeys);
			//get metaValue
			var mV = this.appData.meta[i].innerHTML;
			//set elements with matching IDs
			this.setMetas(mK, mV);
		}
	}
	,setMetas: function(mK, mV){
		if(document.getElementById(mK)){
			var mkMatch	=	document.getElementById(mK);
			mkMatch.innerHTML = mV;
		}
	}
	,removeRaw: function(){
		var hide = this.appData.hideMode;
		var rawC = document.getElementById(this.mfRawContent);
		if(hide!='hide'){
			rawC.style.display = 'none';
		} else {
			rawC.remove();
		}
	}
};

metify.appInit();