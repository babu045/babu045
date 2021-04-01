pipeline {
agent any
stages {
   stage('Git Check out') {
       steps {
          git 'https://github.com/babu045/babu045.git'  
       }
      }
   stage('Development') {
        steps {
		    echo "executing deploy.sh file";
		    sh 'chmod 755 ./deploy.sh'
		    sh ('./deploy.sh')
		}
	  }
	
	stage('Test') {
	    steps {
		    echo " Deploy successful on Test";
		}
	  }
	
	stage('Preprod') {
	    steps {
		    echo " Deploy successful on Preprod";
		}
	  }
	stage('Production') {
	    steps {
		    echo " Deploy successful on Production";
		}
	  }
	 }
     post {
	      always {
		      echo "This will always run"
		  }
     success {
	         echo "This will run on if successfull"
		  }
		  
	 failure {
	         echo "This will run on if failed"
		  }	  
		  
	 unstable {
	         echo "This will run on if the run was marked as unstable"
		  }	  
		  	  
	 changed {
	         echo "This will run only if the state of the pipeline changed"
			 echo "For example, if the Pipline was previously failing but is now successful"
		  }	  
		    
	 }
}

