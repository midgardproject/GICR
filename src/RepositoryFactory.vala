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
	 * RepositoryFactory is an interface for factory class implementations for
	 * Repositories.
	 */
	public interface RepositoryFactory : Object {

		/**
		 * Attempts to establish a connection to a repository using the given
		 * parameters.
		 *
		 * Parameters are passed in an array of key/value pairs. The keys are not
		 * specified by JCR and are implementation specific.
		 * However, vendors should use keys that are namespace qualified in the
		 * php style to distinguish their key names. For example an address
		 * parameter might be jackalope.jackrabbit_url.
		 *
		 * The implementation must return null if it does not understand
		 * the given parameters. The implementation may also return null if a default
		 * repository instance is requested (indicated by null parameters) and this
		 * factory is not able to identify a default repository. An implementation
		 * should throw an RepositoryException if it is the right factory but has
		 * trouble connecting to the repository.
		 *
		 * @param parameters string key/value pairs as repository arguments or null if a client wishes
		 *                               to connect to a default repository.
		 * @return Repository a repository instance or null if this implementation does
		 *                                    not understand the passed parameters
		 * @throws RepositoryException if no suitable repository is found or another error occurs.
		 */
		public abstract Repository get_repository (HashTable? parameters);

		/**
		 * Get the list of configuration options that can be passed to getRepository
		 *
		 * The description string should include whether the key is mandatory or
		 * optional.
		 *
		 * @return hash map of configuration key => english description
		 */
		public abstract HashTable get_configuration_keys ();
	}
}
