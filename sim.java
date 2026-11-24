package simulacro;

public class sim {

	public static void main(String[] args) {

		String nombre [] = { "José", "Miguel", "Juan", "Pedro", "María", "Irene", "Carmen" ,"Gracia"};
		String materias [] = {"lengua", "inglés", "física" , "música"};

		double notas[][]=notas();
		System.out.print("        ");
		for(int i=0; i<materias.length;i++) {
			System.out.print(materias[i]+"               ");
		}
		System.out.println();

		for(int i=0; i<nombre.length;i++) {
			System.out.print(nombre[i]+"  ");
			for(int j=0;j<materias.length;j++) {
				System.out.print(" "+notas[i][j]+" ");
			}
			System.out.println();

		}
		System.out.println();
		double media[]=media(notas);
		double mediaMateria[]=mediaMateria(notas);

		for(int i=0;i<nombre.length;i++) {
			System.out.println("Nota media de "+nombre[i]+" = "+media[i]);
		}
		System.out.println();

		for(int i=0;i<materias.length;i++) {
			System.out.println("Nota media de "+materias[i]+" = "+mediaMateria[i]);
		}
	}

	public static double[][] notas(){
		final int ALUMNOS=8;
		final int ASIGNATURAS=4;
		double num[][];
		num= new double[ALUMNOS][ASIGNATURAS];   

		for(int i=0; i<ALUMNOS;i++) {
			for(int j=0;j<ASIGNATURAS;j++) {
				num[i][j]=Math.random()*10;
			}

		}
		return num;
	}


	
	public static double[] media(double[][] array) {
	    final int ALUMNOS = 8;
	    final int ASIGNATURAS = 4;
	    double[] medias;
	    medias= new double[ALUMNOS];

	    for (int i = 0; i < ALUMNOS; i++) {          
	        double suma = 0;
	        for (int j = 0; j < ASIGNATURAS; j++) {  
	            suma += array[i][j];
	        }
	        medias[i] = suma / ASIGNATURAS;
	    }
	    return medias;
	}


	public static double[] mediaMateria(double[][] array) {
	    final int ALUMNOS = 8;
	    final int ASIGNATURAS = 4;
	    double[] medias;
	    medias= new double[ASIGNATURAS];

	    for (int j = 0; j < ASIGNATURAS; j++) {     
	        double suma = 0;
	        for (int i = 0; i < ALUMNOS; i++) {      
	            suma += array[i][j];
	        }
	        medias[j] = suma / ALUMNOS;
	    }
	    return medias;
	}

}