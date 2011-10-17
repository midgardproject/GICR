/* 
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU Lesser General Public License as published
 * by the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */

namespace GICR {

	/**
	 * SimpleCredentials implements the Credentials interface and represents simple
	 * user ID/password credentials.
	 */
	public class SimpleCredentials : GLib.Object, Credentials {

		private string userID = null;
		private string password = null;
	
		/**
		 * For given userID and passwor, create new credentials object.
		 *
		 * @param userID, a user's ID to set
		 * @param password, a usre's password to set
		 */
		public SimpleCredentials (string userID, string password) {
			this.userID = userID;
			this.password = password;
		} 

		/**
		 * Get user's identifier
		 */ 
		public string get_user_id () {
			return this.userID;
		}

		/**
		 * Get user's password
		 */
		public string get_password () {
			return this.password;
		}

		/**
		 * Stores an attribute in this credentials instance.
		 * 
		 * @param name a String specifying the name of the attribute
		 * @val the value to be stored
		 */
		public void set_attribute (string name, Value val) {
			throw new RepositoryException.INTERNAL ("Not supported");
		}

		/**
		 * Returns the value of the named attribute as an Object, or null if no attribute of the given name exists. 
		 *
		 * @param name a String specifying the name of the attribute 
		 * @return value of the attribute, or null if the attribute does not exist
		 */
		public Value? get_attribute (string name) {
			throw new RepositoryException.INTERNAL ("Not supported");
		}
	
		/**
		 * Removes an attribute from this credentials instance. 
		 *
		 * @param name a String specifying the name of the attribute to remove
		 */
		public void remove_attribute (string name) {
			throw new RepositoryException.INTERNAL ("Not supported");
		}

		/**
		 * Returns the names of the attributes available to this credentials instance. 
		 * This method returns an empty array if the credentials instance has no attributes available to it. 
		 *
		 * @return an array containing the names of the stored attributes
		 */
		public string[] get_attribute_names () {
			throw new RepositoryException.INTERNAL ("Not supported");
		}
	}
}
