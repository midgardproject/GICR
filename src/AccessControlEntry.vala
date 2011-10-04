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
	 * An AccessControlEntry represents the association of one or more Privilege
	 * objects with a specific Principal.
	 */
	public interface AccessControlEntry : Object {

		/**
		 * Returns the principal associated with this access control entry.
		 *
		 * @return java.security.Principal a Principal FIXME TODO what to do with principal type?.
		 */
		public abstract void get_principal ();

 		/**
		 * Returns the privileges associated with this access control entry.
		 *
		 * @return an array of {@link Privilege} objects.
		 */
		public abstract Privilege[] get_privileges ();
	}
}
