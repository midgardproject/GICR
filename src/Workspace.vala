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

	public errordomain NoSuchWorkspaceException {
		INTERNAL
	}

	/**
	 * A Workspace object represents a view onto a persitent workspace within a repository. 
	 *
	 * This view is defined by the authorization settings of the Session object associated 
	 * with the Workspace object. Each Workspace object is associated one-to-one with a Session object. 
	 * The Workspace object can be acquired by calling Session.getWorkspace() on the associated Session object. 
	 */
	public interface Workspace : Object {

	}
} 
